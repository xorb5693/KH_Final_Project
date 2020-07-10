<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardModify</title>
<link rel="icon" href="/resources/images/favicon.png">
<link rel="stylesheet" href="resources/ckeditor/contents.css">

<script type="text/javascript" src="resources/ckeditor/ckeditor.js"
	charset="utf-8"></script>
</head>
<body>
	<div class="wraper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
	<div class="content">		
			<form action="/healthner/board/boardUpdate.do" method="post">
				<h2>자유게시판 글쓰기</h2>
				<input type="hidden" name="boardNo" value="${b.boardNo }">
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				글쓴이 : <input type="text" name="boardWriter" value="${b.boardWriter }" readonly><br>
				제목 : <input type="text" name="boardTitle" value="${b.boardTitle }"><br>
				<textarea id="ck4" name="boardContent" row="5">${b.boardContent }</textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do'
					});
				</script>
				<input type="submit" value="수정하기">
			</form>	
			<a href="/healthner/board/boardList.do?reqPage=1">목록으로 돌아가기</a>
	
	
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>

</body>
</html>