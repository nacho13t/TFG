package db;

import com.mycompany.multiplayerbiblio.Book;
import static db.UserManagement.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class CareerManagement {

    private static Connection con;

    public static Connection connection() throws SQLException, ClassNotFoundException {
        String sURL = "jdbc:mysql://dz8959rne9lumkkw.chr7pe7iynqr.eu-west-1.rds.amazonaws.com:3306/x1ndqr8t997qnmok?autoReconnect=true&useSSL=false";
        con = DriverManager.getConnection(sURL, "y2q1rab10y9ze2gv", "shd02zhmm11i24o2");

        return con;
    }

    public static Map<String, Integer> getTopCareers() throws ClassNotFoundException {
        try {
            Map<String, Integer> allCareers = new HashMap<>();

            con = connection();
            String query = "select name, students from careersnew";
            Statement stmt = con.prepareStatement(query);
            ResultSet result = stmt.executeQuery(query);

            while (result.next()) {
                allCareers.put(result.getString("name"), result.getInt("students"));
            }

            con.close();
            return MapSort.sortByValue(allCareers);

        } catch (SQLException ex) {
            Logger.getLogger(UserManagement.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        }
    }

    public static void recalculateStats(String career) {
        try {

            con = connection();
            String query = "select * from Users where career = ?";

            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, career);
            ResultSet result = preparedStmt.executeQuery();

            int totalLevelCareer = 0;
            int students = 0;

            while (result.next()) {
                totalLevelCareer += result.getInt("lvl");
                students++;
            }

            float avglvl;

            if (students == 0) {
                avglvl = 0.00f;
            } else {
                avglvl = (float) totalLevelCareer / students;
            }

            int id = getCareerId(career);
            con = connection();
            String updateQuery = "update careersnew set avglvl = ?, students = ? WHERE id = ?";
            PreparedStatement updateStm = con.prepareStatement(updateQuery);
            updateStm.setFloat(1, avglvl);
            updateStm.setInt(2, students);
            updateStm.setInt(3, id);

            updateStm.executeUpdate();
            con.close();

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(CareerManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static List<String> getCareerNames() throws ClassNotFoundException {
        try {
            List<String> careerNames = new ArrayList<>();
            con = connection();

            String query = "select name from careersnew";
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

    public static List<Book> getCareerRecommendedBooks(String career) throws SQLException, ClassNotFoundException {
        try {
            con = connection();
            List<Book> books = new ArrayList<>();
            String query = "select * from recbooks where id_career = ?";

            int id_career = getCareerId(career);
            con = connection();
            
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setInt(1, id_career);

            ResultSet result = preparedStmt.executeQuery();
            while (result.next()) {
                books.add(new Book(result.getInt("id"), id_career, result.getString("name"), result.getString("url")));
            }
            con.close();
            return books;

        } catch (SQLException ex) {
            Logger.getLogger(CareerManagement.class.getName()).log(Level.SEVERE, null, ex);
        }
        con.close();
        return null;
    }

    public static int getCareerId(String name) throws SQLException, ClassNotFoundException {
        con = connection();
        String query = "select id from careersnew where name = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, name);
        int id = 0;
        ResultSet result = preparedStmt.executeQuery();
        if (result.next()) {
            id = result.getInt("id");
        }
        con.close();
        return id;

    }

}
