<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Intro</title>
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
</head>
<style>
	.btnNone{
		border: none;
		background-color: white;
	}
</style>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 text-center">
					<div class="heading-section mb-5">
						<span class="subheading"><small><i class="left-bar"></i>Services<i
								class="right-bar"></i></small></span>
						<h2 class="mb-1">
							[${member.memberName }]님의 정보
						</h2>
					</div>
				</div>
			</div>
			
			<div class="row">
    			<div class="col-lg-3 d-flex">
    				<div class="coach align-items-stretch">
	    				<div class="img" style="background-image: url(/resources/profile/${member.memberProfile});  width: 100px; height: 100px;" id="myImg"></div>
	    			</div>
	    		</div>
	    	</div>
	    	<br>
	    		
			<div class="row justify-content-center align-items-center">
				<div class="col-md-3">
					<div class="services text-center ftco-animate">
						<form action="/healthner/member/myEat.do?"+${member.memberNo}>
							<input type="hidden" value="${member.memberNo }" name="memberNo">
						<button type="submit" class="icon d-flex justify-content-center align-items-center btnNone">
							<span class="flaticon-ruler"></span>
						</button>
						</form>
						
						<a href="#" class="text px-md-2">
							<h3>식단</h3>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="services text-center ftco-animate">
						<form action="inbodyList.do">
							<input type="hidden" value="${member.memberNo }" name="memberNo">
						<button type="submit" class="icon d-flex justify-content-center align-items-center btnNone">
							<span class="flaticon-gym"></span>
						</button>
						</form>
						<a href="#" class="text px-md-2">
							<h3>인바디</h3>
						</a>
					</div>
				</div>
				<div class="col-md-3">
					<div class="services text-center ftco-animate">
						<form action="customerGraph.do">
							<input type="hidden" value="${member.memberNo }" name="memberNo">
							<button type="submit" class="icon d-flex justify-content-center align-items-center btnNone">
							<span class="flaticon-tools-and-utensils"></span>
						</button>
						</form>
						<a href="#" class="text px-md-2">
							<h3>그래프</h3>
						</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script src="/resources/js/jquery.min.js"></script>
	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/resources/js/popper.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<script src="/resources/js/jquery.easing.1.3.js"></script>
	<script src="/resources/js/jquery.waypoints.min.js"></script>
	<script src="/resources/js/jquery.stellar.min.js"></script>
	<script src="/resources/js/owl.carousel.min.js"></script>
	<script src="/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="/resources/js/aos.js"></script>
	<script src="/resources/js/jquery.animateNumber.min.js"></script>
	<script src="/resources/js/bootstrap-datepicker.js"></script>
	<script src="/resources/js/jquery.timepicker.min.js"></script>
	<script src="/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>