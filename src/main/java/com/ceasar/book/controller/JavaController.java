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
@RequestMapping("/211/book/java")
public class JavaController {
    @Autowired
    private BookService bookService;

    /**
     * 返回Java基础界面
     * @param model
     * @return
     */
    @RequestMapping("/javabase")
    public String javabase(Model model){
        model.addAttribute("topmenue","java");
        model.addAttribute("leftmenue","javabase");

        List<Book> books = bookService.findByBelong(Index.javaBase);
        if(books==null || books.size()==0){
            model.addAttribute("javaBase",null);
        }else
            model.addAttribute("javaBase",books);

        return "javabase";
    }


    /**
     * 返回Java框架界面
     * @param model
     * @return
     */
    @RequestMapping("/frame")
    public String frame(Model model){
        model.addAttribute("topmenue","java");
        model.addAttribute("leftmenue","frame");

        List<Book> books = bookService.findByBelong(Index.javaFrame);
        if(books==null || books.size()==0){
            model.addAttribute("javaFrame",null);
        }else

            model.addAttribute("javaFrame",books);

        return "javaFrame";

    }
}
