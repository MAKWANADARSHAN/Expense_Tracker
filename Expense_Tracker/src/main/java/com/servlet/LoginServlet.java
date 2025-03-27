package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import com.dao.UserDao;
import com.db.HibernateUtil;
import com.enitity.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String emial=req.getParameter("email");
		String password=req.getParameter("password");
		
		UserDao dao=new UserDao(HibernateUtil.getSessionFactory());
		User u=dao.login(emial, password);
		System.out.println(u);
		
		HttpSession session=req.getSession();
		if (u==null) {
			
			session.setAttribute("msg","invalid Email & Password");
			resp.sendRedirect("Login.jsp");
		}else {
			session.setAttribute("loginUser", u);
			resp.sendRedirect("user/Home.jsp");
		}
		
	}

}
