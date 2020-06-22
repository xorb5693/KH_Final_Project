<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript"
	src="<c:url value = '/resources/ckeditor/ckeditor.js' />"></script>
<script>
	window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}', '${url}',
			'파일 전송 완료.');
</script>

</head>
<body>

	
	<div>글 제목입니다 : ${sessionScope.title }</div>
	<div>글 내용입니다 : ${sessionScope.content }</div>
	<div><a href="noticeList.do?reqPage=1">게시판목록으로</a></div>
	
</body>
</html>