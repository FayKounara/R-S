<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<% String option=request.getParameter("swap"); %>
<%Apartment apartment = (Apartment) session.getAttribute("swap_apartment");
User user = (User) session.getAttribute("authenticated_user");
Swap obj=new Swap();
int id=obj.findid_apart(user.getId(),option);
obj.swap_apart(apartment.getUserId(),id,apartment.getName(),option,(String)session.getAttribute("checkin"),(String)session.getAttribute("checkout"),apartment.getApartmentId());
request.setAttribute("error", "Your swap offer has been submitted. Please wait for the owner to respond.");
   %>
      <jsp:forward page="Homepage.jsp" />
   

