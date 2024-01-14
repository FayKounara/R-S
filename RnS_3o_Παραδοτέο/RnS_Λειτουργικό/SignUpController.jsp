<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>

<%
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String phone1 = request.getParameter("phone");
    String password = request.getParameter("password");


try{
    

    if (phone1.length()>10||phone1.length()<10)  {
        throw new NumberFormatException("Phone number must be a positive value");
    }
    request.setAttribute("error_signup", "Please enter a valid phone number");
    User us1= new User(name, username, password, phone1);
    UserService uService= new UserService();
    uService.register(us1);
    session.setAttribute("authenticated_user", us1);
    
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



