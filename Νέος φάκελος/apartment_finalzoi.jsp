<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="Apartments_details_Rns.*,java.util.List" %>

<%String apartmentId = request.getParameter("apartmentId");
String name = request.getParameter("name");
String features = request.getParameter("features");
String capacity = request.getParameter("capacity");
String price = request.getParameter("price");
String from = request.getParameter("from");
String until = request.getParameter("until");
String address = request.getParameter("address");
String city = request.getParameter("city");%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>R&S | Swap</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" type="text/css" href="r&s.css" />
        <!-- FontAwesome CSS link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  </head>

  <body class="Apartment_page">
    <div class="content">
      <div id="abc">
        <nav>
          <ul>
            <li><a href="Homepage.html">Home</a></li>
            <li><a href="#">Notifications</a></li>
            <li><a href="Upload.html">Upload</a></li>
            <li><a href="#">Profile</a></li>
            <li><a href="#">Login/Sign-up</a></li>
          </ul>
        </nav>
      </div>
  
      <div class="UpforSwap">
        <img src="images_html\UpforSwap.png" alt="Slogan" />
      </div>
  
      <div class="Apartment-details">
        <div class="Details-container">
          <div class="Apartment-name">
            <p class="Name"><%=name%></p>
          </div>
          <ul class="Details-list">
            <div class="Code">
              <p><strong>Code:</strong> <span><%=apartmentId%></span></p>
            </div>
            <li>
              <strong>Availabily:</strong> <span>from <%=from%> until <%=until%></span>
            </li>
            <li><strong>Guest capacity:</strong> <span><%=capacity%> people</span></li>
            <li><strong>City:</strong> <span><%=city%></span></li>
            <li><strong>Address:</strong> <span>Vasili Logothetidi 15, Athina 115 24</span></li>
            <li><strong>Features:</strong> <span><%=features%></span></li>
            <li><strong>Contact the owner:</strong> <span> +30 6989015077<span></li>
          </ul>
        </div>
      </div>
  
      <div>
        <a href="payment.html">
          <button type="button" class="reservation_button">Make offer</button>
        </a>
        
      </div>
  
      <div class="image-container">
        <div class="image-wrapper">
          <img src="images_html\apartment_photo.webp" alt="Bedroom" />
        </div>
  
        <div class="image-wrapper">
          <img src="images_html\kitchen.webp" alt="kitchen" />
        </div>
  
        <div class="image-wrapper">
          <img src="images_html\bathroom.webp" alt="bathroom" />
        </div>
      </div>
  
      <!-- Add an input checkbox and label for the "See more photos" button -->
      <div class="see-more-button">
        <button type="button" id="see-more-button">See more photos</button>
      </div>
  
      <!-- Add a div to wrap the checkbox and label -->
      <div class="image-container extra-images">
        <!-- Add three more images with the same layout (initially hidden) -->
        <div class="image-wrapper">
          <img src="images_html\garden.jpg" alt="Garden" />
        </div>
  
        <div class="image-wrapper">
          <img src="images_html\dining_room.jpg" alt="Dining Room" />
        </div>
  
        <div class="image-wrapper">
          <img src="images_html\balcony.jpg" alt="Balcony" />
        </div>
      </div>
    </div>
    <div class="footer">
      <p>&copy; 2023 Your Website Name. All rights reserved.</p>
      <div class="social-icons">
          <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
          <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
          <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
          <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
      </div>
  </div>
    
  </body>
  <script>
    document.getElementById("see-more-button").addEventListener("click", function () {
      var extraImages = document.querySelector(".extra-images");
      extraImages.style.display =
        extraImages.style.display === "none" ||
        extraImages.style.display === ""
          ? "flex"
          : "none";
  
      var button = document.getElementById("see-more-button");
      button.textContent = extraImages.style.display === "flex" ? "See less photos" : "See more photos";
  
      // Scroll down by 200 pixels (adjust as needed)
      window.scrollBy(0, 270);
    });
  </script>
  
</html>
