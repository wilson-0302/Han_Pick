package com.example.han_pick.dao;

import com.example.han_pick.vo.LoginVO;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Mapper
public interface LoginDAO {
    LoginVO findByLoginId(String loginId);
    void insertMember(LoginVO member);
}
