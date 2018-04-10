package com.ceasar.book.model;

public class Dict {
    private Integer dictId;

    private Integer dictUpid;

    private String dictName;

    public Integer getDictId() {
        return dictId;
    }

    public void setDictId(Integer dictId) {
        this.dictId = dictId;
    }

    public Integer getDictUpid() {
        return dictUpid;
    }

    public void setDictUpid(Integer dictUpid) {
        this.dictUpid = dictUpid;
    }

    public String getDictName() {
        return dictName;
    }

    public void setDictName(String dictName) {
        this.dictName = dictName == null ? null : dictName.trim();
    }
}