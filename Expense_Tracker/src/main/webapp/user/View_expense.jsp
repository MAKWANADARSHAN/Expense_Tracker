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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<c:if test="${empty loginUser}">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>
	 <nav class="navbar navbar-expand-lg navbar-dark bg-success">
      <div class="container">
        <a class="navbar-brand fw-bold" href="#">
          <i class="fa-solid fa-wallet"></i> Expense Tracker
        </a>

        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class=".collapse navbar-collapse">
          <ul class="navbar-nav me-auto">
            <li class="nav-item">
              <a class="nav-link active" href="Home.jsp">
                <i class="fa-solid fa-house"></i> Home
              </a>
              <li class="nav-item"><a class="nav-link active"
                href="Add_expense.jsp"> <i class="fa-solid fa-plus"></i> Add
    
                  Expense
    
              </a></li>
    
              <li class="nav-item"><a class="nav-link active"
                href="View_expense.jsp"> <i class="fa-solid fa-list"></i> View
    
                  Expense
    
              </a></li>
            </li>
          </ul>
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a
                class="nav-link btn btn-outline-light px-3 me-2"
                href="#"
              >
                <i class="fa-solid fa-circle-user"></i> ${loginUser.fullname}
              </a>
            </li>

            <li class="nav-item">
              <a
                class="nav-link btn btn-light text-dark px-3"
                href="../logout"
              >
                <i class="fa-solid fa-right-to-bracket"></i> Logout
              </a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
	

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-10 col-lg-8 p-5">
				<div class="card">
					<div class="card-header text-center">
						<p class="fs-3">All Expenses</p>
						
					</div>
					<div class="card-body">
						<div class="table-responsive">
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
										<td colspan="6" class="text-center">No expenses found!</td>
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
	</div>
</div>
	   <!-- SweetAlert2 -->
            <c:if test="${not empty msg}">
                <script>
                    Swal.fire({
                        icon: 'success',
                        title: 'Updated',
                        text: '${msg}'
                    });
                </script>
                 <c:remove var="msg" scope="session" />
            </c:if>

            <c:if test="${not empty error}">
                <script>
                    Swal.fire({
                        icon: 'error',
                        title: 'Error',
                        text: '${error}'
                    });
                </script>
                 <c:remove var="msg" scope="session" />
            </c:if>
</body>
</html>