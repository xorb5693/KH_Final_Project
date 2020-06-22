<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content{
		
	}
</style>
<body>
	 
	<div class='wrapper'>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="content">
				<a href="/noticeWriteFrm.do">게시판글쓰기</a>
				<table>
					<tr><td>게시글</td></tr>
					<tr><td>게시글</td></tr>
					<tr><td>게시글</td></tr>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

</body>
</html>