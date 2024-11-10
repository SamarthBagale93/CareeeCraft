package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.repo.JobDAO;

@WebServlet("/delete")
public class DeleteJobsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Parse job ID from request parameter
            int id = Integer.parseInt(req.getParameter("id"));
            JobDAO dao = new JobDAO(DBConnect.getConn());

            // Perform delete operation
            boolean isDeleted = dao.deleteJobs(id);
            HttpSession session = req.getSession();

            // Handling response based on operation result
            if (isDeleted) {
                session.setAttribute("succMsg", "Job deleted successfully.");
            } else {
                session.setAttribute("errorMsg", "Failed to delete the job. Please try again.");
            }
            
            // Redirect to the job list page
            resp.sendRedirect("views_jobs.jsp");

        } catch (NumberFormatException e) {
            // Handle invalid job ID format
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "Invalid job ID format.");
            resp.sendRedirect("views_jobs.jsp");
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace();
            req.getSession().setAttribute("errorMsg", "An error occurred on the server. Please try again.");
            resp.sendRedirect("views_jobs.jsp");
        }
    }
}
