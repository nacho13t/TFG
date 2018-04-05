
package com.mycompany.multiplayerbiblio;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;


public class Message {
    private String content, origin, target;
    private Timestamp date;
    private int id;

    public Message(String content, String origin, String target, Timestamp date, int id) {
        this.content = content;
        this.origin = origin;
        this.target = target;
        this.date = date;
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public String getOrigin() {
        return origin;
    }

    public String getTarget() {
        return target;
    }

    public String getDate() {
        return new SimpleDateFormat("dd/MM/yyyy  HH:mm:ss").format(date);
    }
    
    public int getId(){
        return id;
    }
    
    
}
