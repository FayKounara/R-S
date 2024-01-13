<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String destination = request.getParameter("search-box");
String datecheckin = request.getParameter("checkin");
String datecheckout = request.getParameter("checkout");
String guests = request.getParameter("passengers"); %>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
     <p><%=destination%></p> 
     <p><%=datecheckin%></p>
     <p><%=datecheckout%></p>
     <p><%=guests%></p>

     <% 
     ApartmentDAO ap= new ApartmentDAO();
     try{
        int cap = Integer.parseInt(guests);
        Apartment apart1 = ap.authenticate(destination,cap);
        session.setAttribute("userObj2023", apart1);
     } catch(Exception e) {
        %> <p>Wrong</p>
     }  %>
    

    </body>
</html>