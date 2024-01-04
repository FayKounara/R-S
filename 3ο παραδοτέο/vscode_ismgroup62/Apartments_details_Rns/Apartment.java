package Apartments_details_Rns;

public class Apartment {
    private int apartment_id;
    private String name;
	private String available_from;
	private String available_until;
	private String city;
	private String address;
    private float price;
    private int capacity;
    private String features;
    private int up_rent;
    private int up_swap;
    private int user_id;


    /**
     * Full constuctor
     *   
     * 
     *  @param apartment_id;
     *  @param  name;
	 *  @param available_from;
	 *  @param available_until;
	 *  @param city;
	 *  @param address;
     *  @param price;
     *  @param capacity;
     *  @param features;
     *  @param up_rent;
     *  @param up_swap;
     *  @param user_id;
    
     */
    public Apartment(int apartment_id, String name, String available_from, String available_until, 
                String city, String address, float price, int capacity, String features, int up_rent,int up_swap, int user_id) {        
        this.name = name;
        this.apartment_id = apartment_id;
        this.available_from= available_from;
        this.available_until = available_until;
        this.city = city;
        this.address= address;
        this.price= price;
        this.capacity= capacity;
        this.features= features;
        this.up_rent= up_rent;
        this.up_swap= up_swap;
        this.user_id= user_id;
    }

    public int getApartmentId() {
        return apartment_id;
    }
    public void setApartmentId(int apartment_id) {
        this.apartment_id = apartment_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvailableFrom() {
        return available_from;
    }

    public void setAvailableFrom(String available_from) {
        this.available_from = available_from;
    }

    public String getAvailableUntil() {
        return available_until;
    }

    public void setAvailableUntil(String available_until) {
        this.available_until = available_until;
    }
    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address= address;
    }
    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public void setFeatures(String features) {
        this.features = features;
    }
    public String getFeatures() {
        return features;
    }
    public void setUpRent(int up_rent) {
        this.up_rent = up_rent;
    }
    public int getUpRent() {
        return up_rent;
    }
    public void setUpSwap(int up_swap) {
        this.up_swap = up_swap;
    }
    public int getUpSwap() {
        return up_swap;
    }
    public void setUserId(int user_id) {
        this.user_id = user_id;
    }
    public int getUserId() {
        return user_id;
    }


}