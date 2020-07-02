<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>관리자 페이지 - PT 관리</title>
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
	<!-- 혜진_200701_메뉴바 삽입 -->
	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5">
		<h6>PT MAPPING 관리</h6>
		<!-- 혜진_200701_MAPPING 검색 조회 box_회원/트레이너 검색, 아이디/이름/닉네임 입력, 이용권 미등록 찾기, PT잔여순 정렬, 검색버튼  -->
		<div class="search-box">
			<!-- (1) 아이디/이름/닉네임 입력 -->
			<input type="text" id="searchWord" placeholder="아이디/이름/닉네임을 입력하세요.">
			<!-- (2) 이용권 미등록 찾기, 카드키 미등록 -->
			PT 미등록 조회<input type="checkbox" value="expire" name="expire">
			PT 잔여순 정렬<input type="checkbox" value="card" name="card">
			<!-- (3)검색 버튼 -->
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_memberlist(1,1);">
			<!-- (4)추가 버튼: 팝업창 새로 열기 -->
			<input type="button" value="추  가" class="admin-btn" id="admin-add"
				onclick="window.open();">
		</div>
		<div class="mappingTB">
			<table border="1">
				<tr class="titleRow">
					<th>No</th>
					<th>트레이너 프로필</th>
					<th>트레이너 이름</th>
					<th>주특기 1</th>
					<th>주특기 2</th>
					<th>주특기 3</th>
					<th>No</th>
					<th>회원 프로필</th>
					<th>회원 이름</th>
					<th>이용권 만기일</th>
					<th>PT 잔여회차</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
			</table>
			<!-- 혜진_200701_더보기 버튼 추가 -->
			<button class="more-btn" currentCount="0" totalCount="" value="">더
				보 기</button>
		</div>
	</div>

	<script>
		//혜진_200701_ajax로 DB에서 회원 데이터 불러오기
		function show_memberlist(start, btnNum) {
			$(".more-btn").attr("currentCount", 0);
			var searchWord = $("#searchWord").val();
			if ($("input[name=expire]").prop("checked")) {
				var checkbox1 = 1;
			} else {
				var checkbox1 = 0;
			}
			if ($("input[name=pt]").prop("checked")) {
				var checkbox2 = 1;
			} else {
				var checkbox2 = 0;
			}
			var paramT = {
				searchWord : searchWord,
				start : start
			};
			var paramM = {
					searchWord : searchWord,
					checkbox1 : checkbox1,
					checkbox2 : checkbox2,
					start : start
				};
			$
					.ajax({
						url : "/ptTrainerList.do",
						type : "post",
						data : paramT,
						dataType : "json",
						success : function(data) {
							//혜진_200701_검색 클릭 시에만 초기화 설정
							if (btnNum == 1) {
								$(".contentsRow").html("");
							}
							//혜진_200702_트레이너 정보 아작스
							var html = "";
							for (var i = 0; i < data.list.length; i++) {
								html += "<tr class='contentsRow'>"
								html += "<td id='cnt'>" + (i + 1) + "</td>";
								if (data.list[i].memberProfile == " ") {
									html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
								} else {
									html += "<td><img src='/resources/profile/"+data.list[i].memberProfile+"' class='small-img'></td>";
								}
								html += "<td>" + data.list[i].memberName
										+ "</td>";
								html += "<td>" + data.list[i].catFirst
										+ "</td>";
								html += "<td>" + data.list[i].catSecond
										+ "</td>";
								html += "<td class='groupLine'>" + data.list[i].catThird
										+ "</td>";
							}
							$("table").children("tbody").append(html);
						},
						error : function() {
							console.log("데이터 불러오기 실패.")
						}
					});
			$
					.ajax({
						url : "/ptMemberList.do",
						type : "post",
						data : paramM,
						dataType : "json",
						success : function(data) {
							//혜진_200701_검색 클릭 시에만 초기화 설정
							if (btnNum == 1) {
								$(".contentsRow").html("");
							}
							//혜진_200702_회원 정보 아작스
							var html = "";
							for (var i = 0; i < data.list.length; i++) {
								html += "<td id='cnt'>" + (i + 1) + "</td>";
								if (data.list[i].memberProfile == " ") {
									html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
								} else {
									html += "<td><img src='/resources/profile/"+data.list[i].memberProfile+"' class='small-img'></td>";
								}
								html += "<td>" + data.list[i].memberName
										+ "</td>";
								html += "<td>" + data.list[i].expireDate+ "</td>";
								html += "<td>" + data.list[i].training_maxcnt
										- data.list[i].training_cnt + "</td>";
								html += "<td><input type='button' value='수 정' onclick='modifyPT(this);'></td>";
								html += "<td><input type='button' value='삭 제' onclick='deletePT(this);'></td>";
								html += "</tr>"
							}
							$(".groupLine").append(html);
							//혜진_200629_더보기 버튼에 현재 count 정보와 데이터 길이 저장
							$(".more-btn").val(Number(start) + 5);
							$(".more-btn").attr(
									"currentCount",
									Number($(".more-btn").attr("currentCount"))
											+ data.list.length);
							var totalCount = data.totalCount;
							$(".more-btn").attr("totalCount", totalCount);
							var currentCount = $(".more-btn").attr(
									"currentCount");
							if (totalCount % 5 == currentCount) {
								$(".more-btn").attr("disabled", true);
								$(".more-btn").css("cursor", "not-allowed");
							} else {
								$(".more-btn").attr("disabled", false);
								$(".more-btn").css("cursor", "pointer");
							}
						},
						error : function() {
							console.log("데이터 불러오기 실패.")
						}
					});
		}

		//혜진_200701_페이지를 로드 하자마자 list 보여주기
		$(function() {
			show_memberlist(1, 1);
			$(".more-btn").click(function() {
				var val = $(this).val();
				show_memberlist(val, 2);
			});
		});
	</script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js"></script>
</body>
</html>