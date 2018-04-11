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
@RequestMapping("/211/book/cpp")
public class CppController {
    @Autowired
    private BookService bookService;

    /**
     * 返回c++界面
     * @param model
     * @return
     */
    @RequestMapping("/cppbase")
    public String cppbase(Model model){
        model.addAttribute("topmenue","c++");
        model.addAttribute("leftmenue","cppbase");

        List<Book> books = bookService.findByBelong(Index.cppBase);
        if(books==null || books.size()==0){
            model.addAttribute("cppBase",null);
        }else
            model.addAttribute("cppBase",books);

        return "cppbase";
    }
}
