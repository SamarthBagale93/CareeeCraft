package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.model.Jobs;
import com.repo.JobDAO;

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Fetching form data
            int id = Integer.parseInt(req.getParameter("id"));
            String title = req.getParameter("title");
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String status = req.getParameter("status");
            String desc = req.getParameter("desc");

            // Creating job object and setting values
            Jobs j = new Jobs();
            j.setId(id); // Set the ID to ensure the update occurs correctly
            j.setTitle(title);
            j.setDescription(desc);
            j.setLocation(location);
            j.setStatus(status);
            j.setCategory(category);

            // Database operation
            HttpSession session = req.getSession();
            JobDAO dao = new JobDAO(DBConnect.getConn());
            boolean isUpdated = dao.updateJob(j);

            // Handling response based on operation result
            if (isUpdated) {
                session.setAttribute("succMsg", "Job updated successfully.");
                resp.sendRedirect("views_jobs.jsp");
            } else {
                session.setAttribute("errorMsg", "Something went wrong on the server. Please try again.");
                resp.sendRedirect("views_jobs.jsp");
            }
        } catch (NumberFormatException e) {
            // Handle invalid integer parsing for the ID
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Invalid job ID format.");
            resp.sendRedirect("views_jobs.jsp");
        } catch (Exception e) {
            // General exception handling
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "An unexpected error occurred.");
            resp.sendRedirect("views_jobs.jsp");
        }
    }
}
