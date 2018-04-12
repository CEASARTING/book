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
@RequestMapping("/211/book/os")
public class OsController {
    @Autowired
    private BookService bookService;

    /**
     * 返回操作系统界面
     * @param model
     * @return
     */
    @RequestMapping("/os")
    public String os(Model model){
        model.addAttribute("topmenue","os");
        model.addAttribute("leftmenue","os");

        List<Book> books = bookService.findByBelong(Index.osId);
        if(books==null || books.size()==0){
            model.addAttribute("os",null);
        }else
            model.addAttribute("os",books);
        return "os";
    }
}
