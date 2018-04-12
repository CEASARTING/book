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
@RequestMapping("/211/book/python")
public class PythonController {

    @Autowired
    private BookService bookService;

    /**
     * 返回python界面
     * @param model
     * @return
     */
    @RequestMapping("/python")
    public String python(Model model){
        model.addAttribute("topmenue","python");
        model.addAttribute("leftmenue","python");

        List<Book> books = bookService.findByBelong(Index.pythonId);
        if(books==null || books.size()==0){
            model.addAttribute("python",null);
        }else
            model.addAttribute("python",books);
        return "python";
    }
}
