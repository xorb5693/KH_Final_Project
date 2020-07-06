<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/ckeditor/contents.css">

<script type="text/javascript" src="resources/ckeditor/ckeditor.js"
	charset="utf-8"></script>
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
		<c:if test="${sessionScope.member.memberLevel eq 1 }">회원일경우출력</c:if>
			<form action="/boardUp.do" method="post">
				<h2>자유게시판 글쓰기</h2>
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				제목 : <input type="text" name="boardTitle"><br>
				<input type="hidden" name="boardType" value="0"><br>
				<textarea id="ck4" name="boardContent"></textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/imageUpload.do'
					});
				</script>
				
				<input type="submit" value="작성">
			</form>
			
			
			<c:if test="${sessionScope.member.memberLevel eq 3 }">
			<form action="/boardUp.do" method="post">
				<h2>트레이너게시판 글쓰기</h2>
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				제목 : <input type="text" name="boardTitle"><br>
				<input type="hidden" name="boardType" value="1"><br>
				<textarea id="ck4" name="boardContent"></textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/imageUpload.do'
					});
				</script>
				<input type="submit" value="작성">
			</form>
			</c:if>
			
			
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>