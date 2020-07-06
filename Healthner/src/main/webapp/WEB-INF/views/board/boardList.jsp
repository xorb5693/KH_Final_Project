<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.boardSearch>div>form>div:last-child>button {
	margin-top: 11.5px;
}

.boardSearch {
	text-align: center;
}

.boardSearch>div {
	display: inline-block;
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
						<h1 class="mb-3 bread">BOARD</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="noticeList.do?reqPage=1">NOTICE</a></span>
							<span><a href="boardList.do?reqPage=1">BOARD</a></span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<div class="content">
			<!-- 보드타입 0 일경우 자유게시판 1일경우 트레이너 게시판 따로 출력할것 -->

			<c:if test="${sessionScope.member.memberLevel eq 1}">
			</c:if>


		</div>
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col">#</th>
					<th scope="col">First</th>
					<th scope="col">Last</th>
					<th scope="col">Handle</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list }" var="n">
					<tr>
						<th scope="row">${n.boardNo }</th>
						<td>${n.boardWriter }</td>
						<td><a href="/boardView.do?boardNo=${n.boardNo}">${n.boardTitle }</a></td>
						<td>${n.boardDate }</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="boardSearch col-md-6">
				<div>
					<form action="/boardSearchList.do">
						<input type="hidden" name="reqPage" value="1">
						<div style="width: 100px">
							<select name="boardType" class="form-control">
								<option value="board_title" selected>제목</option>
								<option value="board_writer">글쓴이</option>
							</select>
						</div>
						<div style="width: 350px">
							<c:if test="${not empty keyword}">
								<input type="text" name="searchString"
									class="boardTitle form-control" value="${keyword}">
							</c:if>
							<c:if test="${empty keyword}">
								<input type="text" name="searchString"
									class="boardTitle form-control">
							</c:if>
						</div>
						<div style="width: 80px">
							<button type="submit" class="btn btn-primary">검색</button>
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="row">
			<div class="col-md-6"></div>
			<div class="col-md-0" id="pageNavi">${navi }</div>
			<div class="col-md-5"></div>

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