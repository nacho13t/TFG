package com.mycompany.multiplayerbiblio;

public class Medal {
    private String name, description, date, image;    

    public Medal(String name, String description, String date, String image) {
        this.name = name;
        this.description = description;
        this.date = date;
        this.image = image;
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
