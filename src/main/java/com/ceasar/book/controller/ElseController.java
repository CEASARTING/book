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
 * Created by dp on 2018/4/12.
 */
@Controller
@RequestMapping("/211/book/else")
public class ElseController {

    @Autowired
    private BookService bookService;

    /**
     * 返回其他界面
     * @param model
     * @return
     */
    @RequestMapping("/else")
    public String elseis(Model model){
        model.addAttribute("topmenue","else");
        model.addAttribute("leftmenue","else");

        List<Book> books = bookService.findByBelong(Index.elseId);
        if(books==null || books.size()==0){
            model.addAttribute("else",null);
        }else
            model.addAttribute("else",books);
        return "else";
    }
}
