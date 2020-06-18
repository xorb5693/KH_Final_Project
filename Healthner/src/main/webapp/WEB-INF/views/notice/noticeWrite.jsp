<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <script type="text/javascript" src="se2/js/notice-write.js"></script> -->
<script type="text/javascript" src="<%=request.getContextPath() %>/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<h2>공지사항 글쓰기</h2>
	<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
	제목 : <input type="text" name="noticeTitle"><br>
	내용 : <textarea name="ir1" id="ir1" rows="10" cols="100"></textarea><br>
	<input type="button" id="writebtn" name="writebtn" value="등록">
	</form>
	
	
</body>

</html>



	