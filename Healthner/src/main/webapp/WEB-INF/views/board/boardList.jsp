<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="icon" href="/resources/images/favicon.png">
<style>
.boardSearch>div>form>div:last-child>button {
	margin-top: 11.5px;
}

.boardSearch {
	text-align: center;
}
</style>
</head>
<body>


	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp" />

		<section class="ftco-section bg-light">

			

			<div class="container">
			<h1 class="bread" style="font-style: italic; font-weight: 900;">Board
				List</h1>
			<br>
			<hr>
			<br>
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
						<c:if test="${sessionScope.member.memberLevel eq 1}">
							<c:forEach items="${list }" var="n">
								<c:if test="${n.boardType eq 0 }">
									<tr>
										<th scope="row">${n.boardNo }</th>
										<td>${n.memberNick }</td>
										<td><a
											href="/healthner/board/boardView.do?boardNo=${n.boardNo}" class="tg-black">${n.boardTitle }</a></td>
										<td>${n.boardDate }</td>
									</tr>
								</c:if>
							</c:forEach>
						</c:if>
						<c:if test="${sessionScope.member.memberLevel eq 3}">
							<c:forEach items="${list }" var="n">
								<c:if test="${n.boardType eq 1 }">
									<tr>
										<th scope="row">${n.boardNo }</th>
										<td>${n.memberNick }</td>
										<td><a
											href="/healthner/board/boardView.do?boardNo=${n.boardNo}" class="tg-black">${n.boardTitle }</a></td>
										<td>${n.boardDate }</td>
									</tr>
								</c:if>
							</c:forEach>

						</c:if>


					</tbody>
				</table>
				<div class="row justify-content-center">
					<div class="boardSearch">
						<div class="row justify-content-center">
							<form action="/healthner/board/boardSearchList.do">
								<input type="hidden" name="reqPage" value="1">
								<div style="width: 100px;  display:inline-block; float:left;">
									<select name="boardType" class="form-control">
										<option value="board_title" selected>제목</option>
										<option value="board_writer">글쓴이</option>
									</select>
								</div>
								<div style="width: 350px; display:inline-block; float:left;">
									<c:if test="${not empty keyword}">
										<input type="text" name="searchString"
											class="boardTitle form-control" value="${keyword}">
									</c:if>
									<c:if test="${empty keyword}">
										<input type="text" name="searchString"
											class="boardTitle form-control">
									</c:if>
								</div>
								<div style="width: 80px;  display:inline-block; float:left; ">
									<button type="submit" class="btn btn-dark">검색</button>
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