
package inventory;

import com.mycompany.multiplayerbiblio.User;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author nacho
 */
public class ExperienceToken extends InventoryItem{

    private final int experience;

    public ExperienceToken(String description, int experience){
        this.experience = experience;
        super.description = description;
        super.image = "experience.png";
        super.type = "Experience";
    }
    
    public ExperienceToken(int id, String description, int experience){
        this.experience = experience;
        super.description = description;
        super.image = "experience.png";
        super.id = id;
        super.type = "Experience";
    }
    
    @Override
    public void send(String username) {
        //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String value() {
        return ""+experience;
    }
    
    @Override
    public void use(User user) {
        try {
            user.gainExperience(experience);
            user.inventory().removeItem(this);
            
        } catch (SQLException ex) {
            Logger.getLogger(ExperienceToken.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
