<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*,java.util.List" %>
<%@ page import="java.util.ArrayList" %>

<%
String apartmentId = request.getParameter("apartmentId");
Apartment apart=(Apartment)session.getAttribute("swap_apartment");
String name = request.getParameter("name");
String features = request.getParameter("features");
String capacity = request.getParameter("capacity");
String price = request.getParameter("price");
String from = request.getParameter("from");
String until = request.getParameter("until");
String address = request.getParameter("address");
String city = request.getParameter("city");
%>


<html lang="en">
  <head>
    <title>
        Apartment-details
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=0.9">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="r&s.css">
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
</head>

  <body class="Apartment_page">
    <div class="content">
      <div id="abc">
        <nav style="height: 100px;">
            <ul>
                <li><a href="Homepage.jsp">Home</a></li>
                <li><a href="profile.jsp">Notifications</a></li>
                <li><a href="Upload.jsp">Upload</a></li>
                <%if (session.getAttribute("authenticated_user")==null){%>
                    <li><a href="Login.jsp">Login/Sign-up</a></li>
                <%}else{
                    User usernav = (User) session.getAttribute("authenticated_user");
                    String fname = usernav.getFirstname();%>
                    <li><a href="#">Logged in as:<%=fname%></a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                <%}%>
                
            </ul>
        </nav>
    </div>
  
      <div class="Apartment-details">
        <div class="Details-container">
          <div class="Apartment-name">
            <p class="Name"><%=apart.getName()%></p>
          </div>
          <ul class="Details-list">
            <div class="Code">
              <p><strong>Code:</strong> <span><%=apart.getApartmentId()%></span></p>
            </div>
            <li><strong>City:</strong> <span><%=apart.getCity()%></span></li>
            <li><strong>Address:</strong> <span><%=apart.getAddress()%></span></li>
            <li><strong>Features:</strong> <span><%=apart.getFeatures()%></span></li>
            <li><strong>Guest capacity:</strong> <span><%=apart.getCapacity()%></span></li>
            <li><strong>Checkin:</strong> <span><%=(String)session.getAttribute("checkin")%></span></li>
            <li><strong>Checkout:</strong> <span><%=(String)session.getAttribute("checkout")%></span></li>
          </ul>
        </div>
      </div>
      <% if (session.getAttribute("button1")=="RENT"){
        %>
      <div>
        <a href="payment.jsp">
          <button type="button" class="reservation_button">Booking</button>
        </a>
        
      </div>
      <% } else if (session.getAttribute("button1")=="SWAP"){
      %>  
      <div>
        <a href="swap_offer.jsp">
          <button type="button" class="reservation_button">Booking</button>
        </a>
        
      </div>
      <%
    }
    int apart2 = apart.getApartmentId();
          ApartmentDAO im=new ApartmentDAO();
          List<Apartment> apartimages = im.AddImages(apart2);
          List<String> imageUrls= new ArrayList<String>();

          if (apartimages!=null) {
              if (!apartimages.isEmpty()) {
                  String url1="";
                  for (Apartment ap4:apartimages) {
                      if (ap4.getPart()==1) {
                        imageUrls.add(url1);
                        url1="";  
                      }
                      url1+=ap4.getImageURL();
                      if (!imageUrls.isEmpty()) {
                        imageUrls.set(imageUrls.size() - 1, url1);
                      }
                    
                  }   
                  
              } 
          }  
          String im2;  %>  
          <div class="image-container">  <%
          for (int i=0; i<3; i++) { 
            if (i<imageUrls.size())  {
               im2= imageUrls.get(i);
            } else {
              im2="nophoto.png";
            }
            %>
          <div class="image-wrapper">
             <img src="<%=im2%>" >
           </div> 
         <% }  %>
        </div>
      <!-- Add an input checkbox and label for the "See more photos" button -->
      <div class="see-more-button">
        <button type="button" id="see-more-button">See more photos</button>
      </div>
  
      <!-- Add a div to wrap the checkbox and label -->
      <div class="image-container extra-images">
        <%for (int i=3; i<6; i++) { 
          if (i<imageUrls.size())  {
            im2= imageUrls.get(i);
         } else {
           im2="nophoto.png";
         }
            %>
        <div class="image-wrapper">
          <div class="image-wrapper">
            <img src="<%=im2%>" >
          </div>
      </div> 
       <% }  %>
      </div>
    </div>
    <div class="footer">
      <p>&copy;2023 RnS Rent and Swap. All rights reserved.</p>
      <div class="social-icons">
          <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
          <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
          <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
          <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
      </div>
  </div>
  <%  if (from!=null && until!=null) {
    session.setAttribute("check_in", from);
    session.setAttribute("check_out", until);
    session.setAttribute("apartment_id", apartmentId);
    
  }  
  %>
    
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