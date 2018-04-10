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
 * Created by dp on 2018/4/10.
 */

@Controller
@RequestMapping("/211/book/frontEnd")
public class FrontEndController {
    @Autowired
    private BookService bookService;
    @RequestMapping("/frontEnd")
    public String frontEnd(Model model){
        model.addAttribute("topmenue","frontEnd");
        model.addAttribute("leftmenue","frontEnd");

        List<Book> books = bookService.findByBelong(Index.frontId);
        if(books==null || books.size()==0){
            model.addAttribute("front",null);
        }else
            model.addAttribute("front",books);

        return "front";
    }
}
