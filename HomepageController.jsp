<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.List" %>


<%
String destination = request.getParameter("search-box");
String datecheckin = request.getParameter("checkin");
String datecheckout = request.getParameter("checkout");
String guests = request.getParameter("passengers"); 

ApartmentDAO ap= new ApartmentDAO();

try {
    int cap = Integer.parseInt(guests);
    List<Apartment> apart1 = ap.authenticate(destination,cap);
    session.setAttribute("availableApart", apart1);
    
    if (apart1!=null) {
        %>
           <jsp:forward page="SearchResults.jsp" />
        <%
    } else {
        %>
           <jsp:forward page="Homepage.jsp" />
        <%

    } 

} catch(Exception e) {
   request.setAttribute("message", "No results match your research");%>
   <jsp:forward page="Homepage.jsp" />
 <% 
} %>

