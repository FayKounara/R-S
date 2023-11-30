package database;
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
                User user = new User(rs.getString("name"),rs.getString("username"),rs.getString("phone"),rs.getInt("user_id"));
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
}
