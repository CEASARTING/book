package com.ceasar.book.controller;

import com.ceasar.book.model.Book;
import com.ceasar.book.util.Index;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by dp on 2018/4/12.
 */
@Controller
@RequestMapping("/211/book/essay")
public class EssayController {

    @RequestMapping("/essay")
    public String frontEnd(Model model){
        model.addAttribute("topmenue","essay");
        model.addAttribute("leftmenue","essay");
        return "essay";
    }
}
