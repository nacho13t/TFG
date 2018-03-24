
package inventory;

import com.mycompany.multiplayerbiblio.LevelUnlocks;
import com.mycompany.multiplayerbiblio.User;
import java.sql.SQLException;
import java.util.concurrent.ThreadLocalRandom;
import java.util.logging.Level;
import java.util.logging.Logger;


public class LootBox extends InventoryItem{

    public LootBox(String description){

        super.description = description;
        super.image = "box.png";
        super.type = "LootBox";
    }
    
    public LootBox(int id, String description){
        super.description = description;
        super.image = "box.png";
        super.type = "LootBox";
        super.id = id;
    }
    
    
    @Override
    public void use(User user) {
        try {
            int randomNum = ThreadLocalRandom.current().nextInt(1, 3 + 1);
            InventoryItem item = null;
            if(randomNum == 1){
                item = new ExperienceToken("Úsalo para conseguir " + user.level()*10 + " puntos de experiencia.", user.level()*10);
                LevelUnlocks.newExperienceTokenObtained(user);
            }else if(randomNum == 2){
                String[] images = {"avion.png","sello.png","desierto.png"};
                LevelUnlocks.newImageObtained(user);
                item = new ImageToken("Desbloquea una imagen de perfil.", images[ThreadLocalRandom.current().nextInt(0, 2 + 1)]);
            }else{
                item = new JokerToken("Úsalo durante un cuestionario para resolver una pregunta.");
                LevelUnlocks.newJokerbtained(user);
            }
            
            user.inventory().addItem(item);
            user.inventory().removeItem(this);
            
        } catch (SQLException ex) {
            Logger.getLogger(LootBox.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String value() {
        return "Loot Box";
    }

    
}
