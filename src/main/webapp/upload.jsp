<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upload Resume</title>
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
        }

        /* Container styling */
        .container {
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            padding: 30px;
            width: 400px;
            text-align: center;
        }

        /* Header styling */
        .container h1 {
            color: #283593;
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* Label styling */
        .container label {
            font-weight: bold;
            color: #333333;
        }

        /* Input and textarea styling */
        .container input[type="file"],
        .container textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-top: 8px;
            margin-bottom: 15px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .container input[type="file"]:focus,
        .container textarea:focus {
            border-color: #283593;
            outline: none;
        }

        /* Submit button styling */
        .container input[type="submit"] {
            background-color: #283593;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .container input[type="submit"]:hover {
            background-color: #1a237e;
        }

        /* Placeholder styling */
        .container textarea::placeholder {
            color: #aaa;
            font-style: italic;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Resume Upload</h1>
        
        <!-- Form for uploading resume and job description -->
        <form action="resumeServlet" method="post" enctype="multipart/form-data">
            <!-- Resume upload section -->
            <label for="file">Select Resume:</label>
            <input type="file" name="file" id="file" required /><br>

            <!-- Job description text area for ATS score calculation -->
            <label for="jobDescription">Enter Job Description:</label>
            <textarea name="jobDescription" id="jobDescription" rows="6" placeholder="Enter job description for ATS analysis..." required></textarea><br>

            <!-- Submit button -->
            <input type="submit" value="Upload and Analyze" />
        </form>
    </div>
</body>
</html>
