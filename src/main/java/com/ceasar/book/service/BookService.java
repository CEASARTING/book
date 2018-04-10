package com.ceasar.book.service;

import com.ceasar.book.mapper.BookMapper;
import com.ceasar.book.model.Book;
import com.ceasar.book.model.BookExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by dp on on 2018/4/9
 */
@Service
@Transactional
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public void insert(Book book){
        bookMapper.insert(book);
    }


    public List<Book> findByBelong(int belong){
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBookBelongEqualTo(belong);
        return bookMapper.selectByExample(bookExample);
    }

    public void addDown(int bookId){
        Book book = bookMapper.selectByPrimaryKey(bookId);
        book.setBookDown(book.getBookDown()+1);
        bookMapper.updateByPrimaryKey(book);
    }

    public Book findById(int id){
        return bookMapper.selectByPrimaryKey(id);
    }
}
