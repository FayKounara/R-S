<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="database.*, java.util.List" %>



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
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
</head>

<body class="homepage-body">
    <div class="content">
        <div id="abc">
            <nav>
                <!--img src="RnS.jpg"-->
                <ul>
                    <li><a href="Homepage.jsp">Home</a></li>
                    <li><a href="#">Notifications</a></li>
                    <li><a href="Upload.jsp">Upload</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="Login.jsp">Login/Sign-up</a></li>
                </ul>
            </nav>
        </div>


        <% if(request.getAttribute("message") != null) { %>		
            <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
        <% } %>

        
        <h1 class="h1content">Make the World your next home!</h1>
        
       


        
        <div class="container">
            
            <form class="search-box" method="post" action="HomepageController_fay.jsp">
                <br><br><br><br>
                <br><br><br><br>
                <table>
                    <tr>
                        <td><input type="text" name="search-box" placeholder="Where to go?"required></td>
                       
                        <td class="custom-date-input">
                            <label for="checkin">Check-in</label>
                            <input type="date" name="checkin" id="checkin"required>
                        </td>
                        <td class="custom-date-input">
                            <label for="checkout">Check-out</label>
                            <input type="date" name="checkout" id="checkin"required>
                        </td>
                        <td>
                            <select name="passengers"required>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <br><br><br><br>
                <br><br><br><br>
                <br><br>
                <div class="buttons">
                    
                        <button type="button, submit">RENT</button>
                    
                     &nbsp; or &nbsp;
                     
                        <button type="button, submit">SWAP</button>
                    
                </div>
    
            </form>
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
</html>
