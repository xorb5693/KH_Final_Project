<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
  type="text/javascript"
  src="http://code.jquery.com/jquery-3.3.1.js"
></script>
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">

<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/ionicons.min.css">

<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">
<style>
.back-to-top {
	position: fixed;
	bottom: 25px;
	right: 25px;
	display: none;
	z-index: 1000;
}
.mail{
	position: fixed;
	bottom: 70px;
	right: 25px;
	display: block;
	z-index: 1000;
}
</style>

<div class="py-1 bg-black top">
	<div class="container">
		<div
			class="row no-gutters d-flex align-items-start align-items-center px-md-0">
			<div class="col-lg-12 d-block">
				<div class="row d-flex">
					<div class="col-md pr-4 d-flex topper align-items-center">
						<div
							class="icon mr-2 d-flex justify-content-center align-items-center">
							<span class="icon-phone2"></span>
						</div>
						<span class="text">+82 2 2655 5555</span>
					</div>
					<div class="col-md pr-4 d-flex topper align-items-center">
						<div
							class="icon mr-2 d-flex justify-content-center align-items-center">
							<span class="icon-paper-plane"></span>
						</div>
						<span class="text">healthnership@gmail.com</span>
					</div>
					<div
						class="col-md-5 pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
						<p class="mb-0 register-link">
							<span>Open hours:</span> <span>Monday - Sunday</span> <span>8:00AM
								- 9:00PM</span>
						</p>
					</div>
					<div
						class="col-md pr-4 d-flex topper align-items-center text-lg-right justify-content-end">
						<c:if test="${empty sessionScope.member }">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-person_outline"></span> <span class="text">
									<a href="/healthner/member/loginFrm.do">Login</a>
								</span>
							</div>
						</c:if>
						<c:if test="${not empty sessionScope.member }">
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-person_outline"></span> <span class="text"><a
									href="/healthner/member/mypageFrm.do">마이페이지</a></span>
							</div>
							<div
								class="icon mr-2 d-flex justify-content-center align-items-center">
								<span class="icon-lock"></span> <span class="text"><a
									href="/healthner/member/logout.do">로그아웃</a></span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<nav
	class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
	id="ftco-navbar">
	<div class="container">
		<a class="navbar-brand" href="/"> <span><i class="left-bar"></i>너는
				내가 책임 GYM<i class="right-bar"></i></span>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>

		<div class="collapse navbar-collapse" id="ftco-nav">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a
					href="/healthner/member/about.do" class="nav-link">About</a></li>
				<li class="nav-item active"><a
					href="/healthner/trainer/trainer.do" class="nav-link">Trainers</a></li>
				<li class="nav-item active"><a
					href="/healthner/member/pricing.do" class="nav-link">Pricing</a></li>
				<li class="nav-item active"><a
					href="/healthner/notice/notice.do?reqPage=1" class="nav-link">Blog</a></li>
				<li class="nav-item active"><a href="/healthner/member/shop.do"
					class="nav-link">Shop</a></li>
			</ul>
		</div>
	</div>
</nav>
<!-- END nav -->
	<a id="mail" href="#" class="btn btn-dark btn-lg mail">
			<i class="icon-envelope-open"></i>
			<!-- <i class="icon-envelope"></i> -->
		</a>

<a id="back-to-top" href="#" class="btn btn-dark btn-lg back-to-top"
	role="button"><i class="icon-arrow-up"></i></a>
	
<script>
	$(document).ready(function() {
		$(window).scroll(function() {
			if ($(this).scrollTop() > 50) {
				$('#back-to-top').fadeIn();
			} else {
				$('#back-to-top').fadeOut();
			}
		});
		// scroll body to 0px on click
		$('#back-to-top').click(function() {
			$('body,html').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
</script>