package com.example.han_pick.controller;

import com.example.han_pick.service.BoardService;
import com.example.han_pick.service.LoginService;
import com.example.han_pick.vo.BoardVO;
import com.example.han_pick.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private LoginService loginService;

    // 관리자 인증 체크 헬퍼 메서드
    private boolean isAdmin(HttpSession session) {
        Object admin = session.getAttribute("admin");
        return admin != null;
    }

    @GetMapping
    public String root(HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        return "redirect:/admin/dashboard";
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session, Model model) {
        // 관리자 인증 체크
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }

        // member 테이블 데이터 조회
        List<LoginVO> members = loginService.findAllMembers();
        model.addAttribute("members", members);

        // posts 테이블 데이터 조회
        List<BoardVO> posts = boardService.findAll();
        model.addAttribute("posts", posts);

        return "admin/dashboard";
    }

    // Member 삭제
    @PostMapping("/delete-member")
    public String deleteMember(HttpSession session, @RequestParam Long memberId) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        loginService.deleteMember(memberId);
        return "redirect:/admin/dashboard";
    }

    // Post 삭제
    @PostMapping("/delete-post")
    public String deletePost(HttpSession session, @RequestParam Long postId) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        boardService.delete(postId);
        return "redirect:/admin/dashboard";
    }

    // 관리자 로그아웃
    @GetMapping("/logout")
    public String adminLogout(HttpSession session) {
        session.removeAttribute("admin");
        return "redirect:/auth/login";
    }

    @GetMapping("/members")
    public String members(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        List<LoginVO> members = loginService.findAllMembers();
        model.addAttribute("members", members);
        return "admin/members";
    }

    @GetMapping("/posts")
    public String posts(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        List<BoardVO> posts = boardService.findAll();
        model.addAttribute("posts", posts);
        return "admin/posts";
    }

    @GetMapping("/recruitment")
    public String recruitment(HttpSession session, Model model) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        List<BoardVO> posts = boardService.findAll();
        // 카테고리별 통계 계산
        java.util.Map<String, Integer> categoryStats = new java.util.HashMap<>();
        for (BoardVO post : posts) {
            String category = post.getCategory() != null ? post.getCategory() : "기타";
            categoryStats.put(category, categoryStats.getOrDefault(category, 0) + 1);
        }
        model.addAttribute("categoryStats", categoryStats);
        return "admin/recruitment";
    }

    @GetMapping("/settings")
    public String settings(HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        return "admin/settings";
    }

    @GetMapping("/contest-form")
    public String contestForm(HttpSession session) {
        if (!isAdmin(session)) {
            return "redirect:/auth/login";
        }
        return "admin/contest-form";
    }
}
