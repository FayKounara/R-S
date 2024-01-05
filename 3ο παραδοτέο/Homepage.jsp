<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
                    <li><a href="profile.jsp">Notifications</a></li>
                    <li><a href="Upload.jsp">Upload</a></li>
                    <li><a href="#">Profile</a></li>
                    <li><a href="Login.jsp">Login/Sign-up</a></li>
                </ul>
            </nav>
        </div>

        <div class="errorMessage-Homepage">
            <% if(request.getAttribute("message") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
            <% } %>
            <% if(request.getAttribute("error") != null) { %>		
                <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("error") %></div>
            <% } %>
            <% if(request.getAttribute("success_login") != null) { %>		
                <div class="alert1 alert-success text-center" role="alert"><%=(String)request.getAttribute("success_login") %></div>
            <% } %>
            <% if(request.getAttribute("success_signup") != null) { %>		
                <div class="alert1 alert-success text-center" role="alert"><%=(String)request.getAttribute("success_signup") %></div>
            <% } %>
        </div>

        
        <h1 class="h1content">Make the World your next home!</h1>
        
        <div class="container">
            
            <form class="search-box" method="post" action="HomepageController.jsp">
                <br><br><br><br>
                <br><br><br><br>
                <table>
                    <tr>
                        <td class="custom-date-input">
                            <label for="checkin">City</label>
                            <input type="text" name="search-box" placeholder="Where to go?"required>
                        </td>
                       
                        <td class="custom-date-input">
                            <label for="checkin">Check-in</label>
                            <input type="date" name="checkin" id="checkin"required>
                        </td>
                        <td class="custom-date-input">
                            <label for="checkout">Check-out</label>
                            <input type="date" name="checkout" id="checkin"required>
                        </td>
                        <td class="custom-date-input">
                            <label for="checkout">Guests</label>
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
                    
                        <button type="submit" name="buttonrs"  value="RENT">RENT</button>
                    
                     &nbsp; or &nbsp;
                     
                        <button type="submit" name="buttonrs"  value="SWAP">SWAP</button>
                    
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
