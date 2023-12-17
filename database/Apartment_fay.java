<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, java.util.List" %>
<%
String destination = request.getParameter("search-box");
String datecheckin = request.getParameter("checkin");
String datecheckout = request.getParameter("checkout");
String guests = request.getParameter("passengers"); %>
     <% 
     ApartmentDAO_fay ap= new ApartmentDAO_fay();
     try{
        int cap = Integer.parseInt(guests);
        List<Apartment_fay> receivedList = ap.authenticate(destination,cap,datecheckin,datecheckout);
        
        if (receivedList!=null) {
         
         if (!receivedList.isEmpty()) {
            session.setAttribute("apartmentList", receivedList);
            session.setAttribute("destname", destination);
         %>
            <jsp:forward page="SearchResults_fay.jsp" />
         <%
         } else {
            %>
            <jsp:forward page="Homepage_fay.jsp" />
         <% 
         }
        } else {
            %>
               <jsp:forward page="Homepage_fay.jsp" />
         <%

        }

     } catch(Exception e) {
      request.setAttribute("message",e.getMessage());%>
      <jsp:forward page="Homepage_fay.jsp" />   <%
     }  %>
