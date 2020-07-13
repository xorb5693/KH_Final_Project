<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardModify</title>
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
		<h1 class="bread" style="font-style:italic; font-weight:900;">Board Modify</h1><br><hr><br>
		
			<form action="/healthner/board/boardUpdate.do" method="post">
				<input type="submit" style="float:right;" class="btn btn-dark" value="수정하기">
				<input type="hidden" name="boardNo" value="${b.boardNo }">
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				<%-- 글쓴이 : <input style="width:600px; border-radius: 3px;" type="text" name="boardWriter" value="${b.boardWriter }" readonly><br> --%>
				제목 : <input style="width:620px; border-radius: 3px; margin-bottom:10px;" type="text" name="boardTitle" value="${b.boardTitle }"><br>
				<textarea id="ck4" name="boardContent" row="5">${b.boardContent }</textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do',
						height:500
					});
				</script>
				
			</form>	
			<a href="/healthner/board/boardList.do?reqPage=1" style="margin-top:40px;" class="btn btn-dark">목록으로 돌아가기</a>
	
	
	</div>
	</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>