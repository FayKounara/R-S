package Apartments_details_Rns;

public class User {
    private int user_id;
    private String firstname;
    private String username;
    private String password;
    private long phone;



    /**
     * Full constuctor
     *
     * @param user_id
     * @param firstname
     * @param username
     * @param password
     * @param phone
     *
     *
     */
    public User(String firstname,String username, String password, long phone) {
        this.firstname = firstname;
        this.username=username;
        this.password=password;
        this.phone=phone;

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

    public long getPhone() {
        return phone;
    }

    public void setPhone(long phone) {
        this.phone = phone;
    }

    public int getId() {
        return user_id;
    }

    public void setId(int user_id) {
        this.user_id = user_id;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}