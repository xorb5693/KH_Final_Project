<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
<head>
<title>관리자 페이지 - 회원 관리</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/admin/css/style.css">
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
body{
	font-family: 'Nanum Gothic', sans-serif;
}
.admin-btn{
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body>
	<!-- 혜진_200624_메뉴바 삽입 -->
	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5">
		<h6>전체 회원 관리</h6>
		<!-- 혜진_200624_회원 검색 조회 box_아이디/이름/닉네임 입력, 이용권 미등록 찾기, 카드키 미등록 찾기, 검색버튼  -->
		<form action="/memberList" method="post" id="memberList">
		<div class="search-box">
			<!-- (1) 아이디/이름/닉네임 입력 -->
			<input type="text" id="searchWord" placeholder="아이디/이름/닉네임을 입력하세요.">
			<!-- (2) 이용권 미등록 찾기, 카드키 미등록 -->
			이용권 미등록<input type="checkbox" value="expire" name="expire">
			카드키 미등록<input type="checkbox" value="card" name="card">
			<!-- (4)검색 버튼 -->
			<input type="submit" value="검  색" class="admin-btn">
		</div>
		</form>
		<div class="memberTB">
		<table border="1">
			<tr class="titleRow">
				<th>No</th>
				<th>프로필 이미지</th>
				<th>회원 아이디</th>
				<th>회원 이름</th>
				<th>회원 닉네임</th>
				<th>이용권 만료일</th>
				<th>카드키 정보</th>
			</tr>
			<tr class="contentsRow">
			</tr>
		</table>
		</div>
	</div>

	<script>
		//혜진_200624_ajax로 DB에서 회원 데이터 불러오기
		function show_memberlist(){
			var searchWord = $("#searchWord").val();
			var checkbox1 = $("input[name=expire]").val();
			var checkbox2 = $("input[name=card]").val();
			var param = {searchWord:searchWord, checkbox1:checkbox1, checkbox2:checkbox2};
			$.ajax({
				url:"/memberList.do",
				type: "post",
				data: param,
				dataType: "json",
				success: function(data){
					 $(".contentsRow").html("");
		               var html = "";
		               for(var i=0; i<data.length;i++){
		                  html += "<td>"+i+"</td>";
		                  html += "<td>"+data[i].memberProfile+"</td>";
		                  html += "<td>"+data[i].memberId+"</td>";
		                  html += "<td>"+data[i].memberName+"</td>";
		                  html += "<td>"+data[i].memberNick+"</td>";
		                  if(data[i].expireDate!=null){
		                  	html += "<td>"+data[i].expireDate+"</td>";
		                  }else{
		                	html += "<td></td>";
		                  }
		                  if(data[i].card!=null){
		                  	html += "<td>"+data[i].card+"</td>";
		                  }else{
		                	html += "<td></td>";
		                  }
		               }
		               $(".contentsRow").append(html);
		            },
		            error: function(){
		               console.log("데이터 불러오기 실패.")
		            }
		         });
		}
		$(function(){
	         $("form").submit(function(){
	        	 show_memberlist();
	            return false;
	         });
	      });
	</script>

	<script src="js/jquery.min.js"></script>
	<script src="js/popper.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>