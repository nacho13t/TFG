package db;

import com.mycompany.multiplayerbiblio.Medal;
import com.mycompany.multiplayerbiblio.Message;
import com.mycompany.multiplayerbiblio.Review;
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
    
    public static void completeTasks(User user, int number) throws SQLException{
        try {
            String colName = "task_"+ number;
            con = connection();

            String query = "update Progress set " + colName + " = ? WHERE user_id = ? ";
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

    public static void removeLike(Review review, int id_user) throws SQLException {
        con = connection();
        String like_array = review.getLike_array();
        like_array = like_array.replace("'" + id_user + "'", "");
        String query = "update reviews set likes_array = ? WHERE id = ? ";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, like_array);
        preparedStmt.setInt(2, review.getId());

        preparedStmt.executeUpdate();
        con.close();

        int currentLikes = getReviewLikes(review.getId());
        con = connection();
        query = "update reviews set likes = ? WHERE id = ? ";
        preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, currentLikes - 1);
        preparedStmt.setInt(2, review.getId());

        preparedStmt.executeUpdate();
        con.close();
    }

    public static void giveTenLikesExperience(Review review) throws SQLException {
        User userTarget = getUser(review.getUser_id());
        userTarget.gainExperience(50);

        con = connection();

        String query = "update reviews set exp_given = 1 WHERE id = ? ";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, review.getId());
        preparedStmt.executeUpdate();
        con.close();
    }

    public static void giveLike(Review review, int id_user) throws SQLException {
        con = connection();

        String like_array = review.getLike_array();
        like_array += "'" + id_user + "'";

        String query = "update reviews set likes_array = ? WHERE id = ? ";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, like_array);
        preparedStmt.setInt(2, review.getId());

        preparedStmt.executeUpdate();
        con.close();

        int currentLikes = getReviewLikes(review.getId());
        currentLikes++;
        System.out.println("LIKES: " + currentLikes);
        con = connection();
        query = "update reviews set likes = ? WHERE id = ? ";
        preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, currentLikes);
        preparedStmt.setInt(2, review.getId());

        preparedStmt.executeUpdate();
        con.close();

        if ((currentLikes >= 10) && (!review.expGiven())) {
            System.out.println("DANDO EXPERIENCIA");
            giveTenLikesExperience(review);
        }
    }

    public static Review getReview(int id) throws SQLException {
        con = connection();
        Review review = null;

        String query = "SELECT * from reviews where id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet result = preparedStmt.executeQuery();
        if (result.next()) {
            review = new Review(id, result.getInt("id_user"), result.getInt("likes"), result.getString("book_name"), result.getString("review_content"), result.getString("quote"), result.getString("likes_array"), result.getBoolean("exp_given"));
        }

        con.close();
        return review;
    }

    public static void removeReview(int id, int id_user) throws SQLException {
        int last_user_review = getLastReviewId(id_user);

        con = connection();
        PreparedStatement st = con.prepareStatement("DELETE FROM reviews WHERE id = ?");
        st.setInt(1, id);
        st.executeUpdate();

        con.close();
        if (last_user_review == id) {
            List<Review> reviews = getUserReviews(id_user);
            if (reviews.isEmpty()) {
                updateLastReviewId(id_user, 0);
            } else {
                updateLastReviewId(id_user, reviews.get(reviews.size() - 1).getId());
            }
        }

    }

    public static List<Review> getUserReviews(int id_user) throws SQLException {
        con = connection();
        List<Review> reviews = new ArrayList<>();

        String query = "SELECT * from reviews where id_user = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, id_user);
        ResultSet result = preparedStmt.executeQuery();
        while (result.next()) {
            reviews.add(new Review(result.getInt("id"), id_user, result.getInt("likes"), result.getString("book_name"), result.getString("review_content"), result.getString("quote"), result.getString("likes_array"), result.getBoolean("exp_given")));
        }

        con.close();
        return reviews;
    }

    public static List<Review> getAllReviews() throws SQLException {
        con = connection();
        List<Review> reviews = new ArrayList<>();

        String query = "SELECT * from reviews";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        ResultSet result = preparedStmt.executeQuery();
        while (result.next()) {
            reviews.add(new Review(result.getInt("id"), result.getInt("id_user"), result.getInt("likes"), result.getString("book_name"), result.getString("review_content"), result.getString("quote"), result.getString("likes_array"), result.getBoolean("exp_given")));
        }

        con.close();
        return reviews;
    }

    public static int getLastReviewId(int id_user) throws SQLException {
        con = connection();
        int last_review_id = 0;

        String query = "SELECT last_review_id from progress where user_id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, id_user);
        ResultSet result = preparedStmt.executeQuery();
        if (result.next()) {
            last_review_id = result.getInt("last_review_id");
        }
        con.close();
        return last_review_id;
    }

    public static int getReviewLikes(int id) throws SQLException {

        String query = "SELECT likes from reviews where id = ?";
        con = connection();
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet result = preparedStmt.executeQuery();
        int likes = 0;
        if (result.next()) {
            likes = result.getInt("likes");
        }
        con.close();
        return likes;
    }

    public static int getLastReviewLikes(int id_user) throws SQLException {
        int last_review_id = getLastReviewId(id_user);
        con = connection();

        if (last_review_id == 0) {
            con.close();
            return 10;
        }

        String query = "SELECT * from reviews where id = ?";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, last_review_id);
        ResultSet result = preparedStmt.executeQuery();
        int likes = 0;
        if (result.next()) {
            likes = result.getInt("likes");
        }

        con.close();
        return likes;

    }

    public static void createReview(Review review) throws SQLException {
        con = connection();
        String query = "INSERT into reviews (id_user, review_content, book_name, quote) VALUES (?,?,?,?)";
        PreparedStatement preparedStmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        preparedStmt.setInt(1, review.getUser_id());
        preparedStmt.setString(2, review.getReview_content());
        preparedStmt.setString(3, review.getBook_name());
        preparedStmt.setString(4, review.getQuote());

        preparedStmt.execute();
        ResultSet generatedKeys = preparedStmt.getGeneratedKeys();
        int review_id = 0;
        if (generatedKeys.next()) {
            review_id = generatedKeys.getInt(1);
        }

        con.close();
        updateLastReviewId(review.getUser_id(), review_id);
    }

    public static void updateLastReviewId(int user_id, int review_id) throws SQLException {
        con = connection();
        String query = "update Progress set last_review_id = ? WHERE user_id = ? ";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, review_id);
        preparedStmt.setInt(2, user_id);

        preparedStmt.executeUpdate();
        con.close();
    }

    public static void increaseLootBoxCounter(User user) throws SQLException {
        int count = getOpenLootBoxes(user);
        count++;
        con = connection();
        String query = "update Progress set loot_box_open = ? WHERE user_id = ? ";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, count);
        preparedStmt.setInt(2, user.id());

        preparedStmt.executeUpdate();
        con.close();
    }

    public static int getOpenLootBoxes(User user) throws SQLException {
        con = connection();
        String query = "SELECT loot_box_open from progress where user_id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, user.id());
        ResultSet result = preparedStmt.executeQuery();
        int count = 0;
        if (result.next()) {
            count = result.getInt("loot_box_open");
        }

        con.close();
        return count;
    }

    public static List<Medal> getAllMedals() throws SQLException {
        con = connection();
        List<Medal> medals = new ArrayList<>();
        String query = "SELECT * from Medals";
        Statement stmt = con.prepareStatement(query);
        ResultSet result = stmt.executeQuery(query);

        while (result.next()) {
            medals.add(new Medal(result.getString("name"), result.getString("description"), result.getString("image_link"), result.getInt("id")));

        }
        con.close();
        return medals;
    }

    public static List<Message> getRecievedMessages(User user) throws SQLException {
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

    public static List<Message> getSentMessages(User user) throws SQLException {
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

    public static void sendMessage(String origin, String target, String message) throws SQLException {
        con = connection();
        String query = "INSERT into Messages (origin, target, message) VALUES (?,?,?)";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, origin);
        preparedStmt.setString(2, target);
        preparedStmt.setString(3, message);

        preparedStmt.execute();

        con.close();
    }

    public static void unlock(User user, String image) throws SQLException {
        String[] lockedImages = lockedImages(user.id());
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
        preparedStmt.setInt(2, user.id());

        preparedStmt.executeUpdate();

        String[] unlockedImages = unlockedImages(user.id());
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
        preparedStmt2.setInt(2, user.id());

        preparedStmt2.executeUpdate();

        con.close();

        if ((!user.hasMedal(9)) && (unlockedImages(user.id()).length >= 3)) {
            UserManagement.obtainNewMedal(user, 9);
        }
    }

    public static boolean isUnlocked(int id_user, String image) throws SQLException {
        for (String img : unlockedImages(id_user)) {
            if (img.equals(image)) {
                return true;
            }
        }
        return false;
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
                searching.add(new User(result.getString("name"), result.getInt("idUsers"), result.getInt("lvl"), result.getString("username")));
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

    public static User getUser(int id) throws SQLException {
        User user = new User();

        con = connection();

        String query = "select * from Users WHERE idUsers = ?";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, id);

        ResultSet result = preparedStmt.executeQuery();

        if (result.next()) {
            user.setUsername(result.getString("username"));
            user.setCareer(result.getString("career"));
            user.setLevel(result.getInt("lvl"));
            user.setExperienceLeft(result.getInt("expleft"));
            user.setPhoto(result.getString("image"));
            user.setPass(result.getString("password"));
            user.setNick(result.getString("name"));
            user.setEmail(result.getString("email"));
            user.id(id);
        }
        con.close();

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
                boolean[] exms = {result.getBoolean("exm1_completed"), result.getBoolean("exm2_completed"), result.getBoolean("exm3_completed"), result.getBoolean("exm4_completed"),result.getBoolean("exm5_completed")};
                boolean[] tasks = {result.getBoolean("task_1"), result.getBoolean("task_2"), result.getBoolean("task_3"), result.getBoolean("task_4"),result.getBoolean("task_5"), result.getBoolean("task_6")};
                user.setCompletedExams(exms);
                user.setCompletedTasks(tasks);
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
                medal = new Medal(result.getString("name"), result.getString("description"), DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()), result.getString("image_link"), result.getInt("id"));
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
                if (!rawMedals.contains(id + "Sep")) {
                    rawMedals += "" + id + "Sep" + DateTimeFormatter.ofPattern("dd/MM/yyyy").format(LocalDate.now()) + "End";
                }

                String updateQuery = "update Progress set medals = ? WHERE user_id = ? ";
                PreparedStatement preparedStmtUpdate = con.prepareStatement(updateQuery);
                preparedStmtUpdate.setString(1, rawMedals);
                preparedStmtUpdate.setInt(2, user.id());
                preparedStmtUpdate.executeUpdate();

            }

            con.close();
            retrieveProgressFromDatabase(user);

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
                    Medal medal = new Medal(result.getString("name"), result.getString("description"), allMedal.split("Sep")[1], result.getString("image_link"), result.getInt("id"));
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

    public static int validateFBUser(long id) throws SQLException {
        con = connection();
        String query = "select * from Users WHERE facebook_id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setLong(1, id);
        ResultSet result = preparedStmt.executeQuery();
        int user_id = 0;
        
        if(result.next()){
            user_id = result.getInt("idUsers");
        }
        
        con.close();
        return user_id;
    }

    public static User registerUserFB(long id, String raw_username) throws NoSuchAlgorithmException, SQLException {
        int repeatedUsername = checkRepeatedUsername(raw_username, 0);
        String username = raw_username;
        if(repeatedUsername != 0) username = raw_username+="_"+repeatedUsername;
        
        con = connection();

        User user = new User(username, "Grado en Arquitectura", null);
        
        String query = " insert into Users (username, career, lvl, name, password, expleft, facebook_id)"
                + " values (?, ?, ?, ?, ?, ?, ?)";

        

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, username);
        preparedStmt.setString(2, user.career());
        preparedStmt.setInt(3, 1);
        preparedStmt.setString(4, username);
        preparedStmt.setBytes(5, null);
        preparedStmt.setInt(6, 50);
        preparedStmt.setLong(7, id);
        preparedStmt.execute();
        con.close();
        
        setId(user);
        createProgressRegisterForUser(user);
        CareerManagement.recalculateStats(user.career());
        
        return user;
        
    }
    
    public static int checkRepeatedUsername(String username, int count) throws SQLException{
        con = connection();
        
        String query = "select * from Users WHERE username = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, username);
        ResultSet result = preparedStmt.executeQuery();
        if(result.next()){
            con.close();
            count++;
            return checkRepeatedUsername(username+="_"+count, count);
        }
        
        con.close();
        return count;
    }

}
