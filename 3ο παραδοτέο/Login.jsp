<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String previousURL = request.getHeader("referer"); 
String[] pathSegments = previousURL.split("/");
previousURL = pathSegments[pathSegments.length - 1];
session.setAttribute("previousURL", previousURL);%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link href="logo.jpg" rel="icon">
        <title>Login</title>
        <link href="r&s.css" rel="stylesheet">
    </head>
      
    <body class="login-body">
        <div class="cont">
            <h1>WELCOME BACK</h1>
            <h2>Login</h2> <br>
            <div class="login-form">   
                <%
            if (request.getAttribute("error_login") != null) {
                %>
                    <div class="login-wrong">
                        <p><%=(String)request.getAttribute("error_login")%></p>
                    </div>
                <%
                    }
			%>	

                <form action="LoginController.jsp" method="post">
                    <div class="login-values">
                        <div class="username">    
                            <input type="text" id="username" name="username" required placeholder="Username"><br><br>
                        </div> 
                        <div class="password">                   
                            <input type="password" id="password" name="password" required placeholder="Password"><br><br>
                        </div>
                    </div>
                    <div class="login-button">
                        <button>Login</button>
                    </div> <br><br>
                    <a href="SignUp.jsp">I don't have an account</a>     
                </form>
            </div> 
            <img src="logo.jpg" alt="">
        </div>   
            
    </body>
  </html>