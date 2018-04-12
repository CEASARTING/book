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
@RequestMapping("/211/book/ml")
public class MlController {

    @Autowired
    private BookService bookService;

    /**
     * 返回机器学习及大数据界面
     * @param model
     * @return
     */
    @RequestMapping("/ml")
    public String ml(Model model){
        model.addAttribute("topmenue","ml");
        model.addAttribute("leftmenue","ml");

        List<Book> books = bookService.findByBelong(Index.mlId);
        if(books==null || books.size()==0){
            model.addAttribute("ml",null);
        }else
            model.addAttribute("ml",books);
        return "ml";
    }

}
