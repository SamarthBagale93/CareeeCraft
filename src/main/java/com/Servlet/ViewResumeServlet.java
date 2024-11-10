package com.Servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewResume")
public class ViewResumeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the filename from the request parameter
        String fileName = request.getParameter("file");
        // Make sure to set the correct directory where resumes are stored
        String filePath = getServletContext().getRealPath("") + "uploads" + File.separator + fileName;

        // Create a File object
        File file = new File(filePath);

        if (!file.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "File not found");
            return;
        }

        // Set content type based on file extension (text or pdf)
        String contentType = Files.probeContentType(file.toPath());
        response.setContentType(contentType != null ? contentType : "application/octet-stream");

        // Read the file content
        byte[] fileContent = Files.readAllBytes(file.toPath());

        // Write the content to the response
        response.getOutputStream().write(fileContent);
        response.getOutputStream().flush();
    }
}
