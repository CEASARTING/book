package com.ceasar.book.controller;

import com.ceasar.book.model.Book;
import com.ceasar.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by dp on on 2018/4/9
 */
@Controller
@RequestMapping("/test")

public class Test {
    @Autowired
    private BookService bookService;
    @RequestMapping("/hello")
    public String test(Model model){
        /*Book book = bookService.findById(1);
        System.out.println(book);*/


        model.addAttribute("topmenue","java");
        model.addAttribute("leftmenue","javabase");


        return "javabase";
    }
}
