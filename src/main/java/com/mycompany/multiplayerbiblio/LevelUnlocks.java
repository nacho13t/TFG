
package com.mycompany.multiplayerbiblio;

import db.UserManagement;
import inventory.LootBox;
import java.sql.SQLException;


public class LevelUnlocks {

    public static LevelUnlocks LevelFourMedal() {
        return new LevelUnlocks("¡Has obtenido una nueva medalla!");
    }
    
    public static LevelUnlocks LevelEightMedal() {
        return new LevelUnlocks("¡Has obtenido una nueva medalla!");
    }
    
    private final String description;
    
    public LevelUnlocks(String desc){
        description = desc;
    }
    
    public String info(){
        return description;
    }
    
    public static LevelUnlocks CorrectQuestion(User user){
        return new LevelUnlocks("¡La respuesta es correcta! Has ganado 50 puntos de experiencia.");
    }
    
    public static LevelUnlocks WrongQuestion(User user){
        return new LevelUnlocks("La respuesta no es correcta.");
    }
    
    public static LevelUnlocks NewMedal(User user){
        return new LevelUnlocks("¡Has conseguido una nueva medalla!");
    }
    
    public static LevelUnlocks UserDoNotExists(User user){
        return new LevelUnlocks("El usuario no existe.");
    }
    
    public static LevelUnlocks LevelTwoUnlockVirusImage(User user) throws SQLException{
        UserManagement.unlock(user,"virus.png");
        return new LevelUnlocks("¡Has subido a nivel 2! Tienes una nueva imagen de perfil disponible.");
    }
    
    public static LevelUnlocks newLootBoxObtained(User user) throws SQLException{
        user.inventory().addItem(new LootBox("Puede contener una ficha de experiencia, nuevas imágenes de perfil o comodines para cuestionarios"));
        return new LevelUnlocks("Has conseguido una caja de recompensa. Ábrela desde el inventario.");
    }
    
    public static LevelUnlocks newExperienceTokenObtained(User user){
        return new LevelUnlocks("Has conseguido una ficha de experiencia. Úsala o envíala a otro usuario desde el inventario.");
    }
    
    public static LevelUnlocks newImageObtained(User user){
        return new LevelUnlocks("Has conseguido una nueva imagen de perfil. Actívala desde el inventario o envíala a otro usuario.");
    }
    
    public static LevelUnlocks newJokerbtained(User user){
        return new LevelUnlocks("Has conseguido un comodín. Úsalo la próxima vez que realices un cuestionario para resolver una pregunta.");
    }
    
}
