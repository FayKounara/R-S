<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%
//get parameter from request
String name1=request.getParameter("fname");
String surname=request.getParameter("lname");
String email=request.getParameter("email");
String phone=request.getParameter("phone");
String card=request.getParameter("card1");
String name=request.getParameter("name");
String expire=request.getParameter("expire");
String options=request.getParameter("options");
String cvv=request.getParameter("cvv");

int errors=0;
ArrayList<String> list=new ArrayList<String>();
%>
							
<% if (name == null || name.length()==0){
	errors++;
 	list.add("Please fill in your name");
}
if (surname == null || surname.length()==0) {
	errors++;
	list.add("Please fill in your surname");
}
if (cvv == null || cvv.length()==0 || cvv.length()>3) {
	list.add("Please fill in your cvv");
	errors++;
}
if (expire == null || expire.length()==0) {
	errors++;
	list.add("Please fill in your card's expire date");
}
if (email == null || email.length() == 0) {
	errors++;
	list.add("Please fill in your email");
}
if (options == null || options.length() == 0) {
	errors++;
	list.add("Please select your payment method");
}
if (card == null || card.length() == 0) {
	errors++;
	list.add("Please fill in your card number");
}
if (phone == null || phone.length() == 0) {
	errors++;
	list.add("Please fill in your phone number");
}
request.setAttribute("error",list);
%>
<jsp:forward page="payment.jsp" />
							
					