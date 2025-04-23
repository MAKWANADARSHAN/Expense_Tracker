<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password</title>
<%@include file="../Component/Cdnfile.jsp"%>

<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 3);
}
</style>
</head>
<body>
	<c:if test="${empty loginUser}">
		<c:redirect url="../Login.jsp"></c:redirect>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container">
			<a class="navbar-brand fw-bold" href="#"> <i
				class="fa-solid fa-wallet"></i> Expense Tracker
			</a>

			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class=".collapse navbar-collapse">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active"
						href="Home.jsp"> <i class="fa-solid fa-house"></i> Home
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
					<li class="nav-item dropdown"><a
						class="nav-link btn btn-outline-light px-3 me-2" href="#"
						id="navbarDropdown" role="button" data-bs-toggle="dropdown">
							${loginUser.fullname} </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="reset_password.jsp">Reset
									Password</a></li>
							<li><a class="dropdown-item" href="../logout">Logout</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5 p-5">
				<div class="card card-sh">
					<div class="card-header">
						<p class="text-center fs-3">Reset Password</p>

					</div>
					<div class="card-body">
						<form action="../ResetPasswordServlet" method="post">
							<div class="mb-3">
								<label>Old Password</label> <input type="password"
									name="oldPassword" class="form-control" required>
							</div>
							<div class="mb-3">
								<label>New Password</label> <input type="password"
									name="newPassword" class="form-control" required>
							</div>
							<button type="submit" class="btn btn-success w-100">Update
								Password</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- SweetAlert2 -->
	<c:if test="${not empty msg}">
		<script>
			Swal.fire({
				icon : 'success',
				title : 'Updated',
				text : '${msg}',
				timer : 1500, // 1.5 seconds
				showConfirmButton : false
			});
		</script>
		<c:remove var="msg" scope="session" />
	</c:if>

	<c:if test="${not empty error}">
		<script>
			Swal.fire({
				icon : 'error',
				title : 'Error',
				text : '${error}',
				timer : 1500, // 1.5 seconds
				showConfirmButton : false
			});
		</script>
		<c:remove var="msg" scope="session" />
	</c:if>
</body>
</html>