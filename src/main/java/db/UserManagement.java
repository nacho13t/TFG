
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


public class UserManagement {
    
    public static void registerUser(String name, String career) throws SQLException{
        Connection con = null;
        String sURL = "jdbc:mysql://sql11.freesqldatabase.com:3306/sql11222096";
        con = DriverManager.getConnection(sURL,"sql11222096","ds5BMvYtIk");
        
        String query = " insert into Users (career, email, lvl, name, pass)"
        + " values (?, ?, ?, ?, ?)";
        
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString (1, career);
        preparedStmt.setString (2, "prueba@gmail.com");
        preparedStmt.setInt(3, 1);
        preparedStmt.setString(4, name);
        preparedStmt.setString(5, "123");
        
        preparedStmt.execute();
      
        con.close();
    }
    
}
