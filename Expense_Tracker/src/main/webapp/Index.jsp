<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.db.HibernateUtil"%>
<%@ page import="org.hibernate.SessionFactory"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Tracker</title>

<%@include file="Component/Cdnfile.jsp"%>

<style>

/* Make carousel images responsive */
.carousel-img {
	height: 100vh;
	object-fit: cover;
}
</style>

</head>
<body>
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




	<div id="carouselExampleControls" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="Image/Ex1.jpg" class="d-block w-100 carousel-img"
					alt="Slide 1">
			</div>
			<div class="carousel-item">
				<img src="Image/Ex2.jpg" class="d-block w-100 carousel-img"
					alt="Slide 2">
			</div>
			<div class="carousel-item">
				<img src="Image/Ex3.jpg" class="d-block w-100 carousel-img"
					alt="Slide 3">
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleControls" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>

</body>
</html>
