
package com.mycompany.multiplayerbiblio;


public class Exam {
    private String name;
    private Question[] questions;
    private int id;

    public Exam(String name, int id) {
        this.name = name;
        this.id = id;
    }

    public int id(){
        return id;
    }
    
    public Question[] getQuestions() {
        return questions;
    }

    public void setQuestions(Question[] questions) {
        this.questions = questions;
    }

    public String name() {
        return name;
    }
    
    public float getMark(int[] answers){
        int totalCorrectQuestions = 0;
        
        int i = 0;
        for (Question question : questions) {
            if(question.correctOption() == answers[i]) totalCorrectQuestions++;
        }
        
        return totalCorrectQuestions/questions.length*10;
    }
}
