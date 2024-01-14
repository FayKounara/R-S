<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%String name="";%>



<!-- this is the markup. you can change the details (your own name, your own avatar etc.) but don’t change the basic structure! -->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>
        RnS Website
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="profile.css">
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
</head>
<body class="profile">
    <div class="wrapper">
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
           
        
            <aside class="profile-card">
            
                <header>
            
                    <!-- here’s the avatar -->
                    <a href="profile.jsp">
                        <img src="profile.png">
                    </a>
                    <% if (session.getAttribute("authenticated_user")!=null){
                        User user = (User) session.getAttribute("authenticated_user");
                        int user_id=user.getId();
                        name=user.getFirstname();
                        Swap obj=new Swap();
                    %>


                    <!-- the username -->
                    <h1> Welcome <%=name%></h1>
                    <h3>My Notifications:</h3>
                    <%
                            List<SwapCon> swaplist=obj.getSwap(user.getId());
                            List<String> notifications1 = obj.find_notification1(user.getId());
                            List<String> notifications2 = obj.find_notification2(user.getId());

                            for (int i = 0; i < notifications1.size(); i++) {
                        %>
                                <h4>
                                    You have a swap offer for your apartment <%= notifications1.get(i) %>
                                    with the apartment <%= notifications2.get(i) %>
                                </h4>
                                <%session.setAttribute("swap2", swaplist.get(i));
                                Apartment apartment1=obj.findApart(swaplist.get(i).getApartmentId());
                                session.setAttribute("swap_apartment",apartment1);  
                                Apartment apartment2=obj.findApart(swaplist.get(i).getApartmentId1());
                                session.setAttribute("swap_apartment1",apartment2); 
                                session.setAttribute("button1","See More"); 
                                 %>
                                <a href="SwapApartmentDetails.jsp">
                                    <button type="submit">See Apartment</button>
                                </a>
                        <%
                            }
                        %>
                       
                

                        <h3>My Reservations:</h3>
                        <%
                            Swap swap = new Swap();
                            List<BookingConstructor> reservations = swap.seeReservations(user.getId());
                        
                            for (int i = 0; i < reservations.size(); i++) {
                                BookingConstructor reservation = reservations.get(i);
                                Apartment reservedApartment = swap.findApart(reservation.getApartId());
                        %>
                                <h4>
                                    You have reserved apartment <%=reservedApartment.getName()%>
                                    from <%=reservation.getCheckin()%> until <%=reservation.getCheckout()%>.
                                </h4>
                        <%
                            }
                      
                    }else if (session.getAttribute("authenticated_user")==null){ %>
                        <h2>Please login to see your notifications.</h2>
                        <!-- and role or location -->
                        <% }
                        %>
                </header>
            
                <!-- bit of a bio; who are you? -->
                <div class="profile-bio">
                    <p>.</p>
                </div>
            </aside>
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
   </div>
</body>
</html>
        

