<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<% String option=request.getParameter("swap"); %>
<%Apartment apartment = (Apartment) session.getAttribute("swap_apartment");%>
<!DOCTYPE html>
<html>
  <head>
    <h1><%=option%></h1>
    <h2><%=apartment.getApartmentId()%></h2>
    <h3><%=apartment.getName()%></h3>
    <% try{
      Swap obj=new Swap();
      obj.swap(apartment.getApartmentId(),apartment.getName());
    } catch(Exception e){
    %>
    <h4><%=e.getMessage()%></h4>
    <%
    }
    %>
  </head>
</html>