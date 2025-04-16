<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>
<%@include file="../Component/Cdnfile.jsp"%>

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
						<p class="text-center fs-3">Forgot Password</p>
						<c test="$(not empty msg)">
						<P class="text-center text-danger fs-4">${msg}</P>
						</c>
					</div>
					<div class="card-body">
						<form action="../ResetPasswordServlet" method="post">

							<div class="mb-3">
								<label for="email" class="form-label">Email</label> <input
									type="email" name="email" id="email" class="form-control">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">New Password</label> <input
									type="password" name="password" id="password"
									class="form-control">

							</div>

							<div class="mb-3">
								<button type="submit" class="btn btn-success col-12">Reset
									Password</button>

							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>