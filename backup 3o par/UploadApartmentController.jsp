<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*, java.util.List,java.time.LocalDate;" %>

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
LocalDate fromDate = LocalDate.parse(check_in);
LocalDate untilDate = LocalDate.parse(check_out);

if (!fromDate.isBefore(untilDate)) {
   request.setAttribute("error", "Please enter valid dates");
   %>
      <jsp:forward page="Upload.jsp" />
   <% 
   
}
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
System.out.println("Debug Point 1");

try {
     User user = (User) session.getAttribute("authenticated_user");
     Apartment apartment = new Apartment(name,check_in,check_out,
        city, address, price1,capacity1,features,rent,swap,user.getId());

  ApartmentUpload obj2=new ApartmentUpload();

  obj2.showApartment(apartment);

%>
<%
   String apartmentName = apartment.getName(); // Replace this with the actual value
   session.setAttribute("apartmentName", apartmentName);

%>
     <jsp:forward page="UploadImages.jsp" />
<%

} catch (Exception e) {
   e.printStackTrace();
   String errorMessage = "An error has occured";
   request.setAttribute("error", errorMessage);    

}
%>


