
package com.mycompany.multiplayerbiblio;

public class Utilities {
    
    public static String[] careers(){
        return new String[]{"Grado en Ingeniería Electrónica Industrial y Automática","Grado en Arquitectura"};
    }    
    
    public static Book[] books(String career){
        if(career.equals("Grado en Ingeniería Electrónica Industrial y Automática")){
            return new Book[]{new Book("Mecánica vectorial para ingenieros", "http://ulpgc.summon.serialssolutions.com/#!/search/document?ho=t&l=es-ES&q=Johnston%20beer&id=FETCHMERGED-ulpgc_catalog_5144462")};
        }
        
        return null;
    }
}
