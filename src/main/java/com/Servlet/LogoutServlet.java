package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Get the current session
        HttpSession session = req.getSession(false); // Use false to avoid creating a new session

        if (session != null) {
            // Remove user-related attributes
            session.removeAttribute("userobj");
            session.removeAttribute("role");

            // Optionally set a message
            session.setAttribute("message", "Logout Successfully"); // Changed to "message" for general use
            session.invalidate(); // Invalidate the session
        }

        // Redirect to login page
        resp.sendRedirect("login.jsp");
    }
}
