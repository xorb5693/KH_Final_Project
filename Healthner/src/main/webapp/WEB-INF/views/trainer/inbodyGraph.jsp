<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Graph</title>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"  crossorigin="anonymous"></script> 
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> 
</head>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">TRAINERS</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="trainer.do">Trainer Intro</a></span> <span class="mr-2"><a href="customerList.do">My Customer </a></span> <span class="mr-2"><a href="trainerInputFrm.do">Edit Info</a></span></p>
          </div>
        </div>
      </div>
    </section>
	
		<section class="ftco-section bg-light">
    	<div class="container px-4">
    	<div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<h3 class="subheading">Shape Your Body</h3>
            <h2 class="mb-1">[${recentBmi.memberName }]님의 그래프</h2>
          </div>
        </div>

	    <div class="row d-md-flex align-items-center">
		    <div class="col-md-6 appointment pl-md-5 py-md-5 ftco-animate">
		    	<div class="coach align-items-stretch">
	    			<span class="ftco-animate">측정 날짜 : ${recentBmi.measureDate }</span>
	    		</div>
	        	<div class="form-group ftco-animate" style="width: 400px;"> 
	            	<canvas id="myChart"></canvas> 
	        	</div>
	        	<div class="form-group ftco-animate" style="width: 400px;"> 
	            	<canvas id="myChart3"></canvas> 
	        	</div> 	
	        </div>
	        <div class="col-md-6 appointment pl-md-5 py-md-5 ftco-animate">
	        	<div class="form-group ftco-animate" style="width: 400px;"> 
	            	<canvas id="myChart2"></canvas> 
	        	</div>
	        	<div class="form-group ftco-animate" style="width: 400px; height: 140px; display: hidden;"> 
	        	설명 추가하자
	            	<canvas id="myChart4"></canvas> 
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
	
	<script>
	const colors = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)' ]; 
	const borderColors = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)']
	var chBar = document.getElementById("myChart"); 
	var chartData = { labels: ["체수분", "단백질", "무기질", "체지방량"], 
			datasets: [
				{ 
					data: [${recentBmi.bodywater}, ${recentBmi.protein}, ${recentBmi.mineral}, ${recentBmi.bodyfat}], 
					backgroundColor: colors[0],
					borderColor: borderColors[0],
					borderWidth: 1
				}
			]	
	}; 
	var myChart = new Chart(chBar, { 
		// 챠트 종류를 선택 
		type: 'bar', 
		// 챠트를 그릴 데이타
		data: chartData, 
		// 옵션 
		options: { 
			legend: { 
				display: false 
				} 
		} 
	});

	var chBar = document.getElementById("myChart2"); 
	var chartData = { labels: ["체중", "골격근량", "체지방량"], 
			datasets: [
				{ 
					data: [${recentBmi.weight}, ${recentBmi.bone}, ${recentBmi.bodyfat}], 
					backgroundColor: colors[1],
					borderColor: borderColors[1],
					borderWidth: 1
				}
			] 
	}; 
	var myChart = new Chart(chBar, { 
		// 챠트 종류를 선택 
		type: 'bar', 
		// 챠트를 그릴 데이타
		data: chartData, 
		// 옵션 
		options: { 
			legend: { 
				display: false 
				} 
		} 
	});
	

	var chBar = document.getElementById("myChart3"); 
	var chartData = { labels: ["BMI", "체지방률", "복부지방률"], 
			datasets: [
				{ 
					data: [${recentBmi.bmi}, ${recentBmi.bodyfatPer}, ${recentBmi.abfatPer}], 
					backgroundColor: colors[2],
					borderColor: borderColors[2],
					borderWidth: 1
				}
			] 
	}; 
	var myChart = new Chart(chBar, { 
		// 챠트 종류를 선택 
		type: 'bar', 
		// 챠트를 그릴 데이타
		data: chartData, 
		// 옵션 
		options: { 
			legend: { 
				display: false 
				} 
		} 
	});
	

	  </script>
	
</body>
</html>

