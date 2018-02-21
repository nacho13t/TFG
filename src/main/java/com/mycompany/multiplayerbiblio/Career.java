
package com.mycompany.multiplayerbiblio;

import java.util.ArrayList;
import java.util.List;


public final class Career {
    private String name;
    private List<Book> books;

    public Career(String name) {
        this.name = name;
        books = new ArrayList<>();
    }
    
    public Career(Career career){
        this.name = career.name();
        books = new ArrayList<>();
        for (Book book : career.books()) {
            addBook(book);
        }
    }
    
    public String name(){
        return name;
    }
    
    public void addBook(Book book){
        books.add(book);
    }
    
    public List<Book> books(){
        return books;
    }
 }
