package com.example.han_pick.service;

import com.example.han_pick.vo.BoardVO;

import java.util.List;

public interface BoardService {
    List<BoardVO> findAll();

    BoardVO findById(Long id);

    BoardVO findByIdWithIncreaseView(Long id);

    int insert(BoardVO post);

    int update(BoardVO post);

    int delete(Long id);

    int increaseViewCount(Long id);

    List<BoardVO> findByCategory(String category);

    List<BoardVO> findByStatus(String status);

    List<BoardVO> findByAuthor(String authorId);
}
