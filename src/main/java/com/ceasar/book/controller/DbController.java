package com.ceasar.book.controller;

import com.ceasar.book.model.Book;
import com.ceasar.book.service.BookService;
import com.ceasar.book.util.Index;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by dp on on 2018/4/10
 */
@Controller
@RequestMapping("/211/book/database")
public class DbController {

    @Autowired
    private BookService bookService;

    @RequestMapping("/mysql")
    public String mysql(Model model){
        model.addAttribute("topmenue","database");
        model.addAttribute("leftmenue","mysql");

        List<Book> books = bookService.findByBelong(Index.javaBase);
        model.addAttribute("mysql",books);
        return "cppbase";
    }

    @RequestMapping("/redis")
    public String redis(Model model){
        model.addAttribute("topmenue","database");
        model.addAttribute("leftmenue","redis");

        List<Book> books = bookService.findByBelong(Index.javaBase);
        model.addAttribute("redis",books);
        return "cppbase";
    }
}
