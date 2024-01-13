<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Apartments_details_Rns.*, java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>
        RnS Website
    </title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="r&s3.css">
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    
</head>
<body>
    <body>
    <form id="imageForm" action="ViewApartment.jsp" method="post">
        <input type="file" name="fileInput" id="fileInput" multiple>
        <!-- Use an array of hidden inputs to store the URLs -->
        <input type="hidden" name="imageUrl[]" class="imageUrl">
        <input type="hidden" name="imageUrl[]" class="imageUrl">
        <!-- Add more hidden inputs as needed -->
        <input type="submit" value="Submit">
    </form>
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
    </script>

</body>
</html>