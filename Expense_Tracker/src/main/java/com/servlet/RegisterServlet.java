package com.servlet;

import java.io.IOException;
import java.nio.file.attribute.UserDefinedFileAttributeView;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.enitity.User;

@WebServlet("/userRegister")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html;charset=UTF-8");
		
		String fullname = req.getParameter("fullname");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String about = req.getParameter("about");
		
		
		
		
		if (fullname == null || email == null || password == null || about == null || fullname.isEmpty()
				|| email.isEmpty() || password.isEmpty() || about.isEmpty()) {
			resp.getWriter().println("Error: All fields are required!");
			return;
		}

		// Create user object
		User u = new User(fullname, email, password, about);

		// Debugging output
		System.out.println("User registered: " + u);
		
		UserDao dao = new UserDao(HibernateUtil.getSessionFactory());
		boolean f= dao.saveuser(u);
		
		HttpSession session =req.getSession();
		
		if(f) {
			session.setAttribute("msg", "Registered sucessfully");
			resp.sendRedirect("Register.jsp");
			
		}else {
			session.setAttribute("msg", "somethig wrong on server");
			resp.sendRedirect("Register.jsp");
		}

		// Send response back to client
		// resp.getWriter().println("User registration successful!");
	}
	

}
