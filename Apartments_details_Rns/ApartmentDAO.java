package Apartments_details_Rns;

import java.util.ArrayList;
import java.util.List;


public class ApartmentDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<Apartment> getApartments() throws Exception {

		List<Apartment> apartments = new ArrayList<Apartment>();
		apartments.add(new Apartment(11, "Maria's apartment", "11/12/2023", "15/12/2023", "Paris","paris", 300, 1,"ok",true, false, 4));
		return apartments;
			
	} 

	
	

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public Apartment authenticate( String city) throws Exception {  //when it works it need dates and capacity
		
		List<Apartment> aparts = getApartments();

		for (Apartment apart: aparts) {
	        //lista kanonika gia na ta krataei ola			
			if (apart.getCity().equals(city) ) {
				return apart; 
			}
					
		}
		return null;							
		
		
	} 

} 
