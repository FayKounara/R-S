<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
session.invalidate();
request.setAttribute("success_message", "Logged out successfully!");
%>
<% response.sendRedirect("Homepage.jsp"); %>

