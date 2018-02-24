package com.mycompany.multiplayerbiblio;

import db.UserManagement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public final class User {

    private String username, nick, photo, career, pass, email;

    private int experience, level, experienceLeft;
    private boolean noob;
    private Medal[] medals;
    private boolean[] completedExams;

    public User(String name, String career, String pass) {
        this.username = name;
        this.career = career;
        this.pass = pass;
        this.nick = name;

        experience = 50;
        level = 1;
        noob = true;
        experienceLeft = 50;
        completedExams = new boolean[]{false, false, false, false};

        medals = new Medal[10];
        medals[0] = new Medal("Usuario de la aplicación", "Crea un usuario y accede a la aplicación", DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), "Images/Medals/medal1.png");
    }

    public User() {
        noob = false;
        completedExams = new boolean[]{false, false, false, false};
        medals = new Medal[10];
        medals[0] = new Medal("Usuario de la aplicación", "Crea un usuario y accede a la aplicación", DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), "Images/Medals/medal1.png");

    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setNick(String nick) {
        this.nick = nick;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public void setCareer(String career) {
        this.career = career;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public void setExperienceLeft(int experienceLeft) {
        this.experienceLeft = experienceLeft;
        experience = level * 100 - experienceLeft;
    }

    public void setNoob(boolean noob) {
        this.noob = noob;
    }

  

    public void setMedals(Medal[] medals) {
        this.medals = medals;
    }

    public void setCompletedExams(boolean[] completedExams) {
        this.completedExams = completedExams;
    }


    public String medalStats() {
        int obtained = 0;
        for (Medal medal : medals) {
            if (medal != null) {
                obtained++;
            }
        }

        return obtained + "/10 (" + (obtained * 10) + "%)";
    }

    public void addMedal(Medal medal) {
        for (Medal medal1 : medals) {
            if (medal1 == null) {
                medal1 = medal;
                break;
            }
        }
    }

    public void updateInfo(String nick, String career, String image) {
        this.nick = nick;
        this.career = career;
        this.photo = image;
    }

    public String image() {
        return photo;
    }

    public boolean[] getCompletedExams() {
        return completedExams;
    }

    public String examStats() {
        int completed = 0;
        for (boolean completedExam : getCompletedExams()) {
            if (completedExam) {
                completed++;
            }
        }

        return completed + "/4";
    }

    public void completeExam(int id) {
        completedExams[id] = true;
        if (checkIfAllExamCompleted()) {
            medals[1] = new Medal("¡Estudiante!", "Completa todos los exámenes con la máxima nota", DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), "Images/Medals/medal2.png");
        }
    }

    public boolean checkIfAllExamCompleted() {
        for (boolean completedExam : completedExams) {
            if (!completedExam) {
                return false;
            }
        }

        return true;
    }

    public Medal[] medals() {
        return medals;
    }

    public boolean noob() {
        return noob;
    }

    public void noNoob() {
        noob = false;
    }

    public int experienceLeft() {
        return experienceLeft;
    }

    public void gainExperience(int gain) throws SQLException {
        if (gain < experienceLeft()) {
            experience += gain;
            experienceLeft -= gain;
        } else {
            int experienceBuffer = gain;
            experienceBuffer -= experienceLeft();
            experience += experienceLeft();
            level++;
            experienceLeft = level * 100;
            gainExperience(experienceBuffer);
        }
        UserManagement.updateExperienceAndLevelInDatabase(this);
    }

    public int percetage() {
        int required = level * 100;
        return ((required - experienceLeft) * 100 / required);
    }

    public String nick() {
        return nick;
    }

    public String username() {
        return username;
    }

    public String career() {
        return career;
    }

    public int experience() {
        return experience;
    }

    public void nick(String name) {
        this.nick = name;
    }

    public int level() {
        return level;
    }

    public String pass() {
        return pass;
    }

}
