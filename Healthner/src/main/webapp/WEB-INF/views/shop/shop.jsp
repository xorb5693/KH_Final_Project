<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/album/">

<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
<link href="album.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
</head>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="hero-wrap"
			style="background-image: url('/resources/images/bg_1.jpg');">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
						<br> <br>
						<h1 class="mb-3 bread">SHOP</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="/basketList.do?memberNo=${sessionScope.member.memberNo}">장바구니보기</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<div class="content">
			<main role="main">

				<div class="album py-5 bg-light">
					<div class="container">
						<div>
							<form action="/productSearchList.do">
								<div class="row">
									<select class="col-md-2" size="3" name="category">
										<option value="1" selected>국내제품
										<option value="2">해외제품
									</select> 
									<select class="col-md-2" size="3" name="category2">
										<option value="1" selected>운동기구
										<option value="2">보조식품
										<option value="3">의류
									</select> 
									<select class="col-md-2" size="3" name="category3">
										<option value="1" selected>a
										<option value="2">b
										<option value="3">c
									</select> 
									<input type="hidden" name="reqPage" value="1">
									<div class="col-md-2" style="width: 100px">
										<h2>검색</h2>
									</div>
									<!-- pno , pname , pcontent , price , stock , category , category2 , category3 , thumbnail -->
									<div style="width: 200px">
										<c:if test="${not empty keyword}">
											<input type="text" name="pname"
												class="pname form-control" value="${keyword}">
										</c:if>
										<c:if test="${empty keyword}">
											<input type="text" name="pname"
												class="boardTitle form-control">
										</c:if>
									</div>
									<div style="width: 80px">
										<button type="submit" class="btn btn-primary">검색</button>
									</div>
							</form>
						</div>
					</div>
					<!-- pno , pname , pcontent , price , stock , category , category2 , category3 , thumbnail -->
					<br>
					<br>
					<div class="row">
						<c:forEach items="${list }" var="n">
							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">

									<img class="bd-placeholder-img card-img-top" width="100%"
										height="225" xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img" src="${n.thumbnail }">
									<rect width="100%" height="100%" fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
									<div class="card-body">
										<p class="card-text">${n.pcontent }</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary"><a href="/shopView.do?pno=${n.pno }">상세보기</a></button>
											</div>
											<small class="text-muted">Price : ${n.price }</small>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
				</div>
		</div>

		</main>

	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</body>
</html>