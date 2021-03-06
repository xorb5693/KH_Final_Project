<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Graph</title>

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

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<style>
canvas {
	width: 600px;
}

.appointment {
	overflow: hidden;
	text-align: center;
}

.appointment * {
	margin: 0 auto;
}
</style>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<c:if
		test="${sessionScope.member.memberLevel eq 2 or sessionScope.member.memberLevel eq 3 }">
		<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp" />
	</c:if>
	<c:if test="${sessionScope.member.memberLevel eq 1 }">
		<jsp:include page="/WEB-INF/views/common/headerForMember.jsp" />
	</c:if>
	<c:if test="${sessionScope.member.memberLevel eq 4 }">
		<script>
			location.href = "/adminMain.do";
		</script>
	</c:if>

	<section class="ftco-section bg-light">
		<div class="container px-4">
			<div class="row justify-content-center mb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h3 class="subheading">Shape Your Body</h3>
					<h2 class="mb-1">[${recentBmi.memberName }]님의 그래프</h2>
				</div>
			</div>

			<div class="row d-md-flex align-items-center justify-content-center">

				<div class="col-md-12 appointment pl-md-5 py-md-5 ftco-animate">
					<div class="coach align-items-stretch">
						<span class="ftco-animate">측정 날짜 : ${recentBmi.measureDate }</span>
					</div>
					<div class="form-group ftco-animate" style="width: 100%;">
						<canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
		</div>
		<div class="overlay"></div>
			<div
				class="container col-md-10 appointment pl-md-5 py-md-5 ftco-animate align-items-center">
				<div class="row justify-content-center">
					<div class="col-md-8 text-center">
						<table class="table" style="text-align: center;">
							<tr>
								<th scope="col">체수분</th>
								<th scope="col">단백질</th>
								<th scope="col">무기질</th>
								<th scope="col">체지방량</th>
								<th scope="col">체중</th>
								<th scope="col">골격근량</th>
								<th scope="col">BMI</th>
								<th scope="col">체지방률</th>
								<th scope="col">복부지방률</th>
							</tr>
							<tr>
								<th scope="row">${recentBmi.bodywater}</th>
								<th scope="row">${recentBmi.protein}</th>
								<th scope="row">${recentBmi.mineral}</th>
								<th scope="row">${recentBmi.bodyfat}</th>
								<th scope="row">${recentBmi.weight}</th>
								<th scope="row">${recentBmi.bone}</th>
								<th scope="row">${recentBmi.bmi}</th>
								<th scope="row">${recentBmi.bodyfatPer}</th>
								<th scope="row">${recentBmi.abfatPer}</th>
							</tr>
						</table>
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

	<script>
	const colors = ['rgba(255, 99, 132, 0.2)','rgba(54, 162, 235, 0.2)','rgba(255, 206, 86, 0.2)','rgba(75, 192, 192, 0.2)' ]; 
	const borderColors = ['rgba(255, 99, 132, 1)','rgba(54, 162, 235, 1)','rgba(255, 206, 86, 1)','rgba(75, 192, 192, 1)']
	var chBar = document.getElementById("myChart"); 
	var chartData = { labels: ["체수분", "단백질", "무기질", "체지방량", "체중", "골격근량", "BMI", "체지방률", "복부지방률"], 
			datasets: [
				{ 
					data: [${recentBmi.bodywater}, ${recentBmi.protein}, ${recentBmi.mineral}, ${recentBmi.bodyfat}, ${recentBmi.weight}, ${recentBmi.bone}, ${recentBmi.bmi}, ${recentBmi.bodyfatPer}, ${recentBmi.abfatPer}], 
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
				},
			scales: {
				yAxes: [{
                    display: true,
                    ticks: {
                    	beginAtZero: true
                    }
                }]
			}
		} 
	});
	

	  </script>

</body>
</html>

