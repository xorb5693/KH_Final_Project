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

</head>
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

.content {
	overflow: hidden;
}

.view {
	display: hidden;
}

.view>div {
	float: left;
}

.noticeSearch>div>form>div {
	float: left;
}

.noticeSearch>div>form>div:last-child>button {
	margin-top: 11.5px;
}

.noticeSearch{
	text-align: center;
}

.noticeSearch>div {
	display: inline-block;
}

#pageNavi {
	
}
.bread{
	margin:o auto;
}
.content{
	padding-right: 200px;
	padding-left: 200px;
}
.wraper{
	
}
</style>
<link href="album.css" rel="stylesheet">
<body>
	<div class="wraper bg-light">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
		<div class="content"><br><br>
			<h1 class="bread" style="font-style:italic; font-weight:900;">Notice List</h1><br><hr><br>
		</div>
		<main role="main">

			<div class="album py-5 bg-light">
				<div class="container">

					<div class="row">
						<c:forEach items="${list }" var="n">
							<div class="col-md-4">
								<div class="card mb-4 shadow-sm">
									<img class="bd-placeholder-img card-img-top" width="100%"
										height="225" xmlns="http://www.w3.org/2000/svg"
										preserveAspectRatio="xMidYMid slice" focusable="false"
										role="img" src="${n.noticeFilename }" onerror="this.src='/resources/images/favicon.png'; this.onerror=null;">
									<rect width="100%" height="100%" fill="#55595c" />
									<text x="50%" y="50%" fill="#eceeef" dy=".3em"></text>
									</svg>
									<div class="card-body">
										<p class="card-text">${n.noticeTitle }</p>
										<div class="d-flex justify-content-between align-items-center">
											<div class="btn-group">
												<button type="button"
													class="btn btn-sm btn-dark btn-outline-secondary">
													<a style="color:white" href="/healthner/notice/noticeView.do?noticeNo=${n.noticeNo}">View</a>
												</button>
											</div>
											<small class="text-muted">${n.noticeDate }</small>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

				</div>
				<div class="row justify-content-center">
					
					<div class="noticeSearch">
						<div>
							<form action="/healthner/notice/noticeSearchTitle.do">
							<input type="hidden" name="reqPage" value="1">
							<input type="hidden" name="search">
								<div style="width:150px">
									<select name="searchType" class="form-control">
										<option class="sel" name="boardTitle" value="boardTitle">제목</option>
										<option class="sel" name="boardWriter" value="boardWriter">글쓴이</option>
									</select>
								</div>
								
								<div style="width:350px">
									<input type="text" name="searchTitle"
										class="searchTitle form-control" value="${keyword}">
								</div>
								<div style="width:80px">
									<button type="submit" class="btn btn-dark">검색</button>
								</div>
							</form>
						</div>
					</div>
					
				</div>
	<script>
		
	</script>

				<div class="row justify-content-center">
					
					<div class="col-md-0" id="pageNavi">${navi }</div>
					

				</div>
		</main>

		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script> -->
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</body>
</html>