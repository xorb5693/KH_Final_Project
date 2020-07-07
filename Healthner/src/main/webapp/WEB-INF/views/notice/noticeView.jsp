<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="icon" href="/resources/images/favicon.png">
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
						<br>
						<br>
						<h1 class="mb-3 bread">Place title here</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>
	<div class="content">
		<table>
			<tr>
				<th>제목</th>
				<td>${n.noticeTitle }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${n.noticeDate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${n.noticeContent }</td>
			</tr>
		</table>
		<a href="/healthner/notice/noticeModify.do?noticeNo=${n.noticeNo }">내용수정</a>
	<a href="/healthner/notice/noticeDelete.do?noticeNo=${n.noticeNo }">글삭제</a>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>