<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Media World</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Bootstrap icons-->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/styles.css" rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="css/indexCss.css">
<title>Media World</title>
<style>
body {
	background-color: black;
	color: white;
	height: 100%;
	width: 100%;
}

footer {
	color: white;
	background-color: black;
}
</style>
</head>
<body>
	<div class="container-fluid">
		<!-- Header-->
		<header id="header" class="bg-dark py-5">
			<jsp:include  page="layout/header.jsp" />

			<div class="text-center text-white">
				<h1 class="display-4 fw-bolder">한 영화 다양한 관점</h1>
				<p class="lead fw-normal text-white-50 mb-0">영화광들아 모여라. 니생각 내생각
					나눠보자!</p>
			</div>
		</header>
<section>
	<div id="interest">
	<h2>당신의 관심에 딱 맞춘 영화</h2>
	</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="image/newyork.jpg" alt="Card image">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">John Doe</h4>
					<p class="card-text" style="color: black;">Some example text.</p>
					<div style="text-align: right">
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</div>
			</div>
	
	<div id="visitCount">
	<h2>다른사람들이 주목하는 핫한 영화</h2>
	</div>
		</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="image/newyork.jpg" alt="Card image">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">John Doe</h4>
					<p class="card-text" style="color: black;">Some example text.</p>
					<div style="text-align: right">
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</div>
		</div>
	<div id="horror">
	<h2>무서운 영화</h2>
	</div>
		</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="image/newyork.jpg" alt="Card image">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">John Doe</h4>
					<p class="card-text" style="color: black;">Some example text.</p>
					<div style="text-align: right">
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</div>
		</div>
	<div id="love">
	<h2>사랑 영화</h2>
	</div>
		</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="image/newyork.jpg" alt="Card image">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">John Doe</h4>
					<p class="card-text" style="color: black;">Some example text.</p>
					<div style="text-align: right">
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</div>
		</div>
			<div id="criminal">
	<h2>범죄 영화</h2>
	</div>
		</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="image/newyork.jpg" alt="Card image">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">John Doe</h4>
					<p class="card-text" style="color: black;">Some example text.</p>
					<div style="text-align: right">
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</div>
		</div>
		<div id="comedy">
	<h2>웃긴 영화</h2>
	</div>
		</div>
			<div class="card" style="width: 200px">
				<img class="card-img-top" src="image/newyork.jpg" alt="Card image">
				<div class="card-body">
					<h4 class="card-title" style="color: black;">John Doe</h4>
					<p class="card-text" style="color: black;">Some example text.</p>
					<div style="text-align: right">
						<a href="#" class="btn btn-primary">See Profile</a>
					</div>
				</div>
		</div>
	<div class="fixed-bottom" style="text-align: right; ">
	<a href="#header"><button class="btn btn-primary" style="height: 100px; border-radius: 100px;">맨위로가기</button></a>
	</div>
</section>
		<!-- Footer-->
		<footer>
			<jsp:include page="layout/footer.jsp" />
		</footer>
</body>
</html>
