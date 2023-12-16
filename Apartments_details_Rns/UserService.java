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

    public void register(User user) throws Exception {
		DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM user WHERE username=?;";
        String query1= "INSERT INTO user (user_id, name, username, password, phone) VALUES (?, ?, ?, ?, ?);";

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username already registered");
            }
    
			
            PreparedStatement stmt1 = con.prepareStatement(query1);
            stmt1.setInt(1, user.getId());
            stmt1.setString(2, user.getFirstname());
            stmt1.setString(3, user.getUsername());
			stmt1.setString(4, user.getPassword());
            stmt1.setInt(5, user.getPhone());

            stmt1.executeUpdate();
            rs.close();
            stmt1.close();


        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace(); // Handle or log the exception accordingly
            }
        }
		
		
	}//end of register

}
