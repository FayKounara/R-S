<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
    <head>
        

		<meta name="description" content="R&S">
		
		<title>R&S</title>
    </head>
    <body>

     

      <div class="container">
        <div class="page-header">
			<h1>Oops something went wrong</h1>
		</div>

        <div class="row">

            <div class="col-xs-12">

                <h2>Description</h2>

                <% if(exception != null) {
                     session.setAttribute("errorpage","Please enter our website through our homepage");
                    %>	                  	
                    <jsp:forward page="Homepage.jsp" />				
                <% } %>		

            </div>

        </div>        

      </div><!-- /.container -->

      
  </body>
</html>



