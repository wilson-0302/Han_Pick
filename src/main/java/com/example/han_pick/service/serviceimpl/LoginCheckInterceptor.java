package com.example.han_pick.service.serviceimpl;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return false;
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
