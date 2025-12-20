package com.example.han_pick.service.serviceimpl;

import com.example.han_pick.dao.LoginDAO;
import com.example.han_pick.service.LoginService;
import com.example.han_pick.vo.LoginVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginDAO loginDAO;

    // 로그인
    public LoginVO login(String loginId, String password) {
        LoginVO login = loginDAO.findByLoginId(loginId);

        if (login == null) return null; // 아이디 없음
        if (!password.equals(login.getPassword())) return null; // 비번 틀림

        return login; // 로그인 성공
    }

    // 회원가입
    public void join(LoginVO login) {
        loginDAO.insertMember(login);
    }

    // 모든 회원 조회
    public java.util.List<LoginVO> findAllMembers() {
        return loginDAO.findAllMembers();
    }

    // 회원 삭제
    public int deleteMember(Long memberId) {
        if (memberId == null) return 0;
        return loginDAO.deleteMember(memberId);
    }
}
