/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package inventory;

import com.mycompany.multiplayerbiblio.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nacho
 */
public class JokerToken extends InventoryItem {
        public JokerToken(String description){

        super.description = description;
        super.image = "joker.png";
        super.type = "Joker";
    }
    
    public JokerToken(int id, String description){
        super.description = description;
        super.image = "joker.png";
        super.id = id;
        super.type = "Joker";
    }
    
    @Override
    public void send(String username) {
        //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void use(User user) {
        try {
            user.inventory().removeItem(this);
        } catch (SQLException ex) {
            Logger.getLogger(ImageToken.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
