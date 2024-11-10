package com.Servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.model.Application;
import com.repo.ApplicationDAO;
import com.DB.DBConnect;

@WebServlet("/applyJobServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
		maxFileSize = 1024 * 1024 * 50, // 50 MB
		maxRequestSize = 1024 * 1024 * 100) // 100 MB
public class ApplyJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Get form parameters
		int jobId = Integer.parseInt(request.getParameter("jobId"));
		String jobTitle = request.getParameter("jobTitle");
		String location = request.getParameter("location");
		String fullName = request.getParameter("fullName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		// Handle resume upload
		Part filePart = request.getPart("resume"); // Retrieves <input type="file" name="resume">
		String fileName = extractFileName(filePart);

		// Specify the directory to save the file
		String uploadDir = getServletContext().getRealPath("") + File.separator + "uploads"; // Using context path
		File fileSaveDir = new File(uploadDir);

		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs(); // Create directories if not exists
		}

		String savePath = uploadDir + File.separator + fileName; // Full save path

		// Save the file
		filePart.write(savePath);

		// Create Application object
		Application application = new Application(jobId, jobTitle, location, fullName, email, phone, fileName);

		// Save application to the database
		ApplicationDAO dao = new ApplicationDAO(DBConnect.getConn());
		boolean isApplied = dao.applyForJob(application);

		HttpSession session = request.getSession(true);

		if (isApplied) {
			session.setAttribute("msg", "You applied for the job successfully");
			response.sendRedirect("home.jsp");
		} else {
			session.setAttribute("msg", "Something went wrong");
			response.sendRedirect("home.jsp");
		}
	}

	// Extract file name from content-disposition header
	private String extractFileName(Part part) {
		String contentDisposition = part.getHeader("content-disposition");
		for (String content : contentDisposition.split(";")) {
			if (content.trim().startsWith("filename")) {
				return content.substring(content.indexOf("=") + 2, content.length() - 1);
			}
		}
		return null;
	}
}
