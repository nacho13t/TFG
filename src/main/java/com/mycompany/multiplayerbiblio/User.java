
package com.mycompany.multiplayerbiblio;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public final class User {
    private String name, photo,career;

    private int experience, level, experienceLeft;
    private boolean noob, bookView;
    private Medal[] medals;
    private boolean[] completedExams;

    public User(String name, String career, String photo) {
        this.name = name;
        this.career = career;
        this.photo = photo;
        experience = 50;
        level = 1;
        noob = true;
        bookView = false;
        experienceLeft = 50;
        completedExams = new boolean[]{false,false,false,false};
        
        medals = new Medal[10];
        medals[0] = new Medal("Usuario de la aplicación", "Crea un usuario y accede a la aplicación", DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), "Images/Medals/medal1.png");
    }
    
    public boolean bookViewed(){
        if(bookView)return true;
        return false;
    }
    
    public void setBookViewed(){
        bookView = true;
    }
    
    public String medalStats(){
        int obtained = 0;
        for (Medal medal : medals) {
            if(medal != null) obtained++;
        }
        
        return obtained + "/10 (" + (obtained*10) + "%)";
    }
    
    public void addMedal(Medal medal){
        for (Medal medal1 : medals) {
            if(medal1 == null){
                medal1 = medal;
                break;
            }
        }
    }
    
    public void updateInfo(String name, String career, String image){
        this.name = name;
        this.career = career;
        this.photo = image;
    }
    
    public String image(){
        return photo;
    }
    
    public boolean[] getCompletedExams(){
        return completedExams;
    }
    
    public String examStats(){
        int completed = 0;
        for (boolean completedExam : getCompletedExams()) {
            if(completedExam) completed++;
        }
        
        return completed + "/4";
    }
    
    public void completeExam(int id){
        completedExams[id] = true;
        if(checkIfAllExamCompleted()){
            medals[1] = new Medal("¡Estudiante!", "Completa todos los exámenes con la máxima nota", DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), "Images/Medals/medal2.png");
        }
    }
    
    public boolean checkIfAllExamCompleted(){
        for (boolean completedExam : completedExams) {
            if(!completedExam)return false;
        }
        
        return true;
    }
    
    public Medal[] medals(){
        return medals;
    }
     
    public boolean noob(){
        return noob;
    }
    
    public void noNoob(){
        noob = false;
    }
    
    public int experienceLeft(){
        return experienceLeft;
    }
    
    public void gainExperience(int gain){
        if(gain < experienceLeft()){
            experience += gain;
            experienceLeft -= gain;
        }else{
            int experienceBuffer = gain;
            experienceBuffer -= experienceLeft();
            experience += experienceLeft();
            level++;
            experienceLeft = level*100;
            gainExperience(experienceBuffer);
        }
    }
    
    public int percetage(){
        int required = level*100;
        return ((required-experienceLeft)*100/required);
    }

    public String name() {
        return name;
    }

    public String carreer() {
        return career;
    }

    public int experience() {
        return experience;
    }

    public void name(String name) {
        this.name = name;
    }

    public int level(){
        return level;
    }

}
