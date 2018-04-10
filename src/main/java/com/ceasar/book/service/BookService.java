package com.ceasar.book.service;

import com.ceasar.book.mapper.BookMapper;
import com.ceasar.book.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by dp on on 2018/4/9
 */
@Service
@Transactional
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public Book findById(int bookId){
        Book book = new Book();
        return book;
    }
}
