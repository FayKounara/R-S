<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp" %>
<%@ page import="Apartments_details_Rns.*" %>

<%
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");


try{
    int phone1 = Integer.parseInt(phone);
    User us1= new User(phone1, name, username, password, phone1);
    UserService uService= new UserService();
    uService.register(us1);
    response.sendRedirect("Homepage.jsp");
}  catch(Exception e) {  
    response.sendRedirect("SignUp.jsp");
}

%>



