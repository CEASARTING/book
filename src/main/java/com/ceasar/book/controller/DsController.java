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
@RequestMapping("/211/book/ds")
public class DsController {
    @Autowired
    private BookService bookService;

    /**
     * 返回数据结构界面
     * @param model
     * @return
     */
    @RequestMapping("/dataStructure")
    public String dataStructure(Model model){
        model.addAttribute("topmenue","dataStructure");
        model.addAttribute("leftmenue","dataStructure");

        List<Book> books = bookService.findByBelong(Index.dsId);
        if(books==null || books.size()==0){
            model.addAttribute("dataStructure",null);
        }else
            model.addAttribute("dataStructure",books);
        return "dataStructure";
    }
}
