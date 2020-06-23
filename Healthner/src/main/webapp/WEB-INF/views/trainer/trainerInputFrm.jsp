<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
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
	select.form-control>option{
		font-size: 1.2em;
	}
</style>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">TRAINERS</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="trainerIntro.do">Trainer Intro</a></span> <span class="mr-2"><a href="customerList.do">My Customer </a></span> <span class="mr-2"><a href="trainerInputFrm.do">Edit Info</a></span></p>
          </div>
        </div>
      </div>
    </section>
	
	<!-- 트레이너 정보 입력 수정 -->
	<!--
	<c:if test="${not empty sessionScope.member && sessionScope.member.memberId == id }"></c:if>
	-->
	
	
	<section class="ftco-appointment">
			<div class="overlay"></div>
    	<div class="container col-md-9 appointment pl-md-5 py-md-5 ftco-animate align-items-center">

	    			<h3 class="mb-3">Trainer Information Input</h3>
	    			<form action="#" class="appointment-form">
	    				<div class="form-group">
	    					<label for="height">Name</label><span>김기창 ${member.memberName }</span>
	    				</div>
	    				<div class="form-group">
	    					<div class="d-flex">
	    						<div class="mr-2">
	    							<label for="catFirst">주특기1</label>
			    					<select class="form-control">
			    						<option></option>
			    						<option>다이어트</option>
			    						<option>보디빌딩</option>
			    					</select>
			    				</div>
		    					<div class="ml-2">
	    							<label for="catSecond">주특기2</label>
			    					<select class="form-control">
			    						<option></option>
			    						<option>다이어트</option>
			    						<option>보디빌딩</option>
			    					</select>
			    				</div>
			    				<div class="ml-2">
	    							<label for="catThird">주특기3</label>
			    					<select class="form-control">
			    						<option></option>
			    						<option>다이어트</option>
			    						<option>보디빌딩</option>
			    					</select>
			    				</div>
	    					</div>	
	    				</div>
	    				<div class="form-group">
                				<textarea name="" id="" cols="30" rows="7" class="form-control" placeholder="Message"></textarea>
             				</div>
	    				<div class="d-md-flex">
		            <div class="form-group d-flex">
		            	<input type="submit" value="확인" class="btn btn-secondary py-3 px-4 mr-2">
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
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>