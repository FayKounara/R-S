<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
  <head>
    <title>
        RnS Upload Images
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="r&s.css">
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
</head>

  <body class="SwapYourApartment">

    <div class="content">
      <div id="abc">
        <nav style="height: 100px;">
            <ul>
                <li><a href="Homepage.jsp">Home</a></li>
                <li><a href="profile.jsp">Notifications</a></li>
                <li><a href="Upload.jsp">Upload</a></li>
                <%if (session.getAttribute("authenticated_user")==null){%>
                    <li><a href="Login.jsp">Login/Sign-up</a></li>
                <%}else{
                    User usernav = (User) session.getAttribute("authenticated_user");
                    String fname = usernav.getFirstname();%>
                    <li><a href="#">Logged in as:<%=fname%></a></li>
                    <li><a href="logout.jsp">Logout</a></li>
                <%}%>
                </ul>
           </nav>
       </div>
     
        <div class="Apartment-details">
          <div class="Details-container">
              <div class="Apartment-name">
                <p class="Name">Time to show us your place!</p>
              </div>
                <p >Upload images that compliment your apartment:</p>
                <form id="imageForm" action="ImageController.jsp" method="post">
                    <input type="file" name="fileInput" id="fileInput" multiple required>
                    <!-- Use an array of hidden inputs to store the URLs -->
                    <input type="hidden" name="imageUrl[]" class="imageUrl">
                    <input type="hidden" name="imageUrl[]" class="imageUrl">
                    <input type="hidden" name="imageUrl[]" class="imageUrl">

                    <!-- Add more hidden inputs as needed -->
                    <br><br>
                    <div>
                        <button type="submit" class="Submit_button">Submit Images</button>
                      </div>                
                    </form>
                <br />
                <br />

                <br />

          </div> 
        </div>      
       
</div>
<br><br><br>

<div class="footer">
    <p>&copy;2023 RnS Rent and Swap. All rights reserved.</p>
    <div class="social-icons">
        <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
        <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
        <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
        <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
    </div>
</div>

    <script>
        const fileInput = document.getElementById("fileInput");

        fileInput.addEventListener("change", e => {
            const hiddenInputs = document.querySelectorAll('.imageUrl');
            const fileUrls = [];

        // Ensure exactly 3 files are selected
        if (fileInput.files.length !== 3) {
            alert("Please select exactly 3 images.");
            fileInput.value = ""; // Clear selected files
            return;
        }

            for (const file of fileInput.files) {
                const reader = new FileReader();
                reader.addEventListener("load", () => {
                    const imageUrl = reader.result;
                    fileUrls.push(imageUrl);

                    // Update the corresponding hidden input value
                    hiddenInputs[fileUrls.length - 1].value = imageUrl;

                    // Check if all files are loaded
                    if (fileUrls.length === fileInput.files.length) {
                        console.log(fileUrls);
                    }
                });

                reader.readAsDataURL(file);
            }
        });
    </script>

  </body>

</html>
