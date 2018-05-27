package db;

import com.mycompany.multiplayerbiblio.ForumPost;
import com.mycompany.multiplayerbiblio.ForumThread;
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

public class ForumManagement {

    private static Connection con;

    public static Connection connection() throws SQLException {
        String sURL = "jdbc:mysql://dz8959rne9lumkkw.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/x1ndqr8t997qnmok?autoReconnect=true&useSSL=false";
        con = DriverManager.getConnection(sURL, "y2q1rab10y9ze2gv", "shd02zhmm11i24o2");
        return con;
    }

    public static void deleteThread(int thread_id) {
        try {
            con = connection();
            PreparedStatement st = con.prepareStatement("DELETE FROM Threads WHERE thread_id = ?");
            st.setInt(1, thread_id);
            st.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ForumManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deletePost(int post_id) {
        try {
            con = connection();
            PreparedStatement st = con.prepareStatement("UPDATE Posts SET body = ? WHERE post_id = ?");
            st.setString(1, "Mensaje borrado por el autor");
            st.setInt(2, post_id);

            st.executeUpdate();

            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(ForumManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void createThread(int user_id, String title, String post) {
        try {
            con = connection();
            String query = " insert into Threads (user_id, title) values (?, ?)";

            PreparedStatement preparedStmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            preparedStmt.setInt(1, user_id);
            preparedStmt.setString(2, title);

            preparedStmt.execute();
            ResultSet generatedKeys = preparedStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                createPost(user_id, post, generatedKeys.getInt(1));
            } else {
                con.close();
            }

        } catch (SQLException ex) {
            Logger.getLogger(ForumManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void createPost(int user_id, String body, int thread_id) throws SQLException {
        con.close();

        con = connection();
        String query = " insert into Posts (user_id, thread_id, body) values (?, ?, ?)";

        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, user_id);
        preparedStmt.setInt(2, thread_id);
        preparedStmt.setString(3, body);

        preparedStmt.execute();
        con.close();

    }

    public static List<ForumPost> getPosts(int thread_id) {
        try {
            con = connection();
            String query = "select * from Posts where thread_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, thread_id);
            ResultSet result = preparedStmt.executeQuery();

            List<ForumPost> post = new ArrayList<>();

            while (result.next()) {
                post.add(new ForumPost(result.getInt("post_id"), result.getInt("thread_id"), result.getInt("user_id"), result.getTimestamp("date"), result.getString("body")));
            }

            con.close();

            return post;

        } catch (SQLException ex) {
            Logger.getLogger(ForumManagement.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public static List<ForumThread> getThreads() {
        try {
            con = connection();
            String query = "select * from Threads";
            Statement stmt = con.prepareStatement(query);
            ResultSet result = stmt.executeQuery(query);

            List<ForumThread> threads = new ArrayList<>();

            while (result.next()) {
                threads.add(new ForumThread(result.getInt("thread_id"), result.getInt("user_id"), result.getString("title"), result.getTimestamp("date")));
            }

            con.close();
            return threads;

        } catch (SQLException ex) {
            Logger.getLogger(ForumManagement.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }
}
