<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>
<%@ page import="Apartments_details_Rns.*, java.util.List" %>

<!DOCTYPE html>
<html>
<head>
   <title>View Apartment</title>
</head>
<body>
   <h2>View Apartment</h2>

   <% String[] imageUrls = request.getParameterValues("imageUrl[]"); %>
   <%ApartmentUpload obj2=new ApartmentUpload();%>


   <% if (imageUrls != null && imageUrls.length > 0) { %>
       <h3>Apartment Images</h3>
       <div>
        <%for (String imageUrl : imageUrls) { %>
            <img src="<%= imageUrl %>" alt="Apartment Image" />
            <% if (imageUrl.length() > 65535) {

                int chunkSize = 65535; // Set the desired chunk size
                int part=0;

                for (int i = 0; i < imageUrl.length(); i += chunkSize) {
                    int endIndex = Math.min(i + chunkSize, imageUrl.length());
                    String chunk = imageUrl.substring(i, endIndex);
                     part += 1;
                    Apartment apartment_img = new Apartment(chunk, part, 1);
                    obj2.showImage(apartment_img);
                }

            } else {
                int part= 1;
                Apartment apartment_img = new Apartment(imageUrl, part, 1);
                obj2.showImage(apartment_img);
            }
    }
}%>

   <br/>
   <br/>

   <!-- Add a link to go back to the previous page -->
   <a href="javascript:history.go(-1)">Go back</a>
</body>
</html>
