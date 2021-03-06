<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inbody Input</title>
	<link rel="icon" href="/resources/images/favicon.png">
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<style>	
	select.form-control>option{
		font-size: 1.2em;
	}
</style>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>
	
	<!-- 트레이너 정보 입력 수정 -->
	<!--
	<c:if test="${not empty sessionScope.member && sessionScope.member.memberId == id }"></c:if>
	-->
	
	
	<section class="ftco-appointment">
			<div class="overlay"></div>
    	<div class="container col-md-6 appointment pl-md-5 py-md-5 ftco-animate align-items-center">
	    						<div class="row justify-content-center">
	    		<div class="col-md-8 text-center">
					<div class="heading-section mb-5">
						<span class="subheading"><small><i class="left-bar"></i>Services<i
								class="right-bar"></i></small></span>
						<h2 class="mb-1">
							[${member.memberName }]님의 인바디
						</h2>
					</div>
				</div>
			</div> 
			
			<form action="insertInbody.do" class="appointment-form">
	    				<div class="form-group">		
	    					<label>측정 날짜&nbsp&nbsp&nbsp</label><span id="dateShow"></span>	    					
	    				</div>
	    				<input type="hidden" name="memberNo" value="${member.memberNo }">
	    				<div class="form-group">
	    					<div class="d-flex">
	    						<table class="table">
			  <thead>
			    <tr>
			      <th scope="col">체성분 분석</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">체수분</th>
			      <td><input type="text" class="input-group" name="bodywater" id="bodywater"></td>
			    </tr>
			    <tr>
			      <th scope="row">단백질</th>
			      <td><input type="text" class="input-group" name="protein"></td>
			    </tr>
			    <tr>
			      <th scope="row">무기질</th>
			      <td><input type="text" class="input-group" name="mineral"></td>
			    </tr>
			    <tr>
			      <th scope="row">체지방량</th>
			      <td><input type="text" class="input-group" name="bodyfat"></td>
			    </tr>
			  </tbody>
			    <tr>
			      <th scope="col">골격근 및 지방</th>
			    </tr>
			  <tbody>
			    <tr>
			      <th scope="row">몸무게</th>
			      <td><input type="text" class="input-group" name="weight"></td>
			    </tr>
			    <tr>
			      <th scope="row">골격근량</th>
			      <td><input type="text" class="input-group" name="bone"></td>
			    </tr>
			    <tr>
			      <th scope="row">체지방량</th>
			      <td><input type="text" class="input-group" name="bodyfat"></td>
			    </tr>
			  </tbody>
			    <tr>
			      <th scope="col">비만분석</th>
			    </tr>
			  <tbody>
			    <tr>
			      <th scope="row">BMI</th>
			      <td><input type="text" class="input-group" name="bmi"></td>
			    </tr>
			    <tr>
			      <th scope="row">체지방률</th>
			      <td><input type="text" class="input-group" name="bodyfatPer"></td>
			    </tr>
			    <tr>
			      <th scope="row">복부지방률</th>
			      <td><input type="text" class="input-group" name="abfatPer"></td>
			    </tr>
			    <tr>
			      <th scope="row">기초대사량</th>
			      <td><input type="text" class="input-group" name="metabolism"></td>
			    </tr>
			  </tbody>
			</table>
	                               
                            
                    </div>	
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
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	<script>
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth() + 1;
	var yy = today.getFullYear() - 2000;
	if (dd < 10) {
	  dd = '0' + dd;
	} 
	if (mm < 10) {
	  mm = '0' + mm;
	} 
	var today = yy+'/'+mm+'/'+dd;
	
	document.getElementById ('dateShow').innerHTML = today;
	</script>
</body>
</html>