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

	padding-right: 200px;
	padding-left: 200px;
}
.cke_contents{
	height : 800px;
}
#noticeTitle{
	margin-bottom : 20px;
	
}
    .btn btn-dark{
        text-align: right;
    }
</style>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp"/>
		<div class="content"><br><br>
			<form action="/healthner/notice/noticeUp.do" method="post" enctype="multipart/form-data">
			<!-- <input type="hidden" name="noticeFilename">  -->
				<h1 class="bread" style="font-style:italic; font-weight:900;">Notice Write</h1><br><hr><br>
				<!-- <form action="/noticeWrite.do" method="post" enctype="multipart/form-data"> -->
				<p>제목 : <input type="text" name="noticeTitle" style="width:600px; border-radius: 3px;"></p><br>
				<!-- 썸네일 : <input type="file" id="noticeFilename" name="noticeFilename"> -->
				<textarea id="ck4" name="noticeContent"></textarea>
				<script>
					CKEDITOR.replace('ck4', {
						filebrowserUploadUrl : '/healthner/notice/imageUpload.do',
						height : 500
					});
				</script>
				<br>
				<input class="btn btn-dark text-uppercase btn-lg" type="submit" value="작성" onclick="return writeNotice()"><br><br>
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



