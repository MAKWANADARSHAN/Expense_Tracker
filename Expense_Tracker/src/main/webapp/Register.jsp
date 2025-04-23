<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
<%@include file="Component/Cdnfile.jsp"%>
<!-- SweetAlert2 CDN -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0, 3);
}
</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-success">
		<div class="container">
			<a class="navbar-brand fw-bold" href="Index.jsp"> <i
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
						href="Index.jsp"> <i class="fa-solid fa-house"></i> Home
					</a></li>
				</ul>
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a
						class="nav-link btn btn-outline-light px-3 me-2" href="Login.jsp">
							<i class="fa-solid fa-right-to-bracket"></i> Login
					</a></li>

					<li class="nav-item"><a
						class="nav-link btn btn-light text-dark px-3" href="Register.jsp">
							<i class="fa-solid fa-user-plus"></i> Register
					</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-8 col-lg-6 col-xl-5 p-5">
				<div class="card card-sh">
					<div class="card-header">
						<p class="text-center fs-3">Register</p>

					</div>
					<div class="card-body">
						<form action="userRegister" method="post">
							<div class="mb-3">
								<label for="name" class="form-label">Enter Full Name</label> <input
									type="text" name="fullname" class="form-control">
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="email" name="email" id="email" class="form-control">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" name="password" class="form-control">
							</div>
							<div class="mb-3">
								<label for="about" class="form-label">About</label> <select
									name="about" id="aboutSelect" class="form-control" required>
									<option value="">-- Select --</option>
									<option value="Commercial">Commercial</option>
									<option value="Small Scale">Small Scale</option>
									<option value="Large Scale">Large Scale</option>
									<option value="Financial">Financial</option>
									<option value="Miscellaneous">Miscellaneous</option>

								</select>
							</div>

							<div class="mb-3">
								<button type="submit" class="btn btn-success col-12">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--	<c:if test="${not empty msg}">
		<div class="modal fade" id="messageModal" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">Message</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<p
							class="text-center  ${msg.contains('Success') ? 'text-success' : 'text-danger'} fs-4">
							${msg}</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			var myModal = new bootstrap.Modal(document
					.getElementById('messageModal'))
			myModal.show()
		</script>  -->
	<!-- SweetAlert2 Message Trigger -->
	<c:if test="${not empty msg}">
		<script>
			Swal.fire({
				icon : 'success',
				title : 'Success',
				text : '${msg}',
				confirmButtonColor : '#3085d6'
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
				confirmButtonColor : '#d33'
			});
		</script>

		<c:remove var="msg" scope="session" />
	</c:if>

</body>
</html>