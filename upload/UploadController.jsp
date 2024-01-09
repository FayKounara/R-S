<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, java.util.List" %>

<%
String name = request.getParameter("name");
String city = request.getParameter("city");
String capacity = request.getParameter("capacity");
String address = request.getParameter("address");
String price = request.getParameter("price");
String check_in = request.getParameter("check-in");
String check_out = request.getParameter("check-out");
String features = request.getParameter("features");
String reason1 = request.getParameter("reason1");
String reason2 = request.getParameter("reason2");
int capacity1 = Integer.parseInt(capacity);
float price1=Float.parseFloat(price);
int rent;
int swap;
if ("rent".equals(reason1)){
     rent=1;
} else{
     rent=0 ;
}

if ("swap".equals(reason2)){
     swap=1;
} else{
     swap=0 ;
}

try {
  Apartment apartment = new Apartment(name,check_in,check_out,
   city, address, price1,capacity1,features,1,1,1);

  ApartmentUpload obj2=new ApartmentUpload();
  obj2.showApartment(apartment);
%>
<jsp:forward page="Upload.jsp" />
<%

} catch (Exception e) {
   e.printStackTrace();

}
%>


     
