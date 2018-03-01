
package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CareerManagement {
    private static Connection con;

    public static Connection connection() throws SQLException, ClassNotFoundException {
        String sURL = "jdbc:mysql://sql11.freesqldatabase.com:3306/sql11222096";
        con = DriverManager.getConnection(sURL, "sql11222096", "ds5BMvYtIk");

        return con;
    }
    
    public static List<String> getCareerNames() throws ClassNotFoundException{
        try {
            List<String> careerNames = new ArrayList<>();
            con = connection();
            
            String query = "select name from Careers";
            Statement stmt = con.prepareStatement(query);
            ResultSet result = stmt.executeQuery(query);
            
            while (result.next()) {
                careerNames.add(result.getString("name"));
            }
            con.close();
            return careerNames;
            
        } catch (SQLException ex) {
            Logger.getLogger(CareerManagement.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static String[] getCareerRecommendedBooks(String career) throws SQLException, ClassNotFoundException{
        try {
            List<String> careerNames = new ArrayList<>();
            con = connection();
            
            String query = "select recbooks from Careers where name = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, career);

            ResultSet result = preparedStmt.executeQuery();
            if(result.next()){
                String rawBooks = result.getString("recbooks");
                con.close();
                if(rawBooks != null)return rawBooks.split("¼");
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(CareerManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        con.close();
        return null;
    }
    
}
