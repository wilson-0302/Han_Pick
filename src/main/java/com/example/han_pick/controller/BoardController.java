package com.example.han_pick.controller;

import com.example.han_pick.service.BoardService;
import com.example.han_pick.vo.BoardVO;
import com.example.han_pick.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class BoardController {

    @Autowired
    private BoardService boardService;

    // 목록
    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("posts", boardService.findAll());
        return "posts/list";
    }

    // 상세 (조회수 증가)
    @GetMapping("/posts/detail")
    public String detail(@RequestParam("id") Long id, Model model, RedirectAttributes redirectAttributes) {
        BoardVO post = boardService.findByIdWithIncreaseView(id);
        if (post == null) {
            redirectAttributes.addFlashAttribute("msg", "not_found");
            return "redirect:/list";
        }
        model.addAttribute("post", post);
        return "posts/detail";
    }

    // 작성 폼
    @GetMapping("/posts/new")
    public String form() {
        return "posts/form";
    }

    // 신규 등록
    @PostMapping("/posts/new")
    public String create(@ModelAttribute BoardVO post, HttpSession session, RedirectAttributes redirectAttributes) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            redirectAttributes.addFlashAttribute("msg", "login_required");
            return "redirect:/auth/login";
        }
        post.setAuthorId(user.getLoginId());
        boardService.insert(post);
        return "redirect:/list";
    }

    // 관리 화면 (목록 활용)
    @GetMapping("/posts/manage")
    public String manage(Model model) {
        model.addAttribute("posts", boardService.findAll());
        return "posts/manage";
    }

    // 수정
    @PostMapping("/posts/update")
    public String update(@ModelAttribute BoardVO post, RedirectAttributes redirectAttributes) {
        if (post.getId() == null) {
            redirectAttributes.addFlashAttribute("msg", "invalid_id");
            return "redirect:/list";
        }
        boardService.update(post);
        return "redirect:/posts/detail?id=" + post.getId();
    }

    // 삭제
    @PostMapping("/posts/delete")
    public String delete(@RequestParam("id") Long id, RedirectAttributes redirectAttributes) {
        if (id == null) {
            redirectAttributes.addFlashAttribute("msg", "invalid_id");
            return "redirect:/list";
        }
        boardService.delete(id);
        return "redirect:/list";
    }
}
