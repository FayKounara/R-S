<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <link href="logo.jpg" rel="icon" />
    <title>Sign Up</title>
    <link href="r&s.css" rel="stylesheet" />
  </head>

  <body class="login-body">
    <%
    if (request.getAttribute("error_signup") != null) {
      %>

            <div class="alert1 alert-danger text-center" role="alert"><%=(String)request.getAttribute("error_signup") %></div>
             
         
      <%
          }
   %>	 
    <div class="cont">
      <h1>WELCOME TO R&S</h1>
      <h2 id="sign-h2"style="left:85%">Sign Up</h2>
      <br /><br />
      <div class="login-form">
        <form action="SignUpController.jsp" method="post">
          <div class="login-values">
            <div class="username">
              <input
                type="text"
                id="username"
                name="username"
                required
                placeholder="Username"
              /><br />
            </div>
            <div class="sign-name">
              <input
                type="text"
                id="sign-name"
                name="name"
                required
                placeholder="Name"
              /><br />
            </div>
            <div class="sign-phone">
              <input
                type="text"
                id="sign-phone"
                name="phone"
                required
                placeholder="Phone"
              /><br /><br />
            </div>
            <div class="password">
              <input
                type="password"
                id="password"
                name="password"
                required
                placeholder="Password"
              /><br /><br />
            </div>
          </div>
          <br><br>
          <div class="sign-button">
            <button style="left:85%">Sign up</button>
          </div>
          <br /><br />
          <div class="signup-link" >
            <a href="Login.jsp"style="left:85%">I already have an account</a>
          </div>
        </form>
      </div>
      <img src="logo.jpg" alt="" />
    </div>
  </body>
</html>
