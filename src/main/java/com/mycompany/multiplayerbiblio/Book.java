
package com.mycompany.multiplayerbiblio;


public class Book {
    private int id, id_career;
    private String name, url;

    public Book(int id, int id_career, String name, String url) {
        this.id = id;
        this.id_career = id_career;
        this.name = name;
        this.url = url;
    }

    public int getId() {
        return id;
    }

    public int getId_career() {
        return id_career;
    }

    public String getName() {
        return name;
    }

    public String getUrl() {
        return url;
    }
    
    
}
