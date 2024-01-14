package Apartments_details_Rns;
import  java.sql.*;

public class UserService {

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
            User user = new User(rs.getString("name"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("phone"));
            user.setId(rs.getInt("user_id"));
            
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
        String query1= "INSERT INTO user (name, username, password, phone) VALUES (?, ?, ?, ?);";

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, user.getUsername());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                throw new Exception("Sorry, username already registered!");
            }
    
			
            PreparedStatement stmt1 = con.prepareStatement(query1);
            stmt1.setString(1, user.getFirstname());
            stmt1.setString(2, user.getUsername());
			stmt1.setString(3, user.getPassword());
            stmt1.setString(4, user.getPhone());

            stmt1.executeUpdate();
            rs.close();
            stmt1.close();


        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		
		
	}

}
