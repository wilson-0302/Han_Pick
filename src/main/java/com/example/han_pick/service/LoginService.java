package com.example.han_pick.service;

import com.example.han_pick.vo.LoginVO;

import java.util.List;

public interface LoginService {
    public LoginVO login(String loginId, String password);
    public void join(LoginVO member);
    public List<LoginVO> findAllMembers();
    public int deleteMember(Long memberId);
}
