<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>

<%
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");


try{
    
    int phone1 = Integer.parseInt(phone);
    request.setAttribute("error_signup", "Please enter a valid phone number");
    User us1= new User(name, username, password, phone1);
    UserService uService= new UserService();
    uService.register(us1);
    request.setAttribute("success_signup", "You signed up successfully");
    %>
        <jsp:forward page="Homepage.jsp" />
    
    <%
} catch (NumberFormatException e) {
    
    request.setAttribute("error_signup", "Please enter a valid phone number!");
    %>
        <jsp:forward page="SignUp.jsp" />
    
    <%
}  catch(Exception e) {  
    request.setAttribute("error_signup", (String)e.getMessage());

    %>
        <jsp:forward page="SignUp.jsp" />
    
    <%
    }
    %>



