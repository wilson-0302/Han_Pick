package com.example.han_pick.controller;

import com.example.han_pick.service.LoginService;
import com.example.han_pick.service.BoardService;
import com.example.han_pick.vo.LoginVO;
import com.example.han_pick.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/auth")
public class LoginController {
    @Autowired
    private LoginService loginService;
    @Autowired
    private BoardService boardService;

    @GetMapping("/login")
    String login_form() {
        return "auth/login";
    }

    @PostMapping("/login_ok")
    public String login_ok(HttpSession session,
                           @ModelAttribute LoginVO loginVO) {

        if (loginVO == null || loginVO.getLoginId() == null || loginVO.getPassword() == null) {
            return "redirect:/auth/login?msg=loginfail";
        }

        // 관리자 체크: admin/admin1234
        if ("admin".equals(loginVO.getLoginId()) && "admin1234".equals(loginVO.getPassword())) {
            LoginVO admin = new LoginVO();
            admin.setLoginId("admin");
            admin.setName("관리자");
            session.setAttribute("admin", admin);
            return "redirect:/admin/dashboard";
        }

        LoginVO loginUser = loginService.login(
                loginVO.getLoginId(),
                loginVO.getPassword()
        );

        if (loginUser == null) {
            return "redirect:/auth/login?msg=loginfail";
        }

        session.setAttribute("user", loginUser);
        return "redirect:/list";
    }

    @GetMapping("/signup")
    String signup_form() {
        return "auth/signup";
    }

    @PostMapping("/signup_ok")
    public String signupOk(LoginVO vo, String passwordConfirm) {
        if (isBlank(vo.getLoginId()) ||
                isBlank(vo.getPassword()) ||
                isBlank(passwordConfirm) ||
                isBlank(vo.getName()) ||
                isBlank(vo.getEmail())) {

            return "redirect:/auth/signup?msg=empty_field";
        }


        if (!vo.getPassword().equals(passwordConfirm)) {
            return "redirect:/auth/signup?msg=password confirm fail";
        }

        try {
            loginService.join(vo);
            return "redirect:/auth/login?msg=signup success";
        } catch (DuplicateKeyException e) {
            return "redirect:/auth/signup?msg=that is already in use";
        }
    }

    @GetMapping("/profile")
    public String profile(HttpSession session, Model model) {
        LoginVO user = (LoginVO) session.getAttribute("user");
        if (user == null) {
            return "redirect:/auth/login";
        }
        model.addAttribute("user", user);
        model.addAttribute("posts", boardService.findByAuthor(user.getLoginId()));
        return "auth/profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }
}
