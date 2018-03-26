package inventory;

import com.mycompany.multiplayerbiblio.User;
import static db.ForumManagement.createPost;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Inventory {

    private User owner;
    private List<InventoryItem> items;

    private static Connection con;

    public static Connection connection() throws SQLException {
        String sURL = "jdbc:mysql://sql11.freesqldatabase.com:3306/sql11222096";
        con = DriverManager.getConnection(sURL, "sql11222096", "ds5BMvYtIk");

        return con;
    }
    
    public List<InventoryItem> getItems (){
        return items;
    }
    
    
    public int getJokers(){
        int count = 0;
        for (InventoryItem item : items) {
            if(item.type.equals("Joker"))count++;
        }
        return count;
    }

    public Inventory(User user) {
        owner = user;
        items = new ArrayList<>();
    }

    public static void retrieveInventoryFromDB(User user) throws SQLException {
        Inventory inventory = new Inventory(user);
        user.inventory(inventory);
        con = connection();
        String query = "SELECT * from Items WHERE user_id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, user.id());
        ResultSet result = preparedStmt.executeQuery();
        while (result.next()) {
            user.inventory().retrieveSingleItem(InventoryItem.createItem(result.getString("type"), result.getInt("id"), result.getString("value"), result.getString("description")));
        }
        con.close();
    }
    
    public void retrieveSingleItem(InventoryItem item){
        items.add(item);
    }
    

    public void addItem(InventoryItem item) throws SQLException {
        items.add(item);

        String query = "INSERT into Items (user_id, description, value, image, type) VALUES (?,?,?,?,?)";

        con = connection();
        PreparedStatement preparedStmt = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
        preparedStmt.setInt(1, owner.id());
        preparedStmt.setString(2, item.description());
        preparedStmt.setString(3, item.value());
        preparedStmt.setString(4, item.image());
        preparedStmt.setString(5, item.type());

        preparedStmt.execute();
        ResultSet generatedKeys = preparedStmt.getGeneratedKeys();
        if (generatedKeys.next()) {
            item.id(generatedKeys.getInt(1));
        }

        con.close();
    }
    
    public static InventoryItem getSingleItem(int id) throws SQLException{
        con = connection();
        String query = "SELECT * from Items WHERE id = ?";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setInt(1, id);
        ResultSet result = preparedStmt.executeQuery();
        InventoryItem item = null;
        if (result.next()) {
            item = InventoryItem.createItem(result.getString("type"), result.getInt("id"), result.getString("value"), result.getString("description"));
        }
        con.close();
        return item;
    }

    public void removeItem(InventoryItem item) throws SQLException {

        con = connection();
        PreparedStatement st = con.prepareStatement("DELETE FROM Items WHERE id = ?");
        st.setInt(1, item.id());
        st.executeUpdate();
        items.clear();
        retrieveInventoryFromDB(owner);
        con.close();
    }

}
