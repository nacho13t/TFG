package com.mycompany.multiplayerbiblio;

import java.sql.Timestamp;

public class ForumThread {
    private int id, user_id;
    private String title;
    private Timestamp date;

    public ForumThread(int id, int user_id, String title, Timestamp date) {
        this.id = id;
        this.user_id = user_id;
        this.title = title;
        this.date = date;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }
    
    
}
