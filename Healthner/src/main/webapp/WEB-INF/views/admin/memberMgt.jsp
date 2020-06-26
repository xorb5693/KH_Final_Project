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
		<div class="search-box">
			<!-- (1) 아이디/이름/닉네임 입력 -->
			<input type="text" id="searchWord" placeholder="아이디/이름/닉네임을 입력하세요.">
			<!-- (2) 이용권 미등록 찾기, 카드키 미등록 -->
			이용권 미등록<input type="checkbox" value="expire" name="expire">
			카드키 미등록<input type="checkbox" value="card" name="card">
			<!-- (4)검색 버튼 -->
			<input type="button" value="검  색" class="admin-btn" onclick="show_memberlist();">
		</div>
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
		</table>
		</div>
	</div>

	<script>
		//혜진_200624_ajax로 DB에서 회원 데이터 불러오기
		function show_memberlist(){
			var searchWord = $("#searchWord").val();
			if($("input[name=expire]").prop("checked")){
				var checkbox1 = 1;
			}else{
				var checkbox1 = 0;
			}
			if($("input[name=card]").prop("checked")){
				var checkbox2 = 1;
			}else{
				var checkbox2 = 0;
			}
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
		            	  html += "<tr class='contentsRow'>"
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
		                  	html += "<td onclick=window.open('addCard')>"+data[i].card+"</td>";
		                  }else{
		                	html += "<td onclick=window.open('addCard')></td>";
		                  }
		                  html += "</tr>"
		               }
		               $("table").children("tbody").append(html);
		            },
		            error: function(){
		               console.log("데이터 불러오기 실패.")
		            }
		         });
		}
	
	//혜진_200626_페이지를 로드 하자마자 list 보여주기
	$(function(){
		show_memberlist();
	});
	
	//혜진_200626_카드 공란을 클릭하면 카드키 조정 가능

	</script>
	<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
</body>
</html>