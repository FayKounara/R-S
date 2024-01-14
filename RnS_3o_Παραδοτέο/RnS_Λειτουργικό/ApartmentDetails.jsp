<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*,java.util.List" %>
<%@ page errorPage="appError.jsp" %>
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
int apart2=0;
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
                <%if (session.getAttribute("authenticated_user")==null){
                    session.setAttribute("id",apartmentId);
                    session.setAttribute("name",name);
                    session.setAttribute("features",features);
                    session.setAttribute("capacity",capacity);
                    session.setAttribute("address",address);
                    session.setAttribute("city",city);
                    session.setAttribute("from",from);
                    session.setAttribute("until",until);
                    %>
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
            <%if(name!=null){%>
            <p class="Name"><%=name%></p>
            <%}else{%>
              <p class="Name"><%=(String)session.getAttribute("name")%></p>
            <%
            }
            %>
          </div>
          <ul class="Details-list">
            <div class="Code">
              <%if(apartmentId!=null){%>
              <p><strong>Code:</strong> <span><%=apartmentId%></span></p>
                   <% apart2=Integer.parseInt(apartmentId);
                  
                 
              }else{%>
                <p><strong>Code:</strong> <span><%=(String)session.getAttribute("id")%></span></p>
                <% apart2=Integer.parseInt((String)session.getAttribute("id"));
              
                
              }
              %>
            </div>
            <%if(city!=null){%>
            <li><strong>City:</strong> <span><%=city%></span></li>
            <%}else{%>
              <li><strong>City:</strong> <span><%=(String)session.getAttribute("city")%></span></li>
            <%
            }
            %>
            <%if(address!=null){%>
            <li><strong>Address:</strong> <span><%=address%></span></li>
            <%}else{%>
              <li><strong>Address:</strong> <span><%=(String)session.getAttribute("address")%></span></li>
              <%
            }
            %>
            <%if(features!=null){%>
            <li><strong>Features:</strong> <span><%=features%></span></li>
            <%}else{%>
              <li><strong>Features:</strong> <span><%=(String)session.getAttribute("features")%></span></li>
              <%
            }
            %>
            <%if(capacity!=null){%>
            <li><strong>Guest capacity:</strong> <span><%=capacity%></span></li>
            <%}else{%>
              <li><strong>Guest capacity:</strong> <span><%=(String)session.getAttribute("capacity")%></span></li>
              <%
            }
            %>
            <%if(from!=null){%>
            <li><strong>Checkin:</strong> <span><%=from%></span></li>
            <%}else{%>
              <li><strong>Checkin:</strong> <span><%=(String)session.getAttribute("from")%></span></li>
              <%
            }
            %>
            <%if(until!=null){%>
            <li><strong>Checkout:</strong> <span><%=until%></span></li>
            <%}else{%>
              <li><strong>Checkout:</strong> <span><%=(String)session.getAttribute("until")%></span></li>
              <%
            }
            %>
          </ul>
        </div>
      </div>
      <% if (session.getAttribute("button1")=="RENT"){
        %>
      <div>
        <a href="payment.jsp">
          <button type="button" class="reservation_button">Rent</button>
        </a>
        
      </div>
      <% } else if (session.getAttribute("button1")=="SWAP"){
      %>  
      <div>
        <a href="swap_offer.jsp">
          <button type="button" class="reservation_button">Swap</button>
        </a>
        
      </div>
      <%
    }
          
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
          <div class="image-container">
              <%
          for (int i=0; i<3; i++) { 
            if (i<imageUrls.size())  {
              if (imageUrls.get(i)!="") {
               im2= imageUrls.get(i);
              } else {
                im2="nophoto.png";
              }
            } else {
              im2="nophoto.png";
            }
            %>
            <div class="image-wrapper">
              <img src="<%=im2%>" style="width:250px; height: 250px;"> <!-- Adjust width and height as needed -->
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
         } 
            %>
        <div class="image-wrapper">
          <div class="image-wrapper">
           
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
<style>
  img {
    float: left;
    width:  100px;
    height: 100px;
    object-fit: cover;
}
</style>

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