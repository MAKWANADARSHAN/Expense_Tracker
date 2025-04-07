package com.servlet;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.enitity.User;
import com.helper.FactoryProvider;

@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String newPassword = request.getParameter("newPassword");

		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();

		// Check user
		User user = (User) session.createQuery("from User where email = :email").setParameter("email", email)
				.uniqueResult();

		if (user != null) {
			user.setPassword(newPassword);
			session.update(user);
			tx.commit();
			request.setAttribute("msg", "Password reset successfully!");
			 request.getRequestDispatcher("Login.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "User not found!");
			 request.getRequestDispatcher("user/Forgot_password.jsp").forward(request, response);
		}

		session.close();
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	}
}
