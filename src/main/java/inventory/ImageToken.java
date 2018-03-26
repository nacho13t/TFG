/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inventory;

import com.mycompany.multiplayerbiblio.User;
import db.UserManagement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nacho
 */
public class ImageToken extends InventoryItem{
    
    private String path;
    
    public ImageToken(String description, String path){
        super.description = description;
        this.path = path;
        super.image = path;
        super.type = "Image";
    }
    
    public ImageToken(int id, String description, String path){
        super.description = description;
        this.path = path;
        super.image = path;
        super.id = id;
        super.type = "Image";
    }

    @Override
    public void send(String username) {
        super.send(username); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void use(User user) {
        try {
            boolean repeated = false;
            for (String unlockedImage : UserManagement.unlockedImages(user.id())) {
                if(unlockedImage.equals(this.image)){
                    user.gainExperience(50);
                    repeated = true;
                    break;
                }
            }
            if(!repeated)UserManagement.unlock(user.id(), this.path);
            user.inventory().removeItem(this);
            
        } catch (SQLException ex) {
            Logger.getLogger(ImageToken.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String value() {
        return path;
    }
    
    
}
