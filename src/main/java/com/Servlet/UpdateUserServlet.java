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
import com.model.User;
import com.repo.UserDAO;

@WebServlet("/update_profile")
public class UpdateUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			// Fetching form data
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String ps = req.getParameter("ps");
			String qua = req.getParameter("qua");

			UserDAO dao=new UserDAO(DBConnect.getConn());
			User u=new User();
			u.setId(id);
			u.setName(name);
			u.setEmail(email);
			u.setPassword(ps);
			u.setQualification(qua);
			
			boolean f=dao.updateUser(u);
			HttpSession session=req.getSession();
			
			if(f)
			{
				session.setAttribute("succMsg", "Profile Update Sucessfully");
				resp.sendRedirect("home.jsp");
			}else
			{
				session.setAttribute("succMsg", "Something wrong on server");
				resp.sendRedirect("home.jsp");
			}
;		} catch (Exception e) {
         e.printStackTrace();
		}
	}

}
