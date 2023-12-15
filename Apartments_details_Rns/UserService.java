package Apartments_details_Rns;
import java.util.ArrayList;
import java.util.List;
import  java.sql.*;

public class UserService {

    public List<User> showUsers() throws Exception {
        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM user;";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();

            List<User> userList = new ArrayList<>();

            while (rs.next()) {
                User user = new User(rs.getInt("user_id"), rs.getString("name"), rs.getString("username"),rs.getString("password"), rs.getInt("phone"));
                userList.add(user);
            }

            rs.close();
            stmt.close();
            db.close();

            return userList;

        } catch (Exception e) {
            throw new Exception("Error fetching users: " + e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                e.getMessage();
            }
        }
    }

    public User authenticate(String username, String password) throws Exception {
    

        DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM user WHERE username=? AND password=?;";

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);

            // setting parameters
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            // case not valid credentials
            if (!rs.next()) {
                rs.close();
                stmt.close();
                db.close();
                throw new Exception("Wrong username or password");
            }

            // case valid credentials
            User user = new User(rs.getInt("user_id"),
                        rs.getString("name"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getInt("phone"));
            
            rs.close();
            stmt.close();
            db.close();

            return user;


        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                
            }
        }

    }
    
}
