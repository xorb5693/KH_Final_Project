<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>notice</title>
<link rel="icon" href="/resources/images/favicon.png">
</head>
<style>
	.content{
		padding-right: 200px;
	padding-left: 200px;
	}
	
	.tt>div>a{
		color:black;
	}
	.tt>div:hover{
		background-color:#EEEEEE;
	}
	.tt>div{
		width:200px;
		height:200px;
		 text-align: center;
		 line-height: 200px;
	}
</style>
<body>
	 
	<div class='wrapper'>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
		<div class="container">
			<div class="content">
			<br>
				<div class="row tt">
					<div class="col-md-4">
						<a href="/healthner/notice/noticeWriteFrm.do">공지사항 글쓰기</a>
					</div>	
					<div class="col-md-4">
						<a href="/healthner/notice/boardWriteFrm.do">자유게시판 글쓰기</a>
					</div>
					<div class="col-md-4">
						<a href="/healthner/notice/boardWriteFrm.do">트레이너게시판 글쓰기</a>
					</div>
				</div>
					<br><hr><br>
				<div class="row tt">
					<div class="col-md-4">
						<a href="/healthner/notice/noticeList.do?reqPage=1">공지사항 목록보기</a>
					</div>
					<div class="col-md-4">
						<a href="/healthner/board/boardList.do?reqPage=1">자유게시판 목록보기</a>
					</div>
					<div class="col-md-4">
						<a href="/healthner/board/boardList.do?reqPage=1">트레이너게시판 목록보기</a>
					</div>
				</div>
			<br>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

</body>
</html>