<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<th>번호</th>
					<th>글제목</th>
					<th>작성일</th>
				</tr>
				<c:forEach items="${list }" var = "n">
					<tr>
						<td>${n.noticeNo }</td>
						<td><a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle }</a></td>
						<td>${n.noticeDate }</td>
					</tr>
				</c:forEach>
				
			</table>
			<div id="pageNavi">
				${navi }
			</div>
			
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>