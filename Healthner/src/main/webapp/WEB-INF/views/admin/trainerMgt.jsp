<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 트레이너 관리</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/admin/css/style.css">
  </head>
  
<style>
body {
	font-family: 'Nanum Gothic', sans-serif;
}

.admin-btn {
	font-family: 'Nanum Gothic', sans-serif;
}

.small-img {
	margin: 0 auto;
	width: 70px;
}
</style>
<body>
<!-- 혜진_200630_헤더(메뉴바)추가 -->
	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5">
		<h6>트레이너 가입 관리</h6>
		<div class="search-box">
		<!-- 혜진_200630_검색창 제작 -->
			<input type="text" id="searchWord" placeholder="아이디/이름/닉네임을 입력하세요.">
			<select name="memberType">
				<option value=0>전체 보기</option>
				<option value=3>가입 승인</option>
				<option value=2>가입 미승인</option>
			</select>
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_trainerlist(1,1);">
		</div>
		<div class="memberTB">
			<table border="1">
				<tr class="titleRow">
					<th>No</th>
					<th>프로필 이미지</th>
					<th>회원 아이디</th>
					<th>회원 이름</th>
					<th>회원 닉네임</th>
					<th>나이</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>주소</th>
					<th>가입일</th>
					<th>가입 허가</th>
					<th>신청 반려</th>
				</tr>
			</table>
			<!-- 혜진_200630_더보기 버튼 추가 -->
			<button class="more-btn" currentCount="0" totalCount=""
				value="">더 보 기</button>
		</div>
	</div>

	<script>
		//혜진_200630_ajax로 DB에서 트레이너 데이터 불러오기
		function show_trainerlist(start, btnNum) {
			$(".more-btn").attr("currentCount", 0);
			var searchWord = $("#searchWord").val();
			var memberType = $("select[name=memberType]").val();
			var param = {
				searchWord : searchWord,
				memberType: memberType,
				start: start
			};
			$
					.ajax({
						url : "/trainerlist.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							//혜진_200701_검색 클릭 시에만 초기화 설정
							if(btnNum==1){
								$(".contentsRow").html("");
								}
							var html = "";
							for (var i = 0; i < data.list.length; i++) {
								html += "<tr class='contentsRow'>"
								html += "<td id='cnt'>" + (i + 1) + "</td>";
								if (data.list[i].memberProfile == " ") {
									html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
								} else {
									html += "<td><img src='/resources/profile/"+data.list[i].memberProfile+"' class='small-img'></td>";
								}
								html += "<td id='memberId'>" + data.list[i].memberId + "</td>";
								html += "<td>" + data.list[i].memberName + "</td>";
								html += "<td>" + data.list[i].memberNick + "</td>";
								html += "<td>" + data.list[i].age + "</td>";
								html += "<td>" + data.list[i].phone + "</td>";
								html += "<td>" + data.list[i].email + "</td>";
								html += "<td>" + data.list[i].roadAddr + data.list[i].detAddr + "</td>";
								html += "<td>" + data.list[i].enrollDate + "</td>";
								if(data.list[i].memberLevel==2){
									html += "<td><input type='button' value='승 인' onclick='approve(this);'></td>";
								} else{
									html+= "<td>승인</td>"
								}
								if(data.list[i].memberLevel==2){
									html += "<td><input type='button' value='삭 제' onclick='reject(this)'></td>";
								} else{
									html+= "<td>-</td>"
								}
								html += "</tr>"
							}
							$("table").children("tbody").append(html);
							//혜진_200630_더보기 버튼에 현재 count 정보와 데이터 길이 저장
							$(".more-btn").val(Number(start) + 5);
							$(".more-btn").attr("currentCount", Number($(".more-btn").attr("currentCount"))+ data.list.length);
							var totalCount = data.totalCount;
							$(".more-btn").attr("totalCount",totalCount);
							var currentCount = $(".more-btn").attr("currentCount");
							if (totalCount%5 == currentCount) {
								$(".more-btn").attr("disabled", true);
								$(".more-btn").css("cursor", "not-allowed");
							}else{
								$(".more-btn").attr("disabled", false);
								$(".more-btn").css("cursor", "pointer");
							}
						},
						error : function() {
							console.log("데이터 불러오기 실패.")
						}
					});
		}
		
		//혜진_200630_페이지를 로드 하자마자 list 보여주기
		$(function() {
			show_trainerlist(1,1);
				$(".more-btn").click(function() {
					var val = $(this).val();
					show_trainerlist(val,2);
				});
		});

		//혜진_200630_승인 버튼 클릭 시 회원 타입 변경
		function approve(obj){
			var memberId = $(obj).parent().parent().children().eq(2).html();
			$.ajax({
				url: "/approveTrainer.do",
				type : "post",
				data : {memberId: memberId},
				success: function(data){
					alert(data);
				},
				error: function(data){
					console.log("데이터 처리 실패");
				}
			});
			location.reload(true);
		}
		
		//혜진_200630_승인 버튼 클릭 시 회원 삭제
		function reject(obj){
			var memberId = $(obj).parent().parent().children().eq(2).html();
			$.ajax({
				url: "/rejectTrainer.do",
				type : "post",
				data : {memberId: memberId},
				success: function(data){
					alert(data);
				},
				error: function(data){
					console.log("데이터 처리 실패");
				}
			});
			location.reload(true);
		}
		
	</script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js"></script>
</body> 
</html>