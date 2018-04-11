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
@RequestMapping("/211/book/network")
public class NetworkController {
    @Autowired
    private BookService bookService;

    /**
     * 返回计网界面
     * @param model
     * @return
     */
    @RequestMapping("/network")
    public String network(Model model){
        model.addAttribute("topmenue","network");
        model.addAttribute("leftmenue","network");

        List<Book> books = bookService.findByBelong(Index.netWorkId);
        if(books==null || books.size()==0){
            model.addAttribute("network",null);
        }else
            model.addAttribute("network",books);

        return "network";
    }
}
