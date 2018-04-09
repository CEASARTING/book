package com.ceasar.book.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by dp on on 2018/4/9
 */
@Controller
@RequestMapping("/test")
@ResponseBody
public class Test {
    @RequestMapping("/hello")
    public String test(){
        return "hello";
    }
}
