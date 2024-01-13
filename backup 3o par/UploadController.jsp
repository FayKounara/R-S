<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
String name = request.getParameter("name");
String city = request.getParameter("city");
String capacity = request.getParameter("capacity");
String address = request.getParameter("address");
String price = request.getParameter("price");
String in = request.getParameter("check-in");
String check_out = request.getParameter("check-out");
String features = request.getParameter("features");
String reason1 = request.getParameter("reason1");
String reason2 = request.getParameter("reason2");


try {
  int cap = Integer.parseInt(capacity);
  int pr = Integer.parseInt(price);
  response.sendRedirect("apartment_final.html");
 
} catch (NumberFormatException e) {
  request.setAttribute("error_message", "Please fill in the form correctly");
  response.sendRedirect("Upload.jsp");
} 


%>
     
