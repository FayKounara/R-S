<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
UserService uService = new UserService();

try {

    User user = uService.authenticate(username, password);
    session.setAttribute("authenticated_user", user);
    request.setAttribute("success_login", "You logged in successfully!");

%>
    <jsp:forward page="Homepage.jsp" />

<%
    
} catch(Exception e) {

    request.setAttribute("error_login", "Wrong username or password!");

%>
    <jsp:forward page="Login.jsp" />

<%
}
%>

