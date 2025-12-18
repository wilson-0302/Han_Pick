package com.example.han_pick.controller;

import com.example.han_pick.service.BoardService;
import com.example.han_pick.vo.BoardVO;
import com.example.han_pick.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import java.util.UUID;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 목록
    @GetMapping("/list")
    public String list(Model model,
                       @RequestParam(value = "q", required = false) String keyword,
                       @RequestParam(value = "category", required = false) String category,
                       @RequestParam(value = "sort", required = false, defaultValue = "latest") String sort) {
        List<BoardVO> posts = boardService.findAll();

        // 검색/카테고리 필터
        List<BoardVO> filtered = posts.stream()
                .filter(p -> {
                    if (category == null || category.trim().isEmpty()) return true;
                    if (p.getCategory() == null) return false;
                    return p.getCategory().equalsIgnoreCase(category.trim());
                })
                .filter(p -> {
                    if (keyword == null || keyword.trim().isEmpty()) return true;
                    String k = keyword.trim().toLowerCase();
                    String title = p.getTitle() == null ? "" : p.getTitle().toLowerCase();
                    String content = p.getContent() == null ? "" : p.getContent().toLowerCase();
                    return title.contains(k) || content.contains(k);
                })
                .collect(Collectors.toList());

        // 정렬
        Comparator<BoardVO> comparator = (a, b) -> {
            if ("popular".equalsIgnoreCase(sort)) {
                int av = a.getViewCount() == null ? 0 : a.getViewCount();
                int bv = b.getViewCount() == null ? 0 : b.getViewCount();
                int cmp = Integer.compare(bv, av);
                if (cmp != 0) return cmp;
            }
            // 최신순(기본)
            if (a.getCreatedAt() == null && b.getCreatedAt() == null) return 0;
            if (a.getCreatedAt() == null) return 1;
            if (b.getCreatedAt() == null) return -1;
            return b.getCreatedAt().compareTo(a.getCreatedAt());
        };
        filtered.sort(comparator);

        model.addAttribute("posts", filtered);
        model.addAttribute("keyword", keyword);
        model.addAttribute("selectedCategory", category);
        model.addAttribute("sort", sort);
        return "posts/list";
    }

    // 상세 (조회수 증가)
    @GetMapping("/posts/detail")
    public String detail(@RequestParam("id") Long id, Model model, RedirectAttributes redirectAttributes, HttpSession session) {
        BoardVO post = boardService.findByIdWithIncreaseView(id);
        if (post == null) {
            redirectAttributes.addFlashAttribute("msg", "not_found");
            return "redirect:/list";
        }
        model.addAttribute("post", post);
        LoginVO user = (LoginVO) session.getAttribute("user");
        boolean isOwner = user != null && user.getLoginId() != null && user.getLoginId().equals(post.getAuthorId());
        model.addAttribute("isOwner", isOwner);
        return "posts/detail";
    }

    // 작성 폼
    @GetMapping("/posts/new")
    public String form() {
        return "posts/form";
    }

    // 수정 폼
    @GetMapping("/posts/edit")
    public String editForm(@RequestParam("id") Long id, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("msg", "login_required");
            return "redirect:/auth/login";
        }
        BoardVO post = boardService.findById(id);
        if (post == null) {
            redirectAttributes.addFlashAttribute("msg", "not_found");
            return "redirect:/list";
        }
        if (!user.getLoginId().equals(post.getAuthorId())) {
            redirectAttributes.addFlashAttribute("msg", "forbidden");
            return "redirect:/posts/detail?id=" + id;
        }
        model.addAttribute("post", post);
        model.addAttribute("isEdit", true);
        return "posts/form";
    }

    // 신규 등록
    @PostMapping("/posts/new")
    public String create(@ModelAttribute BoardVO post,
                         BindingResult bindingResult,
                         @RequestParam(value = "file", required = false) MultipartFile file,
                         HttpSession session,
                         RedirectAttributes redirectAttributes) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("msg", "login_required");
            return "redirect:/auth/login";
        }
        if (bindingResult != null && bindingResult.hasErrors()) {
            System.out.println("[DEBUG] create() binding errors: " + bindingResult.getAllErrors());
            redirectAttributes.addFlashAttribute("msg", "bind_error");
            return "redirect:/posts/new";
        }
        System.out.println("[DEBUG] create() start - user=" + user.getLoginId() + ", title=" + post.getTitle() + ", category=" + post.getCategory());
        // 파일 업로드 처리
        if (file != null && !file.isEmpty()) {
            try {
                String uploadRoot = session.getServletContext().getRealPath("/uploads");
                if (uploadRoot == null) {
                    uploadRoot = Paths.get("uploads").toAbsolutePath().toString();
                }
                Files.createDirectories(Paths.get(uploadRoot));
                String originalName = file.getOriginalFilename();
                String ext = "";
                if (originalName != null && originalName.lastIndexOf(".") != -1) {
                    ext = originalName.substring(originalName.lastIndexOf("."));
                }
                String filename = UUID.randomUUID() + ext;
                Path target = Paths.get(uploadRoot, filename);
                file.transferTo(target.toFile());
                String ctxPath = session.getServletContext().getContextPath();
                if (ctxPath == null) ctxPath = "";
                post.setImageUrl(ctxPath + "/uploads/" + filename);
                System.out.println("[DEBUG] upload saved: " + target + " -> url=" + post.getImageUrl());
            } catch (IOException e) {
                System.out.println("[DEBUG] upload failed: " + e.getMessage());
                redirectAttributes.addFlashAttribute("msg", "upload_fail");
                return "redirect:/posts/new";
            }
        }
        post.setAuthorId(user.getLoginId());
        int inserted = boardService.insert(post);
        System.out.println("[DEBUG] create() inserted rows: " + inserted + ", postId=" + post.getId());
        return "redirect:/list";
    }

    // 관리 화면 (목록 활용)
    @GetMapping("/posts/manage")
    public String manage(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("msg", "login_required");
            return "redirect:/auth/login";
        }
        model.addAttribute("posts", boardService.findByAuthor(user.getLoginId()));
        return "posts/manage";
    }

    // 수정
    @PostMapping("/posts/update")
    public String update(@ModelAttribute BoardVO post, HttpSession session, RedirectAttributes redirectAttributes) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("msg", "login_required");
            return "redirect:/auth/login";
        }
        if (post.getId() == null) {
            redirectAttributes.addFlashAttribute("msg", "invalid_id");
            return "redirect:/list";
        }
        BoardVO existing = boardService.findById(post.getId());
        if (existing == null) {
            redirectAttributes.addFlashAttribute("msg", "not_found");
            return "redirect:/list";
        }
        if (!user.getLoginId().equals(existing.getAuthorId())) {
            redirectAttributes.addFlashAttribute("msg", "forbidden");
            return "redirect:/posts/detail?id=" + post.getId();
        }
        // 작성자 정보와 기존 이미지 URL 유지(빈 경우)
        post.setAuthorId(existing.getAuthorId());
        if (post.getImageUrl() == null || post.getImageUrl().isEmpty()) {
            post.setImageUrl(existing.getImageUrl());
        }
        boardService.update(post);
        return "redirect:/posts/detail?id=" + post.getId();
    }

    // 삭제
    @PostMapping("/posts/delete")
    public String delete(@RequestParam("id") Long id, HttpSession session, RedirectAttributes redirectAttributes) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("msg", "login_required");
            return "redirect:/auth/login";
        }
        if (id == null) {
            redirectAttributes.addFlashAttribute("msg", "invalid_id");
            return "redirect:/list";
        }
        BoardVO existing = boardService.findById(id);
        if (existing == null) {
            redirectAttributes.addFlashAttribute("msg", "not_found");
            return "redirect:/list";
        }
        if (!user.getLoginId().equals(existing.getAuthorId())) {
            redirectAttributes.addFlashAttribute("msg", "forbidden");
            return "redirect:/posts/detail?id=" + id;
        }
        boardService.delete(id);
        return "redirect:/list";
    }
}
