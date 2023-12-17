package database;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;


public class ApartmentDAO_fay {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<Apartment_fay> getApartments() throws Exception {

		List<Apartment_fay> apartments = new ArrayList<Apartment_fay>();
		DB db = new DB();
        Connection con = null;
        String query = "SELECT * FROM apartment;";

        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                apartments.add( new Apartment_fay(rs.getInt("apartment_id"), rs.getString("name"), rs.getString("available_from"), rs.getString("available_until"), rs.getString("city"), rs.getString("address"),
				        rs.getFloat("price"), rs.getInt("capacity"), rs.getString("features"), rs.getInt("up_rent"), rs.getInt("up_swap"),rs.getInt("user_id")));

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
	public List<Apartment_fay> authenticate(String city,int cap, String available_from, String available_until) throws Exception {  //when it works it need dates and capacity
		
		List<Apartment_fay> aparts = getApartments();
		List<Apartment_fay> available_apartments = new ArrayList<Apartment_fay>();

		for (Apartment_fay apart: aparts) {
	        //lista kanonika gia na ta krataei ola			
			if (apart.getCity().equals(city) && apart.getCapacity()==cap && apart.getAvailableFrom().equals(available_from) && apart.getAvailableUntil().equals(available_until)) {
				available_apartments.add(apart); 
			}				
		}

		return available_apartments;							
		
		
	} 

} 