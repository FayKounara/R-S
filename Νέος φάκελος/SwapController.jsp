<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%
String but = request.getParameter("buttonrs");
SwapCon sw= (SwapCon)session.getAttribute("swap2");
Apartment ap1=(Apartment)session.getAttribute("swap_apartment");
Apartment ap2=(Apartment)session.getAttribute("swap_apartment1");

if (but != null && but.equals("ACCEPT")) {
    Booking book = new Booking();
    book.bookApartment(sw.getCheckin(), sw.getCheckout(), ap1.getApartmentId(), ap2.getUserId());
    book.bookApartment(sw.getCheckin(), sw.getCheckout(), ap2.getApartmentId(), ap1.getUserId());
    
}%>