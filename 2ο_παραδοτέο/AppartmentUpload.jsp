<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
import java.util.ArrayList;
import java.util.List;
import  java.sql.*;
    public  void showApartment(Apartment obj) throws Exception {
        DB db = new DB();
        Connection con = null;
        String query = "INSERT INTO apartment VALUES (?,?,?,?,?,?,?,?,?,?,?,?);";
        try {
            con = db.getConnection();
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setInt(1, obj.getApartmentId());
            stmt.setString(2,obj.getName());
            stmt.setString(3,obj.getAvailableFrom());
            stmt.setString(4,obj.getAvailableUntil());
            stmt.setString(5,obj.getCity());
            stmt.setString(6,obj.getAddress());
            stmt.setString(7,obj.getPrice());
            stmt.setInt(8,obj.getCapacity());
            stmt.setString(9,obj.getFeautures());
            stmt.setBoolean(10,obj.getUpSwap());
            stmt.setBoolean(11,obj.getUpRent());
            stmt.setInt(12,obj.getUserId());
            stmt.executeUpdate(); 
            stmt.close();
            
        } catch (Exception e) {
            throw new Exception("Error fetching users: " + e.getMessage());
        } finally {
            try {
                db.close();
            } catch (Exception e) {
                e.getMessage();
            }
        }
    }

%>