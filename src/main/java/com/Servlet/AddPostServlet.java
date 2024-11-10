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

@WebServlet("/add_job")
public class AddPostServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Fetching form data
            String title = req.getParameter("title");
            String location = req.getParameter("location");
            String category = req.getParameter("category");
            String status = req.getParameter("status"); // Corrected parameter name
            String desc = req.getParameter("desc");

            // Setting up Jobs object
            Jobs j = new Jobs();
            j.setTitle(title);
            j.setDescription(desc);
            j.setLocation(location);
            j.setStatus(status);
            j.setCategory(category);

            // Database operation
            HttpSession session = req.getSession();
            JobDAO dao = new JobDAO(DBConnect.getConn());
            boolean f = dao.addJobs(j);

            // Handling response based on operation result
            if (f) {
                session.setAttribute("succMsg", "Jobs Post Successfully...");
                resp.sendRedirect("add_job.jsp");
            } else {
                session.setAttribute("msg", "Something went wrong on the server");
                resp.sendRedirect("add_job.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
