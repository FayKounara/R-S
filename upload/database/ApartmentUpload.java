package database;
import java.util.ArrayList;
import java.util.List;
import  java.sql.*;

public class ApartmentUpload {
    public  void showApartment(Apartment apart) throws Exception {
        DB db = new DB();
        Connection con = null;
        String query = "INSERT INTO apartment (name,available_from,available_until,city,address,price,capacity,features,up_rent,up_swap,user_id) VALUES (?,?,?,?,?,?,?,?,?,?,?);";

        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1,apart.getName());
            stmt.setString(2,apart.getAvailableFrom());
            stmt.setString(3,apart.getAvailableUntil());
            stmt.setString(4,apart.getCity());
            stmt.setString(5,apart.getAddress());
            stmt.setFloat(6,apart.getPrice());
            stmt.setInt(7,apart.getCapacity());
            stmt.setString(8,apart.getFeatures());
            stmt.setInt(9,apart.getUpRent());
            stmt.setInt(10,apart.getUpSwap());
            stmt.setInt(11,apart.getUserId());
            stmt.executeUpdate(); //execute (SQL Statement) sql2
            stmt.close();
            
        } catch (Exception e) {
            throw new Exception("Error: " + e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                e.getMessage();
            }
        }
    }
}
