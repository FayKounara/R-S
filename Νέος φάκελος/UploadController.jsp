<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*, java.util.List" %>

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
String[] imageUrls = request.getParameterValues("imageUrl[]");
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
System.out.println("Debug Point 1");

try {
  Apartment apartment = new Apartment(name,check_in,check_out,
   city, address, price1,capacity1,features,rent,swap,1);

  ApartmentUpload obj2=new ApartmentUpload();
  obj2.showApartment(apartment);
  Swap obj=new Swap();

  if (imageUrls != null && imageUrls.length > 0) { %>
    <%for (String imageUrl : imageUrls) { %>
        <% if (imageUrl.length() > 65535) {

            int chunkSize = 65535; // Set the desired chunk size
            int part=0;

            for (int i = 0; i < imageUrl.length(); i += chunkSize) {
                int endIndex = Math.min(i + chunkSize, imageUrl.length());
                String chunk = imageUrl.substring(i, endIndex);
                part += 1;
                //int id=obj.findid_apart(user.getId(),option);
                Apartment apartment_img = new Apartment(chunk, part, 3);
                obj2.showImage(apartment_img);
            }

        } else {
            int part= 1;
            Apartment apartment_img = new Apartment(imageUrl, part, 3);
            obj2.showImage(apartment_img);
        }
    }
 } else {
     System.out.println("Debug Point 2");

     String errorMessage = "No available images";
     request.setAttribute("error", errorMessage);
 }

%>
<jsp:forward page="Upload_2.jsp" />
<%

} catch (Exception e) {
   e.printStackTrace();
   String errorMessage = "An error has occured";
   request.setAttribute("error", errorMessage);    

}
%>


