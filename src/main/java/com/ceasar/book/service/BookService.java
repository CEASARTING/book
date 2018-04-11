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

    /**
     * 插入
     * @param book
     */
    public void insert(Book book){
        bookMapper.insert(book);
    }


    /**
     * 通过分类查找书籍
     * @param belong
     * @return
     */
    public List<Book> findByBelong(int belong){
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBookBelongEqualTo(belong);
        return bookMapper.selectByExample(bookExample);
    }

    /**
     * 增加下载次数
     * @param bookId
     */
    public void addDown(int bookId){
        Book book = bookMapper.selectByPrimaryKey(bookId);
        book.setBookDown(book.getBookDown()+1);
        bookMapper.updateByPrimaryKey(book);
    }

    public Book findById(int id){
        return bookMapper.selectByPrimaryKey(id);
    }
}
