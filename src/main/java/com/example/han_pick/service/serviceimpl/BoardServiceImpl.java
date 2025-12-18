package com.example.han_pick.service.serviceimpl;

import com.example.han_pick.dao.BoardDAO;
import com.example.han_pick.service.BoardService;
import com.example.han_pick.vo.BoardVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardServiceImpl implements BoardService {

    @Autowired
    private BoardDAO boardDAO;

    @Override
    public List<BoardVO> findAll() {
        return boardDAO.findAll();
    }

    @Override
    public BoardVO findById(Long id) {
        if (id == null) return null;
        return boardDAO.findById(id);
    }

    @Override
    public BoardVO findByIdWithIncreaseView(Long id) {
        if (id == null) return null;
        BoardVO post = boardDAO.findById(id);
        if (post == null) return null;
        boardDAO.increaseViewCount(id);
        // 로컬 객체에 반영
        post.setViewCount(post.getViewCount() + 1);
        return post;
    }

    @Override
    public int insert(BoardVO post) {
        if (post == null) return 0;
        return boardDAO.insert(post);
    }

    @Override
    public int update(BoardVO post) {
        if (post == null || post.getId() == null) return 0;
        return boardDAO.update(post);
    }

    @Override
    public int delete(Long id) {
        if (id == null) return 0;
        return boardDAO.delete(id);
    }

    @Override
    public int increaseViewCount(Long id) {
        if (id == null) return 0;
        return boardDAO.increaseViewCount(id);
    }

    @Override
    public List<BoardVO> findByCategory(String category) {
        return boardDAO.findByCategory(category);
    }

    @Override
    public List<BoardVO> findByStatus(String status) {
        return boardDAO.findByStatus(status);
    }
}
