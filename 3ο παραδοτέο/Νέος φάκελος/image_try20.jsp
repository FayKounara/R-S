<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <title>Get URL of Image</title>
</head>
<body>
    <input type="file" onchange="previewFile()" /><br />
    <img id="previewImage" src="" height="200" alt="Image preview" />

   <!-- Add the button to navigate to ViewApartment.jsp -->
   <button onclick="goToViewApartment()">Go to View Apartment</button>

   <script>
    // Declare imageUrl as a global variable
    let imageUrl = "";

    function previewFile() {
      const previewImage = document.getElementById("previewImage");
      const file = document.querySelector("input[type=file]").files[0];
      const reader = new FileReader();

      reader.addEventListener(
        "load",
        () => {
          // convert image file to base64 string
          previewImage.src = reader.result;
          // Assign the value to the global variable imageUrl
          imageUrl = reader.result;
        },
        false,
      );

      if (file) {
        reader.readAsDataURL(file);
      }
    }

    function goToViewApartment() {
      if (imageUrl.trim() !== "") {
        console.log("Navigating to ViewApartment.jsp with imageUrl:", imageUrl);
        window.location.href = "ViewApartment.jsp?imageUrl=" + encodeURIComponent(imageUrl);
      } else {
        alert("Please upload an image first.");
      }
    }
   </script>
</body>
</html>
