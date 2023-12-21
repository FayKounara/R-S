package Apartments_details_Rns;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import java.time.LocalDate;


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
	public List<Apartment> authenticate( String city,int cap, String available_from, String available_until) throws Exception {  //when it works it need dates and capacity
		List<Apartment> aparts = getApartments();
		List<Apartment> available_apartments = new ArrayList<Apartment>();
		String dateString =available_from;
        int count=0;
        // Parse the date string to LocalDate
        LocalDate date = LocalDate.parse(dateString);

        // Extract individual components
        int year = date.getYear();
        int month = date.getMonthValue();
        int day = date.getDayOfMonth();
		String dateString1 =available_until;

        // Parse the date string to LocalDate
        LocalDate date1 = LocalDate.parse(dateString1);

        // Extract individual components
        int year1 = date1.getYear();
        int month1 = date1.getMonthValue();
        int day1 = date1.getDayOfMonth();
		for (Apartment apart: aparts) {
            String dateString_db_f =apart.getAvailableFrom();

            // Parse the date string to LocalDate
            LocalDate date_db_f = LocalDate.parse(dateString_db_f);

            // Extract individual components
            int year_db_f = date_db_f.getYear();
            int month_db_f = date_db_f.getMonthValue();
            int day_db_f = date_db_f.getDayOfMonth();	
            
            String dateString_db_u =apart.getAvailableUntil();

            // Parse the date string to LocalDate
            LocalDate date_db_u = LocalDate.parse(dateString_db_u);

            // Extract individual components
            int year_db_u = date_db_u.getYear();
            int month_db_u = date_db_u.getMonthValue();
            int day_db_u = date_db_u.getDayOfMonth();
			if (apart.getCity().equals(city) && apart.getCapacity()==cap) {
				if (year==year1){
                    if(month==month1 && day<=day1)  {
                        count++;
                    }else if (month<month1){
                        count++;
                    }
                }else if (year<year1){
                    count++;
                }
            
                if (count>0){
                    if(year==year_db_f && month>=month_db_f && month<=month_db_u && year1==year_db_u && day>=day_db_f && day1<=day_db_u){
                        available_apartments.add(apart); 

                }
			    }		
            }		
        }

		return available_apartments;							
		
		
	} 

} 