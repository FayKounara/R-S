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
		apartments.add(new Apartment(12, "Deluxe Apartment", "11/12/2023", "15/12/2023", "Paris","paris", 300, 1,"ok",true, false, 5));
		apartments.add(new Apartment(13, "Best hotel", "11/12/2023", "15/12/2023", "Athens","paris", 300, 1,"ok",true, false, 6));
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
	public Apartment authenticate( String city,int cap) throws Exception {  //when it works it need dates and capacity
		
		List<Apartment> aparts = getApartments();
		List<Apartment> available_apartments = new ArrayList<Apartment>();

		for (Apartment apart: aparts) {
	        //lista kanonika gia na ta krataei ola			
			if (apart.getCity().equals(city) && apart.getCapacity()==cap ) {
				available_apartments.add(apart); 
			}				
		}
		return available_apartments;							
		
		
	} 

} 
