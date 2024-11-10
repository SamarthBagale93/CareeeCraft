package com.resumeanalyzer;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/resumeServlet")
@MultipartConfig
public class ap extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        Part filePart = request.getPart("file"); // Retrieves <input type="file" name="file">
        String fileName = filePart.getSubmittedFileName();

        // Process the uploaded file
        String resumeContent = ResumeAnalyzer.analyzeResume(filePart.getInputStream());
        String skills = ResumeAnalyzer.extractSkills(resumeContent); // Extract skills

        // Retrieve job description entered by the user
        String jobDescription = request.getParameter("jobDescription"); // Get job description from the form

        // Calculate ATS score based on resume content and job description
        int atsScore = ResumeAnalyzer.calculateATSScore(resumeContent, jobDescription);

        String info = "Resume uploaded: " + fileName;

        // Set attributes to pass to the JSP
        request.setAttribute("skills", skills);
        request.setAttribute("info", info);
        request.setAttribute("atsScore", atsScore); // Pass ATS score to JSP

        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
