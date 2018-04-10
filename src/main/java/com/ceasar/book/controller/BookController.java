package com.ceasar.book.controller;

import com.ceasar.book.model.Book;
import com.ceasar.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by dp on on 2018/4/9
 */
@Controller
@RequestMapping("/211/book")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private HttpServletRequest httpServletRequest;

    @RequestMapping("/add/Page")
    public String Page(Model model,
                          @RequestParam(value = "dictId") Integer dictId){

        model.addAttribute("belong",dictId);

        return "addBookPage";
    }

    @ResponseBody
    @RequestMapping("/add/do")
    public Map doAdd(Model model,
                        @RequestParam(value = "bookname") String bookname,
                        @RequestParam(value = "bookurl") String bookurl,
                        @RequestParam(value = "bookpassword") String bookpassword,
                        @RequestParam(value = "upman") String upman,
                        @RequestParam(value = "belong") Integer belong){

        Map map = new HashMap();
        try{
            Book book = new Book();
            book.setBookBelong(belong);
            book.setBookName(bookname);
            book.setBookUrl(bookurl);
            book.setBookPassword(bookpassword);
            book.setBookTime(new Date().getTime());
            book.setBookMan(upman);
            book.setBookDown(0);

            bookService.insert(book);
            map.put("data",1);
            map.put("msg","成功");
            return map;
        }catch (Exception e){
            map.put("data",2);
            map.put("msg","失败");
            return map;
        }
    }
}
