<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Info Input</title>
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
select.form-control>option {
	font-size: 1.2em;
}
</style>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>

	<!-- 트레이너 정보 입력 수정 -->
	<!--
	<c:if test="${not empty sessionScope.member && sessionScope.member.memberId == id }"></c:if>
	-->


	<section class="ftco-appointment">
		<div class="overlay"></div>
		<div
			class="container col-md-9 appointment pl-md-5 py-md-5 ftco-animate align-items-center">
			<div class="row justify-content-center">
				<div class="col-md-8 text-center">
					<div class="heading-section mb-5">
						<span class="subheading"><small><i class="left-bar"></i>Services<i
								class="right-bar"></i></small></span>
						<h2 class="mb-1">[${member.memberName }]님의 정보</h2>
					</div>
				</div>
			</div>
			<form action="trainerInput.do" class="appointment-form">
				<div class="form-group">
					<label for="height">Name&nbsp&nbsp</label><span>${list.memberName }</span>
				</div>
				<input type="hidden" name="memberNo" value="${list.memberNo }">
				<input type="hidden" name="memberName" id="memberName" value="${list.memberName }">
				<div class="form-group">
					<div class="d-flex">
						<div class="mr-2">
							<label for="catFirst">주특기1</label> 
							<select class="form-control" name="catFirst" id="catFirst" required>
								<option value="">주특기를 선택해 주세요</option>
								<option value="1">다이어트</option>
								<option value="2">헬스</option>
								<option value="3">보디빌딩</option>
							</select>
						</div>
						<div class="ml-2">
							<label for="catSecond">주특기2</label> 
							<select class="form-control" name="catSecond" id="catSecond" required>
								<option value="">주특기를 선택해 주세요</option>
								<option value="1">다이어트</option>
								<option value="2">헬스</option>
								<option value="3">보디빌딩</option>
							</select>
						</div>
						<div class="ml-2">
							<label for="catThird">주특기3</label> 
							<select class="form-control" name="catThird" id="catThird" required>
								<option value="">주특기를 선택해 주세요</option>
								<option value="1">다이어트</option>
								<option value="2">헬스</option>
								<option value="3">보디빌딩</option>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<textarea name="trainerIntro" id="trainerIntro" cols="30" rows="7"
						class="form-control" placeholder="자기소개를 입력하세요" required>${list.trainerIntro }</textarea>
				</div>
				<div class="d-md-flex">
					<div class="form-group d-flex">
						<input type="submit" value="확인"
							class="btn btn-secondary py-3 px-4 mr-2">
					</div>
				</div>
			</form>

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
	<script>
	
	</script>
</body>
</html>