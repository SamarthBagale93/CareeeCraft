package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.DBConnect;
import com.model.User;
import com.repo.UserDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String em = req.getParameter("email");
            String ps = req.getParameter("password");

            HttpSession session = req.getSession(true);

            // Check if admin login
            if ("admin@gmail.com".equals(em) && "admin".equals(ps)) {
                User u = new User();
                u.setEmail(em); // Optionally set the email in the User object
                u.setRole("admin");
                session.setAttribute("userobj", u);
                resp.sendRedirect("admin.jsp");
            } else {
            	UserDAO dao=new UserDAO(DBConnect.getConn());
            	User user=dao.login(em, ps);
            	if(user!=null)
            	{
            		session.setAttribute("userobj", user);
            		resp.sendRedirect("home.jsp");
            	}else
            	{
                // If the credentials are incorrect, set an error message
                session.setAttribute("errorMsg", "Invalid email or password");
                resp.sendRedirect("login.jsp"); // Redirect back to login page if failed
            	}
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally, you could set an error message or redirect to an error page
            HttpSession session = req.getSession();
            session.setAttribute("errorMsg", "Something went wrong. Please try again.");
            resp.sendRedirect("login.jsp");
        }
    }
}
