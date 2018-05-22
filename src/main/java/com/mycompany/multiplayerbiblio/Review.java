
package com.mycompany.multiplayerbiblio;


public class Review {

    private int id, user_id, likes;
    private String book_name, review_content, quote, like_array;

    
    public Review(int user_id, String book_name, String review_content, String quote){
        this.user_id = user_id;
        this.book_name = book_name;
        this.quote = quote;
        this.review_content = review_content;
    }

    public Review(int id, int user_id, int likes, String book_name, String review_content, String quote, String like_array) {
        this.id = id;
        this.user_id = user_id;
        this.likes = likes;
        this.quote = quote;
        this.book_name = book_name;
        this.review_content = review_content;
        this.like_array = like_array;
    }
    
    public boolean likeByUser(int user){
        if(like_array == null) return false;
        if(like_array.contains("'"+user+"'")) return true;
        return false;
    }

    public String getLike_array() {
        return like_array;
    }

    public void setLike_array(String like_array) {
        this.like_array = like_array;
    }
    
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getLikes() {
        return likes;
    }
    
    public void setQuote(String quote) {
        this.quote = quote;
    }

    public String getQuote() {
        return quote;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public String getReview_content() {
        return review_content;
    }

    public void setReview_content(String review_content) {
        this.review_content = review_content;
    }
    
    
    
}
