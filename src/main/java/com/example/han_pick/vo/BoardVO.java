package com.example.han_pick.vo;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class BoardVO {
    private int id;
    private String title;
    private String writer;
    private String category;
    private String content;
    private String img;
    private int recruitCount;
    private LocalDate deadline;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
