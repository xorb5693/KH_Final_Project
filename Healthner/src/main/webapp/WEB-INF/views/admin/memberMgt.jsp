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
body {
	font-family: 'Nanum Gothic', sans-serif;
}

.admin-btn {
	font-family: 'Nanum Gothic', sans-serif;
}

table tr:hover {
	border: 1px solid red;
	cursor: pointer;
}

.small-img {
	margin: 0 auto;
	width: 70px;
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
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_memberlist(1);">
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
			<!-- 혜진_200629_더보기 버튼 추가 -->
			<button class="more-btn" currentCount="0" totalCount=""
				value="">더 보 기</button>
		</div>
	</div>

	<script>
		//혜진_200624_ajax로 DB에서 회원 데이터 불러오기
		function show_memberlist(start) {
			$(".more-btn").attr("currentCount", 0);
			var searchWord = $("#searchWord").val();
			if ($("input[name=expire]").prop("checked")) {
				var checkbox1 = 1;
			} else {
				var checkbox1 = 0;
			}
			if ($("input[name=card]").prop("checked")) {
				var checkbox2 = 1;
			} else {
				var checkbox2 = 0;
			}
			var param = {
				searchWord : searchWord,
				checkbox1 : checkbox1,
				checkbox2 : checkbox2,
				start : start
			};
			$
					.ajax({
						url : "/memberList.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							$(".contentsRow").html("");
							var html = "";
							for (var i = 0; i < data.list.length; i++) {
								html += "<tr class='contentsRow' onclick='addCard(this);'>"
								html += "<td id='cnt'>" + (i + 1) + "</td>";
								if (data.list[i].memberProfile == " ") {
									html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
								} else {
									html += "<td><img src='/resources/profile/"+data.list[i].memberProfile+"' class='small-img'></td>";
								}
								html += "<td>" + data.list[i].memberId + "</td>";
								html += "<td>" + data.list[i].memberName + "</td>";
								html += "<td>" + data.list[i].memberNick + "</td>";
								if (data.list[i].expireDate != " ") {
									html += "<td>" + data.list[i].expireDate
											+ "</td>";
								} else {
									html += "<td></td>";
								}
								if (data.list[i].card != " ") {
									html += "<td>" + data.list[i].card + "</td>";
								} else {
									html += "<td></td>";
								}
								html += "</tr>"
							}
							$("table").children("tbody").append(html);
							//혜진_200629_더보기 버튼에 현재 count 정보와 데이터 길이 저장
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
		
		//혜진_200626_페이지를 로드 하자마자 list 보여주기
		$(function() {
			show_memberlist(1);
				$(".more-btn").click(function() {
					var val = $(this).val();
					show_memberlist(val);
				});
		});

		//혜진_200626_회원 줄을 클릭하면 상세보기 페이지로 이동
		function addCard(obj) {
			var memberId = $(obj).children().eq(2).html();
			var url = "/addCard.do?memberId=" + memberId;
			var option = "width = 500, height = 500, top = 100, left = 200, location = no";
			window.open(url, null, option);
		}
	</script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js"></script>
</body>
</html>