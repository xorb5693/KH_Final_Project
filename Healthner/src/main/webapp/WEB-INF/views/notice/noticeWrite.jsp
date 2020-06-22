<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="resources/ckeditor/contents.css">

<script type="text/javascript" src="resources/ckeditor/ckeditor.js" charset="utf-8"></script>
</head>
<body>

<form action="noticeUp.do" method="post">
	<h2>공지사항 글쓰기</h2>
	<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
	제목 : <input type="text" name="noticeTitle"><br>
	<textarea id = "ck4" name = "ck4"></textarea>
	<script>CKEDITOR.replace('ck4',{filebrowserUploadUrl:'/imageUpload.do'});</script>
	<input type="submit" value="작성">
</form>
	
	

</body>

</html>



	