<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@page isELIgnored="false"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

	<div class="container">

		<a class="navbar-brand fw-bold" href="#"> <i
			class="fa-solid fa-wallet"></i> Expense Tracker

		</a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">

			<span class="navbar-toggler-icon"></span>

		</button>


		<div class="collapse navbar-collapse" id="navbarNav">

			<!-- Left Navigation -->

			<ul class="navbar-nav me-auto">

				<li class="nav-item"><a class="nav-link active"
					href="../user/Home.jsp"> <i class="fa-solid fa-house"></i> Home

				</a></li>


				<c:if test="${not empty loginUser}">

					<li class="nav-item"><a class="nav-link active"
						href="Add_expense.jsp"> <i class="fa-solid fa-plus"></i> Add

							Expense

					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="View_expense.jsp"> <i class="fa-solid fa-list"></i> View

							Expense

					</a></li>


				</c:if>

			</ul>



			<!-- Right Navigation -->


			<ul class="navbar-nav ms-auto">

				<c:if test="${not empty loginUser }">


					<li class="nav-item"><a
						class="nav-link btn btn-outline-light px-3 me-2"
						href="../Login.jsp"> <i class="fa-solid fa-circle-user"></i>

							${loginUser.fullname}

					</a></li>

					<li class="nav-item"><a
						class="nav-link btn btn-light text-dark px-3" href="../logout">

							<i class="fa-solid fa-right-to-bracket"></i> Logout

					</a></li>

				</c:if>


				<c:if test="${empty loginUser }">


					<li class="nav-item"><a
						class="nav-link btn btn-outline-light px-3 me-2" href="Login.jsp">

							<i class="fa-solid fa-right-to-bracket"></i> Login

					</a></li>

					<li class="nav-item"><a
						class="nav-link btn btn-light text-dark px-3" href="Register.jsp">

							<i class="fa-solid fa-user-plus"></i> Register

					</a></li>

				</c:if>

			</ul>

		</div>

	</div>

</nav>