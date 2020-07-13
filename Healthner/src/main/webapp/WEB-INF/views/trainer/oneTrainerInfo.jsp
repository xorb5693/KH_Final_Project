<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Info</title>
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

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<style>

.displayNone {
	display: block;
	display: none;
}

.img {
	border: none;
}

.profileImg {
	width: 500px;
	height: 600px;
}

</style>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>

	<!-- 트레이너 인트로 -->

	<!-- 가입된 트레이너 정보 가져오기  -->
	<section class="ftco-section bg-light">
		<div class="container px-4">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h3 class="subheading">Shape Your Body</h3>
					<h2 class="mb-1">MY INFO</h2>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-3 d-flex">
					<div class="coach align-items-stretch">
						<div class="img ftco-animate" style="width: 200px; height: 300px;">
				            <input type="image"	src="/resources/profile/${list.memberProfile }" onError="this.src='/resources/profile/noprofile.png'" style="width: 200px; height: 300px;" value="${list.memberProfile }">
				        </div>
						<div class="text pt-3 ftco-animate">
                            <h3>${list.memberName }</h3>
                            <p>주특기 1 : ${list.catFirstName }</p>
                            <p>주특기 2 : ${list.catSecondName }</p>
                            <p>주특기 3 : ${list.catThirdName }</p>
                        </div>
					</div>
				</div>
                <div class="col-lg-9 d-flex ftco-animate">
                    <div class="text tg-black">
                        <p>${list.trainerIntro2 }</p>
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
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>