<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice</title>
<link rel="icon" href="/resources/images/favicon.png">

<style>
	.content{
	padding-right: 200px;
	padding-left: 200px;
}
.noticeC>img{
	width : 100%;
}
</style>
</head>
<body>
	<div class="wraper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
	<div class="content"><br><br>
		<h1 class="bread" style="font-style:italic; font-weight:900;">Notice View</h1>
		<c:if test="${sessionScope.member.memberLevel eq 4 }">
		
			<a style="float:right;" href="/healthner/notice/noticeModify.do?noticeNo=${n.noticeNo }">내용수정</a>
			<a style="float:right; padding-right:10px;" href="/healthner/notice/noticeDelete.do?noticeNo=${n.noticeNo }">글삭제</a>
		</c:if>
	<br><hr>
	<div>
		<div>제목<span><strong>${n.noticeTitle }</strong></span><span style="float:right;"><span>${n.noticeDate }</span></span></div>
		<div></div><br>
		<div class="noticeC">${n.noticeContent }</div>
	</div>
		<%-- <table>
			<tr>
				<th>제목</th>
				<td>${n.noticeTitle }</td>
			</tr>
			
			<tr>
				<th>날짜</th>
				<td>${n.noticeDate }</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>${n.noticeContent }</td>
			</tr>
		</table> --%>
		
	<br><br>
	<hr>
	<div><a class="btn btn-dark" style="color:white;" href="/healthner/notice/noticeList.do?reqPage=1" >목록으로</a></div><br><br>
	</div>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
</body>
</html>