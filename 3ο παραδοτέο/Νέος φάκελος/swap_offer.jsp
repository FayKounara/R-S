<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
  <head>
    <title>
        RnS Swap Offer
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="r&s.css">
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
</head>

  <body class="SwapYourApartment">
    <div class="content">
      <div id="abc">
        <nav>
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
    <% 
    Swap obj=new Swap();
     
    if (session.getAttribute("authenticated_user")!=null){
        User user = (User) session.getAttribute("authenticated_user");
        int user_id=user.getId();
        List<String>apartments=obj.getSwapApartments(user_id);
          %>
      <form class="swap" method="post" action="swap_offerController.jsp">
      
        <div class="Apartment-details">
          <div class="Details-container">
              <div class="Apartment-name">
                <p class="Name">Time to Swap your apartment!</p>
              </div>
                <p >Choose an apartment you have uploaded to offer for the exchange:</p>

              <!-- The select element creates the dropdown -->
              <select id="swap" name="swap" onchange="displaySelectedValue()" required>
                <option value="" disabled selected>--- Your apartments ---</option>
                  <% for (String opt: apartments) { %>
                  <!-- Each option element defines an item in the dropdown -->
                  <option value="<%= opt %>"><%= opt %></option>
                  <% } %>
                </select>
                <br />
                <br />
      
                <div class="checkbox-containerSwap">
                  <input type="checkbox" id="terms" name="terms" />
                  <label for="terms">I agree to the terms of privacy</label>
                </div>

                <br />

                <div>
                  <button type="submit" class="Submit_button">Submit offer</button>
                </div>
          </div> 
        </div>       
      </form>
       
  <!-- The select element creates the dropdown -->
</div>
<br><br><br>

<div class="footer">
    <p>&copy;2023 RnS Rent and Swap. All rights reserved.</p>
    <div class="social-icons">
        <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
    </div>
</div>
  

  <% }else{
    request.setAttribute("swap_login","no login");
    %>
    <jsp:forward page="Login.jsp" />
    <% } %>
  </body>
</html>
