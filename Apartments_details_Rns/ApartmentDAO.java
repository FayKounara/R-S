package Apartments_details_Rns;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;


public class ApartmentDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<Apartment> getApartments() throws Exception {

		List<Apartment> apartments = new ArrayList<Apartment>();
		DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM apartment;";

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                apartments.add( new Apartment(rs.getInt("apartment_id"), rs.getString("name"), rs.getString("available_from"), rs.getString("available_until"), rs.getString("city"), rs.getString("address"),
				        rs.getFloat("price"), rs.getInt("capacity"), rs.getString("features"), rs.getBoolean("up_rent"), rs.getBoolean("up_swap"),rs.getInt("user_id")));

            }

            rs.close();
            stmt.close();
            db.close();

            return apartments;

            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }
			
	} 

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public List<Apartment> authenticate( String city,int cap) throws Exception {  //when it works it need dates and capacity
		List<Apartment> available_apartments = new ArrayList<Apartment>();
		DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM apartment WHERE city=? AND capacity=?;";

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1,city);
			stmt.setInt(2,cap);
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                available_apartments.add( new Apartment(rs.getInt("apartment_id"), rs.getString("name"), rs.getString("available_from"), rs.getString("available_until"), rs.getString("city"), rs.getString("address"),
				        rs.getFloat("price"), rs.getInt("capacity"), rs.getString("features"), rs.getBoolean("up_rent"), rs.getBoolean("up_swap"),rs.getInt("user_id")));

            }

            rs.close();
            stmt.close();
            db.close();

            return available_apartments;

            
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
