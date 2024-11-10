package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.User;
import com.repo.UserDAO;

@WebServlet("/add_user")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
			String name=req.getParameter("name");
			String qua=req.getParameter("qua");
			String email=req.getParameter("email");
			String ps=req.getParameter("ps");
			
			UserDAO dao=new UserDAO(com.DB.DBConnect.getConn());
			User u=new User(name,email,ps,qua,"user","lock","");
			boolean f=dao.addUser(u);
			HttpSession session=req.getSession();
			if(f)
			{
				session.setAttribute("succMsg","Register Successfully");
				resp.sendRedirect("signup.jsp");
			}else
			{
				session.setAttribute("succMsg","Somethong Went Wrong");
				resp.sendRedirect("signup.jsp");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
