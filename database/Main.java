package database;
import  java.sql.*;
import java.util.List;
public class Main {
    public static void main(String[] args) {
        try {
            UserService userService = new UserService();
            List<User> users = userService.showUsers();

            // Now you can do something with the list of users, for example, print their names.
            for (User user : users) {
                System.out.println("User: " + user.getFirstname() +"  "+ user.getUsername()+"  " + user.getPhone()+"  " + user.getId());
            }
        } catch (Exception e) {
            // Handle exceptions appropriately
            e.printStackTrace();
        }
    }
}

