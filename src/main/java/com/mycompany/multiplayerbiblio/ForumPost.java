
package com.mycompany.multiplayerbiblio;

import java.sql.Timestamp;


public class ForumPost {
    private int post_id, thread_id, user_id;
    private Timestamp date;
    private String body;

    public ForumPost(int post_id, int thread_id, int user_id, Timestamp date, String body) {
        this.post_id = post_id;
        this.thread_id = thread_id;
        this.user_id = user_id;
        this.date = date;
        this.body = body;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getThread_id() {
        return thread_id;
    }

    public void setThread_id(int thread_id) {
        this.thread_id = thread_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }
    
    
}
