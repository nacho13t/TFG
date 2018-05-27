package db;

import com.mycompany.multiplayerbiblio.Book;
import com.mycompany.multiplayerbiblio.Library;
import static db.UserManagement.connection;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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

    public static int getLibraryId(String career) throws SQLException, ClassNotFoundException {
        int career_id = getCareerId(career);
        con = connection();
        int library_id = 0;
        
        String query = "SELECT library_id from careersnew where id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, career_id);
        ResultSet result = preparedStmt.executeQuery();
        if (result.next()) {
            library_id = result.getInt("library_id");
        }
        
        con.close();
        return library_id;
    }

    public static String getLibraryName(String career) throws SQLException, ClassNotFoundException {
        int library_id = getLibraryId(career);
        con = connection();
        String library_name = "";

        String query = "select name from libraries where id = ?";
        PreparedStatement stmt = con.prepareStatement(query);
        stmt.setInt(1, library_id);
        ResultSet result = stmt.executeQuery();
        if (result.next()) {
            library_name = result.getString("name");
        }

        con.close();
        return library_name;
    }

    public static List<Library> getTopLibraries() throws SQLException, ClassNotFoundException {
        con = connection();
        List<Library> libraries = new ArrayList<>();
        String query1 = "select id, name from libraries";
        String query2 = "select students, library_id from careersnew";

        Statement stmt = con.prepareStatement(query1);
        ResultSet result = stmt.executeQuery(query1);

        while (result.next()) {
            libraries.add(new Library(result.getInt("id"), result.getString("name")));
        }

        Statement stmt2 = con.prepareStatement(query2);
        ResultSet result2 = stmt.executeQuery(query2);

        while (result2.next()) {
            for (Library library : libraries) {
                if (result2.getInt("library_id") == library.getId()) {
                    library.increseStudents(result2.getInt("students"));
                    break;
                }
            }
        }

        con.close();

        Collections.sort(libraries, new Comparator<Library>() {
            @Override
            public int compare(Library a1, Library a2) {
                return a2.getStudents() - a1.getStudents();
            }
        });

        return libraries;

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
