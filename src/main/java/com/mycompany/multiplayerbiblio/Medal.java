package com.mycompany.multiplayerbiblio;

public class Medal {
    private String name, description, date, image;  
    private int id;

    public Medal(String name, String description, String date, String image, int id) {
        this.name = name;
        this.description = description;
        this.date = date;
        this.image = image;
        this.id = id;
    }
    
    public Medal(String name, String description, String image, int id){
        this.name = name;
        this.description = description;
        this.image = image;
        this.id = id;
    }

    public int getId() {
        return id;
    }
    
    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getDate() {
        return date;
    }

    public String getImage() {
        return image;
    }
    
    
    
}
