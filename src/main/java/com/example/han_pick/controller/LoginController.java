package com.example.han_pick.controller;

import com.example.han_pick.service.LoginService;
import com.example.han_pick.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
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

    @GetMapping("/login")
    String login_form() {
        return "auth/login";
    }

    @PostMapping("/login_ok")
    public String login_ok(HttpSession session,
                           @ModelAttribute LoginVO loginVO) {

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

    private boolean isBlank(String s) {
        return s == null || s.trim().isEmpty();
    }

//    @PostMapping("/login_ok")
//    String login_ok(HttpSession session, @ModelAttribute LoginVO memberVO) {
//        LoginVO userinfo = (LoginVO) session.getAttribute("user");
//        if (userinfo != null) {
//            session.removeAttribute("user");
//        }
//        if (memberVO == null)
//            return "login"; // 받은 로그인 요청 정보가 없으면 login페이지로
//        if (memberVO.getLoginId().equals("admin") && memberVO.getPassword().equals("admin1234")) { // 아이디 비번이 같으면
//            session.setAttribute("user", memberVO); // 세션을 바꾸고
//            return "redirect:/list"; // list로 이동
//        } else { // 아이디 비번이 틀리면
//            return "redirect:/login/login?msg=loginfail"; // 로그인 실패 메세지와 함께 로그인 페이지로
//        }
//    }




}
