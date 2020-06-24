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
		<section class="hero-wrap" style="background-image: url('/resources/images/bg_1.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">Place title here</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span></p>
          </div>
        </div>
      </div>
    </section>
		<div class="container">
			<div class="content">
				<a href="/noticeWriteFrm.do">공지사항 글쓰기</a><br>
				<a href="/boardWriteFrm.do">자유게시판 글쓰기</a><br>
				<a href="#">트레이너게시판 글쓰기</a><hr>
				<table>
					<tr><td><a href="noticeList.do?reqPage=1">공지사항 목록보기</td></tr>
					<tr><td><a href="#">자유게시판 목록보기</a></td></tr>
					<tr><td><a href="#">트레이너게시판 목록보기</a></td></tr>
				</table>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	</div>

</body>
</html>