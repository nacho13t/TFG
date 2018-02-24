package db;

import com.mycompany.multiplayerbiblio.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserManagement {

    private static Connection con;

    public static Connection connection() throws SQLException {
        String sURL = "jdbc:mysql://sql11.freesqldatabase.com:3306/sql11222096";
        con = DriverManager.getConnection(sURL, "sql11222096", "ds5BMvYtIk");

        return con;
    }
    
    public static void updateExperienceAndLevelInDatabase(User user) {
        try {
            con = connection();
            
            String query = "update Users set lvl = ?, expleft = ? WHERE username = ? ";
            
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, user.level());
            preparedStmt.setInt(2, user.experienceLeft());
            preparedStmt.setString(3, user.username());
            
            preparedStmt.executeUpdate();
            
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static User registerNewUser(String name, String career, String pass) {
        User user = new User(name, career, pass);

        if (UserManagement.registerUserInDatabase(user)) {
            return user;
        }
        return null;
    }

    public static User getUser(String username) throws SQLException {
        User user = new User();

        con = connection();

        String query = "select * from Users WHERE username = ?";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, username);
        
        ResultSet result = preparedStmt.executeQuery();

        if (result.next()) {
            user.setUsername(username);
            user.setCareer(result.getString("career"));
            user.setLevel(result.getInt("lvl"));
            System.out.println(result.getInt("lvl"));
            user.setExperienceLeft(result.getInt("expleft"));
            user.setPhoto(result.getString("image"));
            user.setPass(result.getString("pass"));
            user.setNick(result.getString("name"));
            user.setEmail(result.getString("email"));
        }
        con.close();
        return user;
    }

    public static boolean validateUser(String username, String pass) throws SQLException {
        try {
            con = connection();

            String query = "select * from Users WHERE username = ? and pass = ?";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, username);
            preparedStmt.setString(2, pass);
            ResultSet result = preparedStmt.executeQuery();

            boolean exists = result.next();
            con.close();

            return exists;
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static boolean registerUserInDatabase(User user) {

        try {
            if (userExists(user.username())) {
                return false;
            }

            con = connection();

            String query = " insert into Users (username, career, lvl, name, pass, expleft)"
                    + " values (?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, user.username());
            preparedStmt.setString(2, user.career());
            preparedStmt.setInt(3, 1);
            preparedStmt.setString(4, user.nick());
            preparedStmt.setString(5, user.pass());
            preparedStmt.setInt(6, 50);

            preparedStmt.execute();

            con.close();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }

        return false;
    }

    public static void updateDatabaseProfile(User user) throws SQLException {
        con = connection();

        String query = "update Users set name = ?, career = ?, image = ? WHERE username = ? ";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, user.nick());
        preparedStmt.setString(2, user.career());
        preparedStmt.setString(3, user.image());
        preparedStmt.setString(4, user.username());

        preparedStmt.executeUpdate();

        con.close();
    }

    public static boolean userExists(String username) {
        try {
            con = connection();

            String query = "select * from Users WHERE username = ?";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, username);
            ResultSet result = preparedStmt.executeQuery();

            boolean exists = result.next();
            con.close();
            System.out.println(exists);

            return exists;
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
