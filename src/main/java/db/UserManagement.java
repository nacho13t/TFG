package db;

import com.mycompany.multiplayerbiblio.Medal;
import com.mycompany.multiplayerbiblio.Message;
import com.mycompany.multiplayerbiblio.User;
import inventory.Inventory;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserManagement {

    private static Connection con;

    public static Connection connection() throws SQLException {
        String sURL = "jdbc:mysql://dz8959rne9lumkkw.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/x1ndqr8t997qnmok?autoReconnect=true&useSSL=false";
        con = DriverManager.getConnection(sURL, "y2q1rab10y9ze2gv", "shd02zhmm11i24o2");

        return con;
    }
    

    
    public static List<Message> getRecievedMessages(User user) throws SQLException{
        con = connection();
        String query = "SELECT * from Messages where target = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, user.username());
        ResultSet result = preparedStmt.executeQuery();
        
        List<Message> messages = new ArrayList<>();
        while (result.next()) {
            messages.add(new Message(result.getString("message"), result.getString("origin"), result.getString("target"), result.getTimestamp("date"), result.getInt("id")));
        }
        con.close();
        return messages;
    }
    
    public static List<Message> getSentMessages(User user) throws SQLException{
        con = connection();
        String query = "SELECT * from Messages where origin = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, user.username());
        ResultSet result = preparedStmt.executeQuery();
        
        List<Message> messages = new ArrayList<>();
        while (result.next()) {
            messages.add(new Message(result.getString("message"), result.getString("origin"), result.getString("target"), result.getTimestamp("date"), result.getInt("id")));
        }
        con.close();
        return messages;
    }
    
    public static void sendMessage(String origin, String target, String message) throws SQLException{
        con = connection();
        String query = "INSERT into Messages (origin, target, message) VALUES (?,?,?)";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, origin);
        preparedStmt.setString(2, target);
        preparedStmt.setString(3, message);
        
        preparedStmt.execute();
        
        con.close();
    }

    public static void unlock(int user_id, String image) throws SQLException {
        String[] lockedImages = lockedImages(user_id);
        String lockedStringImages = "";
        for (int i = 0; i < lockedImages.length; i++) {
            if (!lockedImages[i].equals(image)) {
                lockedStringImages += lockedImages[i] + "½";
            }
        }

        con = connection();
        String query = "update Progress set lock_imgs = ? WHERE user_id = ? ";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, lockedStringImages);
        preparedStmt.setInt(2, user_id);

        preparedStmt.executeUpdate();

        String[] unlockedImages = unlockedImages(user_id);
        String unlockedStringImages = "";
        for (String newUnlockedImage : unlockedImages) {
            unlockedStringImages += newUnlockedImage + "½";
        }
        unlockedStringImages += image + "½";
        con.close();
        String query2 = "update Progress set unlock_imgs = ? WHERE user_id = ? ";

        con = connection();
        PreparedStatement preparedStmt2 = con.prepareStatement(query2);
        preparedStmt2.setString(1, unlockedStringImages);
        preparedStmt2.setInt(2, user_id);

        preparedStmt2.executeUpdate();

        con.close();
    }

    public static String[] unlockedImages(int user_id) throws SQLException {
        con = connection();
        String query = "select unlock_imgs from Progress WHERE user_id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, user_id);
        ResultSet result = preparedStmt.executeQuery();
        if (result.next()) {
            String[] imgs = result.getString("unlock_imgs").split("½");
            con.close();
            return imgs;
        }
        con.close();
        return null;
    }

    public static String[] lockedImages(int user_id) throws SQLException {
        con = connection();
        String query = "select lock_imgs from Progress WHERE user_id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, user_id);
        ResultSet result = preparedStmt.executeQuery();
        if (result.next()) {
            String[] imgs = result.getString("lock_imgs").split("½");
            con.close();
            return imgs;
        }
        con.close();
        return null;
    }

    public static String getUserNick(int user_id) throws SQLException {
        try {
            con = connection();
            String query = "select name from Users WHERE idUsers = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, user_id);
            ResultSet result = preparedStmt.executeQuery();

            if (result.next()) {

                return result.getString("name");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        con.close();
        return null;
    }

    public static List<User> searchUsers(String search) throws SQLException {
        try {
            List<User> searching = new ArrayList<>();
            con = connection();

            String query = "select idUsers, username, name, lvl from Users where name like ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, "%" + search + "%");

            ResultSet result = preparedStmt.executeQuery();
            
            while (result.next()) {
                searching.add(new User(result.getString("name"),result.getInt("idUsers"),result.getInt("lvl"),result.getString("username")));
            }
            
            con.close();
            return searching;
            
        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
            con.close();
            return null;
        }
    }

    public static Map<String, Integer> getTopLvlUsers() throws SQLException {
        try {
            Map<String, Integer> allUsers = new HashMap<>();

            con = connection();
            String query = "select name, lvl from Users";
            Statement stmt = con.prepareStatement(query);
            ResultSet result = stmt.executeQuery(query);

            while (result.next()) {
                allUsers.put(result.getString("name"), result.getInt("lvl"));
            }

            con.close();
            return MapSort.sortByValue(allUsers);

        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
            con.close();
            return null;
        }

    }

    public static void updateExperienceAndLevelInDatabase(User user) throws SQLException {
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
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static User registerNewUser(String name, String career, String pass) throws NoSuchAlgorithmException, SQLException {
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
            user.setExperienceLeft(result.getInt("expleft"));
            user.setPhoto(result.getString("image"));
            user.setPass(result.getString("password"));
            user.setNick(result.getString("name"));
            user.setEmail(result.getString("email"));
        }
        con.close();

        setId(user);
        retrieveProgressFromDatabase(user);
        Inventory.retrieveInventoryFromDB(user);

        return user;
    }

    public static void retrieveProgressFromDatabase(User user) throws SQLException {
        try {
            con = connection();

            String query = "select * from Progress WHERE user_id = ?";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, user.id());
            ResultSet result = preparedStmt.executeQuery();
            String medalsRaw = "";
            if (result.next()) {
                boolean[] exms = {result.getBoolean("exm1_completed"), result.getBoolean("exm2_completed"), result.getBoolean("exm3_completed"), result.getBoolean("exm4_completed")};
                user.setCompletedExams(exms);
                medalsRaw = result.getString("medals");
            }
            con.close();

            retrieveMedalsFromDatabase(user, medalsRaw);

        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Medal getMedalInfo(int id) throws SQLException {
        try {

            Medal medal = null;
            con = connection();
            String query = "select * from Medals WHERE id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, id);
            ResultSet result = preparedStmt.executeQuery();

            if (result.next()) {
                medal = new Medal(result.getString("name"), result.getString("description"), DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), result.getString("image_link"));
            }
            con.close();
            return medal;

        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static void completeNewExam(User user, int examNumber) throws SQLException {
        try {
            String colName = "exm" + examNumber + "_completed";
            con = connection();

            String query = "update Progress set " + colName + " = ? WHERE user_id = ? ";
            System.out.println(query);
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setBoolean(1, true);
            preparedStmt.setInt(2, user.id());

            preparedStmt.executeUpdate();
            con.close();

        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void obtainNewMedal(User user, int id) throws SQLException {
        try {
            con = connection();
            String query = "select medals from Progress WHERE user_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, user.id());
            ResultSet result = preparedStmt.executeQuery();

            if (result.next()) {
                String rawMedals = result.getString("medals");
                System.out.println("Medallas actuales " + result.getString("medals"));
                if (!rawMedals.contains(id + "Sep")) {
                    rawMedals += "" + id + "Sep" + DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now());
                    System.out.println("Nuevas medallas " + rawMedals);
                }

                String updateQuery = "update Progress set medals = ? WHERE user_id = ? ";
                PreparedStatement preparedStmtUpdate = con.prepareStatement(updateQuery);
                preparedStmtUpdate.setString(1, rawMedals);
                preparedStmtUpdate.setInt(2, user.id());
                preparedStmtUpdate.executeUpdate();

            }

            con.close();

        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void retrieveMedalsFromDatabase(User user, String medalsRaw) throws SQLException {
        try {
            con = connection();

            String[] allMedals = medalsRaw.split("End");
            for (String allMedal : allMedals) {
                int id = Integer.parseInt(allMedal.split("Sep")[0]);
                String query = "select * from Medals WHERE id = ?";
                PreparedStatement preparedStmt = con.prepareStatement(query);
                preparedStmt.setInt(1, id);
                ResultSet result = preparedStmt.executeQuery();

                if (result.next()) {
                    Medal medal = new Medal(result.getString("name"), result.getString("description"), allMedal.split("Sep")[1], result.getString("image_link"));
                    user.addMedal(medal);
                }

            }
            con.close();
        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean validateUser(String username, String pass) throws SQLException, NoSuchAlgorithmException {
        try {
            con = connection();

            String query = "select * from Users WHERE username = ? and password = ?";

            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(pass.getBytes(StandardCharsets.UTF_8));

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, username);
            preparedStmt.setBytes(2, hash);
            ResultSet result = preparedStmt.executeQuery();

            boolean exists = result.next();
            con.close();

            return exists;
        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public static void createProgressRegisterForUser(User user) throws SQLException {
        try {
            con = connection();

            String query = " insert into Progress (user_id, medals, exm1_completed, exm2_completed, exm3_completed, exm4_completed)"
                    + " values (?, ?, ?, ?, ?, ?)";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, user.id());
            preparedStmt.setString(2, "1Sep" + DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()) + "End");
            preparedStmt.setBoolean(3, false);
            preparedStmt.setBoolean(4, false);
            preparedStmt.setBoolean(5, false);
            preparedStmt.setBoolean(6, false);

            preparedStmt.execute();
            con.close();
        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void setId(User user) throws SQLException {
        try {
            con = connection();

            String query = "select idUsers from Users WHERE username = ?";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, user.username());
            ResultSet result = preparedStmt.executeQuery();

            if (result.next()) {
                user.id(result.getInt("idUsers"));
            }
            con.close();

        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static boolean registerUserInDatabase(User user) throws NoSuchAlgorithmException, SQLException {

        try {
            if (userExists(user.username())) {
                return false;
            }

            con = connection();

            String query = " insert into Users (username, career, lvl, name, password, expleft)"
                    + " values (?, ?, ?, ?, ?, ?)";

            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(user.pass().getBytes(StandardCharsets.UTF_8));

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, user.username());
            preparedStmt.setString(2, user.career());
            preparedStmt.setInt(3, 1);
            preparedStmt.setString(4, user.nick());
            preparedStmt.setBytes(5, hash);
            preparedStmt.setInt(6, 50);

            preparedStmt.execute();

            con.close();

            setId(user);
            createProgressRegisterForUser(user);
            CareerManagement.recalculateStats(user.career());

            return true;

        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
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

        CareerManagement.recalculateStats(user.career());
    }

    public static boolean userExists(String username) throws SQLException {
        try {
            con = connection();

            String query = "select * from Users WHERE username = ?";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, username);
            ResultSet result = preparedStmt.executeQuery();

            boolean exists = result.next();
            con.close();

            return exists;
        } catch (SQLException ex) {
            con.close();
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
