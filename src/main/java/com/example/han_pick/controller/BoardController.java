package com.example.han_pick.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

    @GetMapping("/list")
    public String list() {
        return "posts/list";
    }

    @GetMapping("/posts/detail")
    public String detail() {
        return "posts/detail";
    }

    @GetMapping("/posts/new")
    public String form() {
        return "posts/form";
    }

    @GetMapping("/posts/manage")
    public String manage() {
        return "posts/manage";
    }
}
