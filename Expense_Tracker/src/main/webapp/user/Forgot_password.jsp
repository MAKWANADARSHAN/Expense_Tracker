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
	<%@include file="../Component/Navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-6 offset-md-3">
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
								<button type="submit" class="btn btn-success col-md-12">Reset
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