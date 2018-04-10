package com.ceasar.book.model;

import java.util.ArrayList;
import java.util.List;

public class BookExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public BookExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andBookIdIsNull() {
            addCriterion("book_id is null");
            return (Criteria) this;
        }

        public Criteria andBookIdIsNotNull() {
            addCriterion("book_id is not null");
            return (Criteria) this;
        }

        public Criteria andBookIdEqualTo(Integer value) {
            addCriterion("book_id =", value, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdNotEqualTo(Integer value) {
            addCriterion("book_id <>", value, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdGreaterThan(Integer value) {
            addCriterion("book_id >", value, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("book_id >=", value, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdLessThan(Integer value) {
            addCriterion("book_id <", value, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdLessThanOrEqualTo(Integer value) {
            addCriterion("book_id <=", value, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdIn(List<Integer> values) {
            addCriterion("book_id in", values, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdNotIn(List<Integer> values) {
            addCriterion("book_id not in", values, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdBetween(Integer value1, Integer value2) {
            addCriterion("book_id between", value1, value2, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookIdNotBetween(Integer value1, Integer value2) {
            addCriterion("book_id not between", value1, value2, "bookId");
            return (Criteria) this;
        }

        public Criteria andBookBelongIsNull() {
            addCriterion("book_belong is null");
            return (Criteria) this;
        }

        public Criteria andBookBelongIsNotNull() {
            addCriterion("book_belong is not null");
            return (Criteria) this;
        }

        public Criteria andBookBelongEqualTo(Integer value) {
            addCriterion("book_belong =", value, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongNotEqualTo(Integer value) {
            addCriterion("book_belong <>", value, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongGreaterThan(Integer value) {
            addCriterion("book_belong >", value, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongGreaterThanOrEqualTo(Integer value) {
            addCriterion("book_belong >=", value, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongLessThan(Integer value) {
            addCriterion("book_belong <", value, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongLessThanOrEqualTo(Integer value) {
            addCriterion("book_belong <=", value, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongIn(List<Integer> values) {
            addCriterion("book_belong in", values, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongNotIn(List<Integer> values) {
            addCriterion("book_belong not in", values, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongBetween(Integer value1, Integer value2) {
            addCriterion("book_belong between", value1, value2, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookBelongNotBetween(Integer value1, Integer value2) {
            addCriterion("book_belong not between", value1, value2, "bookBelong");
            return (Criteria) this;
        }

        public Criteria andBookNameIsNull() {
            addCriterion("book_name is null");
            return (Criteria) this;
        }

        public Criteria andBookNameIsNotNull() {
            addCriterion("book_name is not null");
            return (Criteria) this;
        }

        public Criteria andBookNameEqualTo(String value) {
            addCriterion("book_name =", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameNotEqualTo(String value) {
            addCriterion("book_name <>", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameGreaterThan(String value) {
            addCriterion("book_name >", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameGreaterThanOrEqualTo(String value) {
            addCriterion("book_name >=", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameLessThan(String value) {
            addCriterion("book_name <", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameLessThanOrEqualTo(String value) {
            addCriterion("book_name <=", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameLike(String value) {
            addCriterion("book_name like", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameNotLike(String value) {
            addCriterion("book_name not like", value, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameIn(List<String> values) {
            addCriterion("book_name in", values, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameNotIn(List<String> values) {
            addCriterion("book_name not in", values, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameBetween(String value1, String value2) {
            addCriterion("book_name between", value1, value2, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookNameNotBetween(String value1, String value2) {
            addCriterion("book_name not between", value1, value2, "bookName");
            return (Criteria) this;
        }

        public Criteria andBookUrlIsNull() {
            addCriterion("book_url is null");
            return (Criteria) this;
        }

        public Criteria andBookUrlIsNotNull() {
            addCriterion("book_url is not null");
            return (Criteria) this;
        }

        public Criteria andBookUrlEqualTo(String value) {
            addCriterion("book_url =", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlNotEqualTo(String value) {
            addCriterion("book_url <>", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlGreaterThan(String value) {
            addCriterion("book_url >", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlGreaterThanOrEqualTo(String value) {
            addCriterion("book_url >=", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlLessThan(String value) {
            addCriterion("book_url <", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlLessThanOrEqualTo(String value) {
            addCriterion("book_url <=", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlLike(String value) {
            addCriterion("book_url like", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlNotLike(String value) {
            addCriterion("book_url not like", value, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlIn(List<String> values) {
            addCriterion("book_url in", values, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlNotIn(List<String> values) {
            addCriterion("book_url not in", values, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlBetween(String value1, String value2) {
            addCriterion("book_url between", value1, value2, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookUrlNotBetween(String value1, String value2) {
            addCriterion("book_url not between", value1, value2, "bookUrl");
            return (Criteria) this;
        }

        public Criteria andBookPasswordIsNull() {
            addCriterion("book_password is null");
            return (Criteria) this;
        }

        public Criteria andBookPasswordIsNotNull() {
            addCriterion("book_password is not null");
            return (Criteria) this;
        }

        public Criteria andBookPasswordEqualTo(String value) {
            addCriterion("book_password =", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordNotEqualTo(String value) {
            addCriterion("book_password <>", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordGreaterThan(String value) {
            addCriterion("book_password >", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("book_password >=", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordLessThan(String value) {
            addCriterion("book_password <", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordLessThanOrEqualTo(String value) {
            addCriterion("book_password <=", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordLike(String value) {
            addCriterion("book_password like", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordNotLike(String value) {
            addCriterion("book_password not like", value, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordIn(List<String> values) {
            addCriterion("book_password in", values, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordNotIn(List<String> values) {
            addCriterion("book_password not in", values, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordBetween(String value1, String value2) {
            addCriterion("book_password between", value1, value2, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookPasswordNotBetween(String value1, String value2) {
            addCriterion("book_password not between", value1, value2, "bookPassword");
            return (Criteria) this;
        }

        public Criteria andBookManIsNull() {
            addCriterion("book_man is null");
            return (Criteria) this;
        }

        public Criteria andBookManIsNotNull() {
            addCriterion("book_man is not null");
            return (Criteria) this;
        }

        public Criteria andBookManEqualTo(String value) {
            addCriterion("book_man =", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManNotEqualTo(String value) {
            addCriterion("book_man <>", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManGreaterThan(String value) {
            addCriterion("book_man >", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManGreaterThanOrEqualTo(String value) {
            addCriterion("book_man >=", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManLessThan(String value) {
            addCriterion("book_man <", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManLessThanOrEqualTo(String value) {
            addCriterion("book_man <=", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManLike(String value) {
            addCriterion("book_man like", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManNotLike(String value) {
            addCriterion("book_man not like", value, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManIn(List<String> values) {
            addCriterion("book_man in", values, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManNotIn(List<String> values) {
            addCriterion("book_man not in", values, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManBetween(String value1, String value2) {
            addCriterion("book_man between", value1, value2, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookManNotBetween(String value1, String value2) {
            addCriterion("book_man not between", value1, value2, "bookMan");
            return (Criteria) this;
        }

        public Criteria andBookTimeIsNull() {
            addCriterion("book_time is null");
            return (Criteria) this;
        }

        public Criteria andBookTimeIsNotNull() {
            addCriterion("book_time is not null");
            return (Criteria) this;
        }

        public Criteria andBookTimeEqualTo(Long value) {
            addCriterion("book_time =", value, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeNotEqualTo(Long value) {
            addCriterion("book_time <>", value, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeGreaterThan(Long value) {
            addCriterion("book_time >", value, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeGreaterThanOrEqualTo(Long value) {
            addCriterion("book_time >=", value, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeLessThan(Long value) {
            addCriterion("book_time <", value, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeLessThanOrEqualTo(Long value) {
            addCriterion("book_time <=", value, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeIn(List<Long> values) {
            addCriterion("book_time in", values, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeNotIn(List<Long> values) {
            addCriterion("book_time not in", values, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeBetween(Long value1, Long value2) {
            addCriterion("book_time between", value1, value2, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookTimeNotBetween(Long value1, Long value2) {
            addCriterion("book_time not between", value1, value2, "bookTime");
            return (Criteria) this;
        }

        public Criteria andBookDownIsNull() {
            addCriterion("book_down is null");
            return (Criteria) this;
        }

        public Criteria andBookDownIsNotNull() {
            addCriterion("book_down is not null");
            return (Criteria) this;
        }

        public Criteria andBookDownEqualTo(Integer value) {
            addCriterion("book_down =", value, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownNotEqualTo(Integer value) {
            addCriterion("book_down <>", value, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownGreaterThan(Integer value) {
            addCriterion("book_down >", value, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownGreaterThanOrEqualTo(Integer value) {
            addCriterion("book_down >=", value, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownLessThan(Integer value) {
            addCriterion("book_down <", value, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownLessThanOrEqualTo(Integer value) {
            addCriterion("book_down <=", value, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownIn(List<Integer> values) {
            addCriterion("book_down in", values, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownNotIn(List<Integer> values) {
            addCriterion("book_down not in", values, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownBetween(Integer value1, Integer value2) {
            addCriterion("book_down between", value1, value2, "bookDown");
            return (Criteria) this;
        }

        public Criteria andBookDownNotBetween(Integer value1, Integer value2) {
            addCriterion("book_down not between", value1, value2, "bookDown");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}