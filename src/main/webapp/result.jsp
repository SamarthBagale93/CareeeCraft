<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Resume Analysis Result</title>
    <style>
        /* General styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        /* Container styling */
        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
        }

        /* Header styling */
        h1 {
            color: #283593;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Paragraph styling */
        p {
            font-size: 16px;
            color: #333;
            margin: 10px 0;
        }

        /* Strong text styling */
        strong {
            color: #283593;
        }

        /* Link styling */
        a {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #283593;
            color: #ffffff;
            border-radius: 5px;
            text-decoration: none;
            transition: background-color 0.3s;
        }

        a:hover {
            background-color: #1a237e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Analysis Result</h1>
        
        <!-- Display the specific skills extracted from the resume -->
        <p><strong>Specific Skills:</strong> ${skills}</p>
        
        <!-- Display any other information, like file upload status -->
        <p><strong>Other Information:</strong> ${info}</p>
        
        <!-- Display the ATS score as only a percentage -->
        <p><strong>ATS Score:</strong> ${atsScore}</p>

        <!-- Link to upload another resume -->
        <a href="upload.jsp">Upload Another Resume</a>
    </div>
</body>
</html>
