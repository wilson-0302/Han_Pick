package com.example.han_pick.service.serviceimpl;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        String requestPath = request.getRequestURI();
        
        // 관리자 페이지는 관리자 세션 체크
        if (requestPath.startsWith(request.getContextPath() + "/admin")) {
            HttpSession session = request.getSession();
            Object admin = session.getAttribute("admin");
            if (admin == null) {
                response.sendRedirect(request.getContextPath() + "/auth/login");
                return false;
            }
            return HandlerInterceptor.super.preHandle(request, response, handler);
        }
        
        // 일반 페이지는 user 세션 체크
        HttpSession session = request.getSession();
        Object obj = session.getAttribute("user");
        if (obj == null) {
            response.sendRedirect(request.getContextPath() + "/auth/login");
            return false;
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
