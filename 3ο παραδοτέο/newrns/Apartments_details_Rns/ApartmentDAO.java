package Apartments_details_Rns; 

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class ApartmentDAO{	

	/**
	 * This method is used to search for available apartments.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public List<Apartment> searchApartments(String city,int cap, String available_from, String available_until, String choice) throws Exception { 
       
        List<Apartment> available_apartments = new ArrayList<Apartment>();
		DB db = new DB();
        Connection con = null;
        String query = "SELECT apartment.* " +
                       "FROM apartment " +
                       "WHERE apartment.city=? AND apartment.capacity=? " +
                       "AND apartment.available_from <= ? AND apartment.available_until >= ? " +
                       "AND NOT EXISTS ( " +
                        "SELECT 1 "  +
                        "FROM bookings " +
                        "WHERE apartment.apartment_id = bookings.apartment_id " +
                        "AND bookings.check_out > ? " +
                         "AND bookings.check_in < ?) ";
        

        try {

            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1,city);
            stmt.setInt(2,cap);
            stmt.setString(3,available_from);
            stmt.setString(4,available_until);
            stmt.setString(5,available_from);
            stmt.setString(6,available_until);
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                if (choice=="rent") {
                    if (rs.getInt("up_rent")==1) {
                        Apartment apart=new Apartment( rs.getString("name"), rs.getString("available_from"), rs.getString("available_until"), rs.getString("city"), rs.getString("address"),
				            rs.getFloat("price"), rs.getInt("capacity"), rs.getString("features"), rs.getInt("up_rent"), rs.getInt("up_swap"),rs.getInt("user_id"));
                        apart.setApartmentId(rs.getInt("apartment_id"));
                        available_apartments.add(apart);

                    } 

                } else if (choice=="swap") {
                    if (rs.getInt("up_swap")==1) {
                        Apartment apart=new Apartment(rs.getString("name"), rs.getString("available_from"), rs.getString("available_until"), rs.getString("city"), rs.getString("address"),
				            rs.getFloat("price"), rs.getInt("capacity"), rs.getString("features"), rs.getInt("up_rent"), rs.getInt("up_swap"),rs.getInt("user_id"));
                        apart.setApartmentId(rs.getInt("apartment_id"));
                        available_apartments.add(apart);
                    }  
                }
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
		
    public List<Apartment> AddImages(int apartment_id) throws Exception {  //when it works it need dates and capacity

        List<Apartment> imageList = new ArrayList<Apartment>();
        DB db = new DB();
        Connection con = null;
        String query1 = "Select * from images where apartment_id=?";
    
        try {
    
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query1);
            stmt.setInt(1,apartment_id);
    
            ResultSet rs = stmt.executeQuery();
    
            while (rs.next()) {
                    Apartment apart=new Apartment(rs.getString("image_url"), rs.getInt("part"), rs.getInt("apartment_id"));
                    imageList.add(apart);
                }
            
    
            rs.close();
            stmt.close();
            db.close();
    
    
            return imageList;
    
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
    
            }
    
        }
    
    
    }
    public int findid_apart(int user_id,String name) throws Exception{
        DB db=new DB();
        Connection con = null;
        String query = "SELECT apartment_id FROM apartment where user_id=? and name=?;";
        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);
            stmt.setString(2,name);
            
            ResultSet rs = stmt.executeQuery();
            int id=0;

            if (rs.next()) {
                id=rs.getInt("apartment_id");
            }

            rs.close();
            stmt.close();
            db.close();

            return id;

            
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

































