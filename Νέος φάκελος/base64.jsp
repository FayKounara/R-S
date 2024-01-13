<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>RnS Website</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="logo.jpg" rel="icon">
    <link rel="stylesheet" type="text/css" href="r&s3.css">
    <!-- FontAwesome CSS link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
</head>
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
        const hiddenInputs = document.querySelectorAll('.imageUrl');

        fileInput.addEventListener("change", e => {
            for (let i = 0; i < fileInput.files.length; i++) {
                const file = fileInput.files[i];
                const reader = new FileReader();

                reader.addEventListener("load", () => {
                    // Update the corresponding hidden input value
                    hiddenInputs[i].value = reader.result;

                    // Debugging: Log the hidden input values
                    console.log(hiddenInputs[i].value);
                });

                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>
