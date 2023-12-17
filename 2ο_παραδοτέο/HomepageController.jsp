<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.List" %>
<%
String destination = request.getParameter("search-box");
String datecheckin = request.getParameter("checkin");
String datecheckout = request.getParameter("checkout");
String guests = request.getParameter("passengers"); %>

     <% 
     ApartmentDAO ap= new ApartmentDAO();
     try{
        int cap = Integer.parseInt(guests);
        List<Apartment> receivedList = ap.authenticate(destination,cap);
        
        if (receivedList!=null) {
         
         if (!receivedList.isEmpty()) {
            session.setAttribute("apartmentList", receivedList);
            session.setAttribute("destname", destination);
         %>
            <jsp:forward page="SearchResults.jsp" />
         <%
         } else {
            %>
            <jsp:forward page="Homepage.jsp" />
         <% 
         }
        } else {
            %>
               <jsp:forward page="Homepage.jsp" />
         <%

        }

     } catch(Exception e) {
      request.setAttribute("message", "No results match your research");%>
      <jsp:forward page="Homepage.jsp" />   <%
     }  %>

