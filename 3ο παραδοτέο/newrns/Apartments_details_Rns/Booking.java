package Apartments_details_Rns;
import  java.sql.*;

public class Booking {

    public void bookApartment(String available_from, String available_until, int apartment_id,int user_id)  throws Exception{
        DB db = new DB();
        Connection con = null;
        String query= "INSERT INTO bookings (check_in, check_out, apartment_id, user_id) VALUES (?, ?, ?, ?);";
        try {
        
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, available_from);
            stmt.setString(2, available_until);
			stmt.setInt(3, apartment_id);
            stmt.setInt(4, user_id);

            stmt.executeUpdate();  
            stmt.close();


        } catch (Exception e) {
            throw new Exception("Wrong");
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
    
}
