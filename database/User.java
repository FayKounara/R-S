package database;

public class User {
    
    private String firstname;
    private String username;
    private int user_id;
    private String phone;
    
	

    /**
     * Full constuctor
     * 
     * @param firstname
     * @param username
     * @param password
     * @param phone
     * @param user_id
     *
     */
    public User(String firstname,String username,String phone,int user_id) {        
        this.firstname = firstname;
        this.username=username;
        this.phone=phone;
        this.user_id=user_id;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;     
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;     
    }
    
    public int getId() {
        return user_id;
    }

    public void setId(int user_id) {
        this.user_id = user_id;     
    }
    
   


}