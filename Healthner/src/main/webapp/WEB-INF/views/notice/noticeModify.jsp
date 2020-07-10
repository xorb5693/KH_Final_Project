<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeModify</title>
<link rel="icon" href="/resources/images/favicon.png">
<link rel="stylesheet" href="/resources/ckeditor/contents.css">

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"
	charset="utf-8"></script>
	<style>
		#ck4{
			
		}
		.content {

	padding-right: 200px;
	padding-left: 200px;
}
	</style>
</head>
<body>
	<div class="wraper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
	<div class="content">		<br><br>
			<form action="/healthner/notice/noticeUpdate.do" method="post">
				<h1 class="bread" style="font-style:italic; font-weight:900;">Notice Modify</h1>
				<a class="btn btn-dark" href="/healthner/notice/noticeList.do?reqPage=1" style="float:right;">목록으로 돌아가기</a><br><hr><br>
				<input type="hidden" name="noticeNo" value="${n.noticeNo }">
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				<p>제목 : <input style="width:600px; border-radius: 3px;" type="text" name="noticeTitle" value="${n.noticeTitle }"></p><br>
				<textarea id="ck4" name="noticeContent" row="5">${n.noticeContent }</textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do',
						height : 500
					});
				</script><br>
				<p><input type="submit" class="btn btn-dark" value="수정하기"></p>
			</form>	
			
	
	
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>