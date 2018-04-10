package com.ceasar.book.model;

public class Book {
    private Integer bookId;

    private Integer bookBelong;

    private String bookName;

    private String bookUrl;

    private String bookPassword;

    private String bookMan;

    private Long bookTime;

    private Integer bookDown;

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getBookBelong() {
        return bookBelong;
    }

    public void setBookBelong(Integer bookBelong) {
        this.bookBelong = bookBelong;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName == null ? null : bookName.trim();
    }

    public String getBookUrl() {
        return bookUrl;
    }

    public void setBookUrl(String bookUrl) {
        this.bookUrl = bookUrl == null ? null : bookUrl.trim();
    }

    public String getBookPassword() {
        return bookPassword;
    }

    public void setBookPassword(String bookPassword) {
        this.bookPassword = bookPassword == null ? null : bookPassword.trim();
    }

    public String getBookMan() {
        return bookMan;
    }

    public void setBookMan(String bookMan) {
        this.bookMan = bookMan == null ? null : bookMan.trim();
    }

    public Long getBookTime() {
        return bookTime;
    }

    public void setBookTime(Long bookTime) {
        this.bookTime = bookTime;
    }

    public Integer getBookDown() {
        return bookDown;
    }

    public void setBookDown(Integer bookDown) {
        this.bookDown = bookDown;
    }
}