<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*,java.util.List" %>
<%@ page import="java.util.Date" %>


<% String datecheckin = request.getParameter("checkin");
String userDateString = datecheckin;

Example ex = new Example();

// Convert user-entered string to java.util.Date
Date userDate = ex.convertStringToDate(userDateString);

// Check if the conversion was successful
if (userDate != null) {%>
    <h1><%=userDate%></h1>
    
<%} else {%>
    <h1>Invalid date format or parsing error."</h1>
<%}%>