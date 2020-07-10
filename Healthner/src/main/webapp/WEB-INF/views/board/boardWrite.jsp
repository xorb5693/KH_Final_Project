<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board</title>
<link rel="icon" href="/resources/images/favicon.png">
<link rel="stylesheet" href="/resources/ckeditor/contents.css">

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"
	charset="utf-8"></script>
</head>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
		<section class="ftco-section bg-light">
		<div class="content">
		
		
					<div class="container">
		
		<h1 class="bread" style="font-style:italic; font-weight:900;">Board Write</h1><br><hr><br>
		
		<c:if test="${sessionScope.member.memberLevel eq 1 }">
			<form action="/healthner/board/boardUp.do" method="post">
				<h5>자유게시판</h5>
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				제목 : <input type="text" name="boardTitle"><br>
				<input type="hidden" name="boardWriter" value="${sessionScope.member.memberNo }">
				<input type="hidden" name="boardType" value="0"><br>
				<textarea id="ck4" name="boardContent"></textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do',
						height:500
					});
				</script>
				
				<input class="btn btn-dark text-uppercase btn-lg" type="submit" value="작성">
			</form>
			</c:if>
			
			<c:if test="${sessionScope.member.memberLevel eq 3 }">
			<form action="/healthner/board/boardUp.do" method="post">
				<h5>트레이너게시판</h5>
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				<input type="hidden" name="boardWriter" value="${sessionScope.member.memberNo }">
				제목 : <input type="text" name="boardTitle"><br>
				<input type="hidden" name="boardType" value="1"><br>
				<textarea id="ck4" name="boardContent"></textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do'
					});
				</script>
				<br>
				<input class="btn btn-dark text-uppercase btn-lg" style="margin-top:5px;" type="submit" value="작성">
			</form>
			</c:if>
			
			
		</div>
		</div>
		</section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>