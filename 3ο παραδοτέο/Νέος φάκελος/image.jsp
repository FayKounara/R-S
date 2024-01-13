<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html>
    <head>
        
        <title>Upload Image</title>

    </head>
    <body class="upload-body">
        <div class="content">
            <h1>Upload image</h1>
                
            <form action="AddImageServlet.java" method="post" class="upload-form" enctype="multipart/form-data">
                Select Image:
                <br></br>  
                    <input type="file" >
                    <input type="submit" value="Add Image">
                </div>
            </form>
               
        </div>  
        
        
    
          
    </body>
</html>