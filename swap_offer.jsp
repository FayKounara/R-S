<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>R&S | Swap Offer</title>
    <link href="r&s.css" rel="stylesheet" />
        <!-- FontAwesome CSS link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  </head>

  <body class="SwapYourApartment">
    <div class="content">
      <div id="abc">
        <nav>
            <!--img src="RnS.jpg"-->
            <ul>
                <li><a href="Homepage.jsp">Home</a></li>
                <li><a href="#">Notifications</a></li>
                <li><a href="Upload.jsp">Upload</a></li>
                <li><a href="#">Profile</a></li>
                <li><a href="#">Login/Sign-up</a></li>
            </ul>
        </nav>
    </div>
    <% if (session.getAttribute("authenticated_user")!=null){
      User user = (User) session.getAttribute("authenticated_user");
      int user_id=user.getId();
      Swap obj=new Swap();
      List<String>apartments=obj.getSwapApartments(user_id);
      %>
      <form class="swap" method="post" action="swap_offerController.jsp">
      <h1 class="SwapYourApartmenth1">Swap your apartment</h1>
        <label for="swap">Please choose the apartment that you want to swap:</label>

        <!-- The select element creates the dropdown -->
        <select id="swap" name="swap" onchange="displaySelectedValue()">
        <option value="">--- Your apartments ---</option>
        <% for (String opt: apartments) { %>
          <!-- Each option element defines an item in the dropdown -->
          <option value="<%= opt %>"><%= opt %></option>
        <% } %>
      </select>
      <div class="checkbox-containerSwap">
        <input type="checkbox" id="terms" name="terms" />
        <label for="terms">I agree to the terms of privacy</label>
      </div>
      <br />
      <div>
        <button type="submit" class="Submit_button">Submit offer</button>

      </div>
    </div>
  </form>

</div>
</div>
    </form>

  <!-- The select element creates the dropdown -->
  
  <%
}else{
%>
<h2>Please login before you try to swap!</h2>
<% }
%>
  </body>
</html>

