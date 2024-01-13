<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>

<%
    String username = request.getParameter("username");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");


try{
    
    long phone1 = Long.parseLong(phone);
    String phoneString = Long.toString(phone1);
    int numberOfDigits = phoneString.length();
    if (phone1 <= 0 ||numberOfDigits<10 || numberOfDigits>10)  {
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



