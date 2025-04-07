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

	<%@include file="Component/Navbar.jsp"%>



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
