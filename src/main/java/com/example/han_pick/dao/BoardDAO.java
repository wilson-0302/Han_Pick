package com.example.han_pick.dao;

import com.example.han_pick.vo.BoardVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDAO {
    // 전체 게시글 조회
    List<BoardVO> findAll();
    // 단건 조회
    BoardVO findById(Long id);
    // 신규 게시글 등록
    int insert(BoardVO post);
    // 게시글 수정
    int update(BoardVO post);
    // 게시글 삭제
    int delete(Long id);
    // 조회수 증가
    int increaseViewCount(Long id);
    // 카테고리별 조회
    List<BoardVO> findByCategory(String category);
    // 상태별 조회
    List<BoardVO> findByStatus(String status);
}
