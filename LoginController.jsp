<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String path=  request.getParameter("previousURL");
UserService uService = new UserService();

try {

    User user = uService.authenticate(username, password);
    session.setAttribute("authenticated_user", user);
    
    if (path !=null) {
        response.sendRedirect(path);
    } else {
        response.sendRedirect("Homepage.jsp");
    }
} catch(Exception e) {

    request.setAttribute("error_login", "Wrong username or password!");

%>
    <jsp:forward page="Login.jsp" />

<%
}
%>

