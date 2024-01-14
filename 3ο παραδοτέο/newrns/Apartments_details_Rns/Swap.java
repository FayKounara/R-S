package Apartments_details_Rns;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
public class Swap {
    public List<String> getSwapApartments(int user_id) throws Exception{
        List<String> swap_apart=new ArrayList<String>();
        DB db=new DB();
        Connection con = null;
        String query = "SELECT name FROM apartment where user_id=? and up_swap=?;";
        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);
            stmt.setInt(2,1);
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                swap_apart.add(rs.getString("name"));
            }

            rs.close();
            stmt.close();
            db.close();

            return swap_apart;

            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }

    }
    public void swap_apart(int user_id,int apartment_id,String name,String option_apart,String check_in,String check_out,int apartment_id1) throws Exception{
        //name:the name of the apartment that the user wants
        //apartment_n:the name of the user's apartment that he/she wants to swap
        //apartment_id1 is the id that you choose from the search result
        DB db = new DB();
        Connection con = null;
        String query= "INSERT INTO swap (user_id,apartment_id,name,option_apart,check_in,check_out,apartment_id1) VALUES (?, ?, ?, ?, ?, ?, ?);";

        try {
            
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);
            stmt.setInt(2,apartment_id);
            stmt.setString(3,name);
            stmt.setString(4,option_apart);
            stmt.setString(5,check_in);
            stmt.setString(6,check_out);
            stmt.setInt(7,apartment_id1);
            stmt.executeUpdate();
            stmt.close();


        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		
		
	}
    public int findid_apart(int user_id,String name) throws Exception{
        DB db=new DB();
        Connection con = null;
        String query = "SELECT apartment_id FROM apartment where user_id=? and up_swap=? and name=?;";
        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);
            stmt.setInt(2,1);
            stmt.setString(3,name);
            
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
     public List<String> find_notification1(int user_id) throws Exception{
        //2 methods for 2 things ..a different way maybe;
        List<String> notifications1=new ArrayList<String>();
        DB db=new DB();
        Connection con = null;
        String query = "SELECT name FROM swap where user_id=?;";
        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                notifications1.add(rs.getString("name"));
            }

            rs.close();
            stmt.close();
            db.close();

            return notifications1;

            
        } catch (Exception e) {
            throw new Exception(e.getMessage());
        } finally {
            try {
                db.close();    
            } catch (Exception e) {
                
            }
            
        }

    }
    public List<String> find_notification2(int user_id) throws Exception{
        //2 methods for 2 things ..a different way maybe;
        List<String> notifications2=new ArrayList<String>();
        DB db=new DB();
        Connection con = null;
        String query = "SELECT option_apart FROM swap where user_id=?;";
        try {

            con = db.getConnection();

            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1,user_id);
            
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                notifications2.add(rs.getString("option_apart"));
            }

            rs.close();
            stmt.close();
            db.close();

            return notifications2;

            
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
