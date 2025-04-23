package com.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.db.HibernateUtil;
import com.enitity.User;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oldPassword = request.getParameter("oldPassword");
		String newPassword = request.getParameter("newPassword");

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userObj");

		if (user != null && user.getPassword().equals(oldPassword)) {
			Session hibernateSession = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = hibernateSession.beginTransaction();
			try {
				user.setPassword(newPassword);
				hibernateSession.update(user);
				tx.commit();
				request.setAttribute("msg", "Password updated successfully.");
			} catch (Exception e) {
				tx.rollback();
				request.setAttribute("msg", "Something went wrong.");
			} finally {
				hibernateSession.close();
			}
		} else {
			request.setAttribute("msg", "Old password incorrect.");
		}

		RequestDispatcher rd = request.getRequestDispatcher("reset_password.jsp");
		rd.forward(request, response);
	}

}
