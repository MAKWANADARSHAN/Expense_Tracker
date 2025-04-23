<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Expense</title>
<%@include file="../Component/Cdnfile.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 3);
}
</style>
</head>
<body class="bg-light">

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
					<li class="nav-item"><a
						class="nav-link btn btn-outline-light px-3 me-2" href="#"> <i
							class="fa-solid fa-circle-user"></i> ${loginUser.fullname}
					</a></li>

					<li class="nav-item"><a
						class="nav-link btn btn-light text-dark px-3" href="../logout">
							<i class="fa-solid fa-right-to-bracket"></i> Logout
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-6 p-5">
				<div class="card card-sh mt-5">
					<div class="card-header text-center">
						<p class="fs-3">Add Expense</p>

					</div>
					<div class="card-body">
						<form action="../saveExpense" method="post">
							<div class=mb-3>
								<label>Title</label> <input type="text" name="title"
									class="form-control">
							</div>
							<div class=mb-3>
								<label>Date</label> <input type="date" name="date"
									class="form-control">
							</div>
							<div class=mb-3>
								<label>Time</label> <input type="time" name="time"
									class="form-control">
							</div>
							<div class=mb-3>
								<label>Description</label> <input type="text" name="description"
									class="form-control">
							</div>
							<div class=mb-3>
								<label>Price</label> <input type="text" name="price"
									class="form-control">
							</div>

							<button class="btn btn-success col-12">Add</button>
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
				title : 'Success',
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