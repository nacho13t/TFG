
package com.mycompany.multiplayerbiblio;


public class Library {
    private int id, students;
    private String name;
    
    

    public Library(int id, String name) {
        this.id = id;
        this.name = name;
    }
    
    public void increseStudents(int sum){
        this.students += sum;
    }

    public int getId() {
        return id;
    }

    public int getStudents() {
        return students;
    }

    public String getName() {
        return name;
    }
    
    
}
