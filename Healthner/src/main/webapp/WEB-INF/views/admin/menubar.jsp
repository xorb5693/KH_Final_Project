<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
<head>
<title>관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/admin/css/style.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
</head>
<!--혜진_200622_기존 템플릿 이외에 스타일 추가-->
<style>
.body {
	font-family: 'Nanum Gothic', sans-serif;
}

.main-logo {
	width: 105%;
	margin-top: 20px;
	margin-bottom: 15px;
}

#sidebar {
	font-family: 'Nanum Gothic', sans-serif;
}

.sub-list {
	line-height: 0;
	display: none;
}

.sub-list li span {
	margin-left: 20px;
}

.logo span {
	display: inline-block;
}

.side-bar h1 span:hover {
	color: #f7da00;
}
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<body>
	<div class="container d-flex align-items-stretch">
		<nav id="sidebar" class="img"
			style="background-image: url(/admin/images/admin_main_column.jpg);">
			<div class="p-4">
				<h1>
					<a href="/adminMain.do" class="logo"><img
						src="/admin/images/Picture4.png" class="main-logo"></a><a
						href="index.html" class="logo"><span style="float: right;"
						id="logout"> [Admin]&nbsp;Logout</span></a>
				</h1>
				<ul class="list-unstyled components mb-5 main-list">
					<li id="1"><a href="/memberMgt.do" style="margin-top: 55px;"><span
							class="fa fa-user mr-3"></span> <span></span>회원 관리</a>
						<ul class="sub-list list-unstyled">
							<li id="2"><a href="/trainerMgt.do"><span
									class="fa fa-long-arrow-right mr-3"></span>트레이너 관리</a></li>
							<li id="3"><a href="/ptMapping.do"><span
									class="fa fa-long-arrow-right mr-3"></span>PT Mapping 관리</a></li>
						</ul></li>
					<li id="4"><a href="/reportMgt.do"><span class="fa fa-warning mr-3"></span>신고
							관리</a>
						<ul class="sub-list list-unstyled">
							<li id="5"><a href="/penaltyMgt.do"><span
									class="fa fa-long-arrow-right mr-3"></span>회원 정지 관리</a></li>
						</ul></li>
					<li id="6"><a href="/productMgt.do"><span
							class="fa fa-shopping-cart mr-3"></span>상품 관리</a></li>
					<li id="7"><a href="/mail.do?reqPage=1"><span class="fa fa-send-o mr-3"></span>쪽지함</a>
					</li>
					<li id="8"><a href="/inquiryMgt.do"><span class="fa fa-calendar mr-3"></span>예약
							목록 관리</a></li>
				</ul>
				<!--
	        <div class="mb-5">
						<h3 class="h6 mb-3">Subscribe for newsletter</h3>
						<form action="#" class="subscribe-form">
	            <div class="form-group d-flex">
	            	<div class="icon"><span class="icon-paper-plane"></span></div>
	              <input type="text" class="form-control" placeholder="Enter Email Address">
	            </div>

	          </form>
					</div>
-->
				<div class="footer">
					<!-- 	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
						</p>
-->
				</div>

			</div>
		</nav>
		<script src="/admin/js/jquery.min.js"></script>
		<script src="/admin/js/popper.js"></script>
		<script src="/admin/js/bootstrap.min.js"></script>
		<script src="/admin/js/main.js"></script>
</body>

<script>
	//혜진_200622_관리자 페이지 사이드 메뉴_메뉴를 클릭하면 색상을 흰->노랑으로 변경 + 메인 메뉴 클릭하면 아래 서브메뉴 길이 확장
	//혜진_200624_이전 script 변경: 주소 url을 검사하여 키워드에 따라 선택된 메뉴에 효과주기
	$(function() {
		var loc = location.href;
		if (loc.includes('memberMgt')) {
			$("#1").addClass("active");
			$("#1").children("ul").show();
		} else if (loc.includes('trainerMgt')) {
			$("#1").children("ul").show();
			$("#2").addClass("active");
		} else if (loc.includes('ptMapping')) {
			$("#1").children("ul").show();
			$("#3").addClass("active");
		} else if (loc.includes('reportMgt')) {
			$("#4").addClass("active");
			$("#4").children("ul").show();
		} else if (loc.includes('penaltyMgt')) {
			$("#4").children("ul").show();
			$("#5").addClass("active");
		} else if (loc.includes('productMgt')) {
			$("#6").addClass("active");
		} else if (loc.includes('mail') || loc.includes('Mail')) {
			$("#7").addClass("active");
		} else if (loc.includes('inquiryMgt')) {
			$("#8").addClass("active");
		}
	});
</script>

</html>