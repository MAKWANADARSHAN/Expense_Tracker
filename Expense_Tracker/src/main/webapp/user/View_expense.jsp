<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page import="com.enitity.User"%>
<%@ page import="com.dao.ExpenseDao"%>
<%@ page import="com.db.HibernateUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="com.enitity.Expense"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Expense</title>
<%@include file="../Component/Cdnfile.jsp"%>
</head>
<body>

	<c:if test="${empty loginUser}">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>
	<%@include file="../Component/Navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">All Expenses</p>
						<c test="$(not empty msg)">
						<P class="text-center text-danger fs-4">${msg}</P>
						</c>
					</div>
					<div class="card-body">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Title</th>
									<th scope="col">Date</th>
									<th scope="col">Time</th>
									<th scope="col">Price</th>
									<th scope="col">Description</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("loginUser");
								ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
								List<Expense> list = dao.getAllExpenseByUser(user);
								if (list != null && !list.isEmpty()) {
									for (Expense ex : list) {
								%>
								<tr>
									<th scope="row"><%=ex.getTitle()%></th>
									<td><%=ex.getDate()%></td>
									<td><%=ex.getTime()%></td>
									<td><%=ex.getPrice()%></td>
									<td><%=ex.getDescription()%></td>
									<td><a href="Edit_expense.jsp?id=<%=ex.getId()%>"
										class="btn btn-sm btn-success me-1">Edit</a> <a
										href="../deleteExpense?id=<%=ex.getId()%>"
										class="btn btn-sm btn-danger me-1">Delete</a></td>

								</tr>
								<%
								}
								} else {
								%>
								<tr>
									<td colspan="4" class="text-center">No expenses found!</td>
								</tr>
								<%
								}
								%>

							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>