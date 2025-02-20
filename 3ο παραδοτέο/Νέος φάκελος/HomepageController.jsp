<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.List, java.time.LocalDate;" %>
<%
String destination = request.getParameter("search-box");
String datecheckin = request.getParameter("checkin");
String datecheckout = request.getParameter("checkout");
String guests = request.getParameter("passengers");
String but = request.getParameter("buttonrs");

LocalDate fromDate = LocalDate.parse(datecheckin);
LocalDate untilDate = LocalDate.parse(datecheckout);

if (!fromDate.isBefore(untilDate)) {
   request.setAttribute("error", "Please enter valid dates");
   %>
      <jsp:forward page="Homepage.jsp" />
   <% 
   
}
String choice=null;
if (but != null && but.equals("RENT")) {
    session.setAttribute("button1", "RENT");
    choice="rent";
} else if (but != null && but.equals("SWAP")) {
    session.setAttribute("button1", "SWAP");
    choice="swap";
} 


     ApartmentDAO ap= new ApartmentDAO();
     try{
        int cap = Integer.parseInt(guests);
        List<Apartment> receivedList = ap.searchApartments(destination,cap,datecheckin,datecheckout,choice);
        
        if (receivedList!=null) {
         
         if (!receivedList.isEmpty()) {
            session.setAttribute("apartmentList", receivedList);
            session.setAttribute("destname", destination);
         %>
            <jsp:forward page="SearchResults.jsp" />
         <%
         } else {
            String errorMessage = "No results match your search. Try searching a place in Portaria for rent for a time period between the 15th and 20th of December";
            request.setAttribute("error", errorMessage);
            %>
            <jsp:forward page="Homepage.jsp" />
         <% 
         }
        } else {
            
            String errorMessage = "No results match your search. Try searching a place in Portaria for rent, for 5 guests between the 15th and 20th of December";
            request.setAttribute("error", errorMessage);
            %>
               <jsp:forward page="Homepage.jsp" />
         <%

        }

     } catch(Exception e) {
      request.setAttribute("message",e.getMessage());%>
      <jsp:forward page="Homepage.jsp" />   <%
     }  %>