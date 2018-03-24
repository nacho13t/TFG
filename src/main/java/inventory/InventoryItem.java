package inventory;

import com.mycompany.multiplayerbiblio.User;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nacho
 */
public abstract class InventoryItem {
    
    protected String description, image, type;
    protected int id;
    
    public void id(int id){
        this.id = id;
    }
    
    public static InventoryItem createItem(String type, int id, String value, String desc){
        if(type.equals("Experience")){
            return new ExperienceToken(id, desc, Integer.parseInt(value));
        }
        
        if(type.equals("Image")){
            return new ImageToken(id, desc, value);
        }
        
        if(type.equals("LootBox")){
            return new LootBox(id, desc);
        }
        
        if(type.equals("Joker")){
            return new JokerToken(id, desc);
        }
        
        return null;
    }
    
    public String type(){
        return type;
    }
    
    public String description(){
        return description;
    }
    
    public String image(){
        return image;
    }
    
    public int id(){
        return id;
    }
    
    public String value(){
        return "";
    }
    
    public void use(User user){
        
    }
    
    public void send(String username){
        
    }
    
    
    
}
