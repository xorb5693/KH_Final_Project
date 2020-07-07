<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NoticeWrite</title>
<link rel="icon" href="/resources/images/favicon.png">

<link rel="stylesheet" href="/resources/ckeditor/contents.css">

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"
	charset="utf-8"></script>
</head>
<style>
.content {
	padding: 50px;
}
</style>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="hero-wrap"
			style="background-image: url('/resources/images/bg_1.jpg');">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
						<br>
						<br>
						<h1 class="mb-3 bread">Notice Write</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<div class="content">
			<form action="/healthner/notice/noticeUp.do" method="post" enctype="multipart/form-data">
			<!-- <input type="hidden" name="noticeFilename">  -->
				<h2>공지사항 글쓰기</h2>
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				제목 : <input type="text" name="noticeTitle"><br>
				<!-- 썸네일 : <input type="file" id="noticeFilename" name="noticeFilename"> -->
				<textarea id="ck4" name="noticeContent"></textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do'
					});
				</script>
				<input type="submit" value="작성" onclick="return writeNotice()">
			</form>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	<script>
		function writeNotice(){
			var content = $("#ck4").val();
			var img = $(content).find("img").eq(0);
			var src = $(img).attr("src");
			$("input[name=noticeFilename]").val(src);
		}
		
	</script>


</body>

</html>



