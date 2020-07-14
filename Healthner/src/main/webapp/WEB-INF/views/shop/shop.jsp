<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>shop</title>
<link rel="icon" href="/resources/images/favicon.png">
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

.card-text {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
.row select{
	overflow: auto;
	border : none;
	
}

</style>
</head>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForShop.jsp" />

				<section class="ftco-section bg-light">
					<div class="container">
					<div class="row justify-content-center">
						<div class="col-md-8 text-center">
							<div class="heading-section mb-5"><h1 style="font-style:italic; font-weight:900;">PRODUCT</h1></div>
						</div>
					</div>
						<div>
							<form action="/healthner/shop/productSearchList.do">
								<div class="row">
								<div class="col-md-2">
									<select class="selectpicker show-tick" style="width: 100%" size="3" name="category">
										<c:if test="${category eq 1 }">
											<option value="1" selected>국내제품</option>
											<option value="2">해외제품</option>
										</c:if>
										<c:if test="${category eq 2 }">
											<option value="1">국내제품</option>
											<option value="2 selected">해외제품</option>
										</c:if>
										<c:if test="${empty category }">
											<option value="1" selected>국내제품</option>
											<option value="2">해외제품</option>
										</c:if>
									</select> 
								</div>
								<div class="col-md-2">
									<select class="selectpicker show-tick" style="width: 100%" size="3" name="category2">
										<c:if test="${category2 eq 1 }">
											<option value="1" selected>운동기구</option>
											<option value="2">보조식품</option>
											<option value="3">의류</option>
										</c:if>
										<c:if test="${category2 eq 2 }">
											<option value="1">운동기구</option>
											<option value="2" selected>보조식품</option>
											<option value="3">의류</option>
										</c:if>
										<c:if test="${category2 eq 3 }">
											<option value="1">운동기구</option>
											<option value="2">보조식품</option>
											<option value="3" selected>의류</option>
										</c:if>
										<c:if test="${empty category2 }">
											<option value="1" selected>운동기구</option>
											<option value="2">보조식품</option>
											<option value="3">의류</option>
										</c:if>
									</select> 
								</div>
								<div class="col-md-2">
									<select class="selectpicker show-tick" style="width: 100%" size="3" name="category3">
										<c:if test="${category3 eq 1 }">
											<option value="1" selected>공용</option>
											<option value="2">남성</option>
											<option value="3">여성</option>
										</c:if>
										<c:if test="${category3 eq 2 }">
											<option value="1">공용</option>
											<option value="2" selected>남성</option>
											<option value="3">여성</option>
										</c:if>
										<c:if test="${category3 eq 3 }">
											<option value="1">공용</option>
											<option value="2">남성</option>
											<option value="3" selected>여성</option>
										</c:if>
										<c:if test="${empty category3 }">
											<option value="1" selected>공용</option>
											<option value="2">남성</option>
											<option value="3">여성</option>
										</c:if>
									</select> 
								</div>	
									<input type="hidden" name="reqPage" value="1">
									<!-- <div class="col-md-2" style="width: 100px"></div> -->
									<!-- pno , pname , pcontent , price , stock , category , category2 , category3 , thumbnail -->
									
									<div class="col-md-4">
										<input type="text" name="pname" class="pname form-control" style="width:100%; margin-top: 7.7px;" value="${pname}">
									</div>
									
									<div class="col-md-2" style="vertcal-align:middle">
										<button type="submit" class="btn btn-dark btn-block" style="margin-top: 19.3px;">검색</button>
									</div>
									
								</div>
							</form>
						</div>
					
					<!-- pno , pname , pcontent , price , stock , category , category2 , category3 , thumbnail -->
					<br> <br>
					<div class="row">
						<c:forEach items="${list }" var="n">
							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">

									<img class="bd-placeholder-img card-img-top" width="100%"
										height="225" xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img" src="/resources/upload/thumbnail/${n.thumbnail }" onerror="this.src='/resources/images/favicon.png'; this.onerror=null;" >
									<rect width="100%" height="100%" fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
									<div class="card-body">
										<p class="card-text">${n.pname }</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-outline-secondary">
													<a href="/healthner/shop/shopView.do?pno=${n.pno }">상세보기</a>
												</button>
											</div>
											<small class="text-muted">Price : ${n.price }</small>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</div>
					<div class="row justify-content-center">
					
					<div class="col-md-0" id="pageNavi">${navi }</div>
					

				</div>
		</div>
		
		</section>
		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</body>
</html>