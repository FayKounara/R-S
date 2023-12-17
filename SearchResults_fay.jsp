<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="database.*, java.util.List" %>

<%
List<Apartment_fay> receivedList = (List<Apartment_fay>) session.getAttribute("apartmentList");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>
        RnS Website
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="r&s.css">
    <script src="https://kit.fontawesome.com/b02c4d6995.js" crossorigin="anonymous"></script>
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <body>
        <div class="content">
            <div id="abc">
                <nav>
                    <!--img src="RnS.jpg"-->
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="#">Notifications</a></li>
                        <li><a href="Upload.jsp">Upload</a></li>
                        <li><a href="#">Profile</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </nav>
            </div>


    
            <div class="list-container">
                <div class="left-col">
                    <p>200+Options</p>
                    <% if(request.getAttribute("message") != null) { %>		
                        <%=(String)request.getAttribute("message") %>
                    <% } 
                    %>  
                    <h1>Recommended Places In <%=(String)session.getAttribute("destname")%></h1>
                    
							<% for (Apartment_fay apart1: receivedList) { %>
                                <div class="house">
                                    <div class="house-img">
                                        <img src="house-image.jpg">
                                    </div>
                                    <div class="house-info">
                                        <p>Apartment in <%=(String)session.getAttribute("destname")%> with ID : <%=apart1.getApartmentId() %></p>
                                        <h3><%=apart1.getName() %></h3>
                                        <p><%=apart1.getFeautures() %></p>
                                        <div class="house-price">
                                            <p><%=apart1.getCapacity() %> Guests</p>
                                            <h4>$ <%=apart1.getPrice() %><span>/ day</span></h4>
                                            <a href="apartment_final.html">
                                                <button type="button">RENT</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                              
							<% } %>
		
                </div> 

                <div class="right-col">
                    <div class="sidebar">
                        <h2> Select Filters</h2>
                        <h3>Property Type</h3>
                        <div class="filter">
                            <input type="checkbox"><p>  House</p><span>(0)</span>
                        </div>
                        <div class="filter">
                            <input type="checkbox"><p>  Appartement</p><span>(0)</span>
                        </div>
                        <div class="filter">
                            <input type="checkbox"><p>  Flat</p><span>(0)</span>
                        </div>
                        <div class="filter">
                            <input type="checkbox"><p>  Villa</p><span>(0)</span>
                        </div>
    
                        <h3>Amenities</h3>
                        <div class="filter">
                            <input type="checkbox"><p>  Kitchen</p><span>(0)</span>
                        </div>
                        <div class="filter">
                            <input type="checkbox"><p>  Wifi</p><span>(0)</span>
                        </div>
                        <div class="filter">
                            <input type="checkbox"><p>  Sea View</p><span>(0)</span>
                        </div>
                        <div class="filter">
                            <input type="checkbox"><p>  Street View</p><span>(0)</span>
                        </div>
    
                        <div class="sidebar-link">
                            <a href="#">View More</a>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <div class="pagination">
                    <img src="arrows.png" >
                    <span>1</span>
                    <span>2</span>
                    <span>3</span>
                    <span>4</span>
                    <span>&middot;&middot;&middot;</span>
                    <span>20</span>
                    <img src="arrows.png" alt="">
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
</head>
</html>