<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html>
    <head>
        
        <title>Upload Apartment</title>
        <link href="logo.jpg" rel="icon">
        <link href="r&s.css" rel="stylesheet">
        <!-- FontAwesome CSS link -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    
        
    </head>
    <body class="upload-body">
        <div class="content">
            <div id="abc">
                <nav>
                    <ul>
                        <li><a href="Homepage.jsp">Home</a></li>
                        <li><a href="#">Notifications</a></li>
                        <li><a href="Upload.jsp">Upload</a></li>
                        <li><a href="#">Profile</a></li>
                        <li><a href="Login.jsp">Login/Sign-up</a></li>
                    </ul>
                </nav>
            </div> 
            <div class="errorMessage">
                <% if(request.getAttribute("message") != null) { %>		
                    <div class="alert alert-danger text-center" role="alert"><%=(String)request.getAttribute("message") %></div>
                <% } %>

            </div>
            <form action="UploadController.jsp" method="get" class="upload-form">
                <br></br>
                <div class="apart-name">    
                    <input type="text" name="name" id="name" required placeholder="Apartment name" />
                </div>
                <div class="city-capacity">
                    <div class="city">
                        <input type="text" name="city" id="city" required placeholder="City"/>
                    </div>
                    <div class="capacity">                    
                        <input type="text" name="capacity" id="capacity" required placeholder="Capacity"/>
                    </div>
                </div>
                <div class="address-price">
                    <div class="address">                       
                        <input type="text" name="address" id="address" required placeholder="Address"/><br><br>
                    </div>
                    <div class="price"> 
                        <input type="text" name="price" id="price" required placeholder="Price"/><br><br>
                    </div>
                </div>
                <div class="availability">
                    <div class="check-in">
                        <label for="check-in">Available from</label>
                        <input type="date" name="check-in" id="check-in"  min="2023-10-28" required/><br><br>
                    </div>
                    <div class="check-out">
                        <label for="check-out">Available until</label>
                        <input type="date" name="check-out" id="check-out" required /><br><br>
                    </div>
                </div>
                <div class="features">
                    <label for="features">Features</label><br>
                    <textarea name="features" id="features" required ></textarea> <br><br>
                </div>  
                <div class="reason">
                    <label for="reason">Available for:</label>
                    <input type="radio" name="reason1" value="rent"> Rent
                    <input type="radio" name="reason2" value="swap"> Swap<br><br>
                </div> 
                <div class="photos">
                    <input type="file" name="fileInput" id="fileInput" multiple>
                    <!-- Use an array of hidden inputs to store the URLs -->
                    <input type="hidden" name="imageUrl[]" class="imageUrl">
                    <input type="hidden" name="imageUrl[]" class="imageUrl">
                    <!-- Add more hidden inputs as needed -->
                </div> 
                <div class="button-new">
                    <button>Upload</button>
                </div>
                
            </form>
        </div>  
        
        <div class="footer">
            <p>&copy; 2023 Your Website Name. All rights reserved.</p>
            <div class="social-icons">
                <a href="#" target="_blank"><i class="fab fa-facebook"></i></a>
                <a href="#" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="#" target="_blank"><i class="fab fa-instagram"></i></a>
                <a href="#" target="_blank"><i class="fab fa-linkedin"></i></a>
            </div>
        </div>
        </div>
        <script>
        const fileInput = document.getElementById("fileInput");

        fileInput.addEventListener("change", e => {
            const hiddenInputs = document.querySelectorAll('.imageUrl');
            const fileUrls = [];

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
            function uploadFormSubmit() {
                // Validate form data if needed
                // Submit the second form when the button is clicked
                document.getElementById("imageForm").submit();
            }
        </script>
    </body>
</html>

