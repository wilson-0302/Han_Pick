package com.example.han_pick.service;

import com.example.han_pick.vo.LoginVO;

public interface LoginService {
    public LoginVO login(String loginId, String password);
    public void join(LoginVO member);
}
