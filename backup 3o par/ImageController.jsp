<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="Apartments_details_Rns.*, java.util.List" %>


<% String[] imageUrls = request.getParameterValues("imageUrl[]"); %>
<%ApartmentUpload obj2=new ApartmentUpload();%>

<% 
ApartmentDAO obj=new ApartmentDAO();
String apartmentName = (String) session.getAttribute("apartmentName");
User user = (User) session.getAttribute("authenticated_user");
if(user!=null){
if (apartmentName != null) {
    int id = obj.findid_apart(user.getId(), apartmentName);
%>
<% if (imageUrls != null && imageUrls.length > 0) { %>

    <%for (String imageUrl : imageUrls) { %>
        <% if (imageUrl.length() > 65535) {

            int chunkSize = 65535; // Set the desired chunk size
            int part=0;

            for (int i = 0; i < imageUrl.length(); i += chunkSize) {
                int endIndex = Math.min(i + chunkSize, imageUrl.length());
                String chunk = imageUrl.substring(i, endIndex);
                    part += 1;
                Apartment apartment_img = new Apartment(chunk, part, id);
                obj2.showImage(apartment_img);
            }

        } else {
            int part= 1;
            Apartment apartment_img = new Apartment(imageUrl, part, id);
            obj2.showImage(apartment_img);
        }
    }
        %>
        <jsp:forward page="Homepage.jsp" />
        <%
    }
} 
}  else {
    %>
    <jsp:forward page="Login.jsp" />
    <%
    }    %>

