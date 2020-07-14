<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 - 회원 상세보기</title>
<link rel="icon" href="/resources/images/favicon.png">
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat+Subrayada&display=swap"
	rel="stylesheet">
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
button {
	border: none;
	margin: 0 auto;
	width: 100%;
}

table {
	width: 100%;
	margin-bottom: 1rem;
	color: #212529;
}

table th, table td {
	padding: 0.5rem;
	border-top: 1px solid #dee2e6;
	text-align: center;
	width: 33%;
	height: 40px;
	font-size: 1.1em;
}
table th{
	border-right: 1px solid #dee2e6;
}
body {
	font-family: 'Nanum Gothic', sans-serif;
}

.contentsRow:hover {
	background-color: #fcd307;
	cursor: pointer;
}

.small-img {
	margin: 0 auto;
	width: 150px;
}

.admin-btn {
	width: 80px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #fff;
	border-weight: bold;
	background-color: #fcd307;
	border-color: #fcd307;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
	display: inline-block;
	float: right;
}

.admin-btn:hover {
	color: #fff;
	background-color: #6e6d6d;
	border-color: #6e6d6d;
}

#profile {
	width: 75px;
}

.search-box {
	width: 100%;
	margin: 0 auto;
	margin-bottom: 20px;
}

#searchWord {
	width: 300px;
	height: 35px;
	margin-top: 5px;
	margin-right: 10px;
}

.right-searchbox {
	float: right;
}

.checkbox-span {
	font-size: 1.1em;
}
.pop-up-btn{
	width: 100px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #fff;
	border-weight: bold;
	background-color: #fcd307;
	border-color: #fcd307;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
	display: inline-block;
	
}
.finish-btn:hover {
	background-color: #33290e;
	color: #fff;
	border: 1px solid transparent;
}

.finish-btn {
	width: 65px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #212529;
	border-weight: bold;
	background-color: #fff;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	user-select: none;
	border: 1px solid #212529;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
	display: inline-block;
}

.bottom-btn {
	width: 120px;
	font-family: 'Nanum Gothic', sans-serif;
	color: #fff;
	border-weight: bold;
	background-color: #fcd307;
	border-color: #fcd307;
	display: inline-block;
	font-weight: 400;
	text-align: center;
	vertical-align: middle;
	user-select: none;
	border: 1px solid transparent;
	padding: 0.375rem 0.75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
		border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
		-webkit-box-shadow 0.15s ease-in-out;
	display: inline-block;
	float: center;
	margin: 5px;
	margin-top: 120px;
	border-radius: 5px;
}

.bottom-btn:hover {
	color: #fff;
	background-color: #33290e;
	border-color: #33290e;
}

.bottom-btn-box{
	margin: 0 auto;
	text-align: center;
}
</style>
</head>
<body>
	<script>
		//웹소켓 설정
		var ws;

		function connect() {
			ws = new WebSocket("ws://192.168.10.25/card.do");
			ws.onopen = function() {
				console.log("웹소켓 연결 생성");
			};

			ws.onmessage = function(e) {

				var strArray = e.data.split('$');

				if (strArray[0] == "Insert") {
					var memberId = $("#memberId").html();
					var cardNo = strArray[1];

					if (confirm(memberId + " 회원에 카드 번호 " + cardNo
							+ "을(를) 등록하시겠습니까?")) {
						$.ajax({
							url : "/healthner/member/inserCard.do",
							data : {
								memberId : memberId,
								card : cardNo
							},
							type : "get",
							success : function(data) {
								if (data == "1") {
									alert("카드를 등록하였습니다.");
									window.location.reload();
									window.opener.location.reload();
								} else {
									alert("카드 등록에 실패하였습니다.");
								}
							}
						})
					}
				} else {
					alert(strArray[1]);
				}
			};

			ws.onclose = function() {
				console.log("연결종료");
			};
		}

		//혜진_200629_페이지 로드하자마자 회원 아이디로 회원 정보를 검색하여 table에 반환
		//태규_200702_페이지가 로드 되면 웹소켓 연결 시작
		$(function() {
			memberDetail();
			connect();
		});

		function memberDetail() {
			var memberId = $("#memberId").html();
			var param = {
				memberId : memberId
			}
			$
					.ajax({
						url : "/healthner/admin/oneMemberSearch.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							console.log(data);
							$("#memberName").html(data.memberName);
							$("#memberNick").html(data.memberNick);
							$("#expireDate").html(data.expireDate);
							$("#phone").html(data.phone);
							$("#email").html(data.email);
							$("#card").html(data.card);
							if (data.card == null) {
								$("#card").next().children().prop("disabled",
										true);
							}
							if (data.memberProfile == " ") {
								$("#profile")
										.html(
												"<img src='/resources/profile/noprofile.png' class='small-img'>");
							} else {
								$("#profile")
										.html(
												"<img src='/resources/profile/"
														+ data.memberProfile
														+ "' class='small-img' onerror='error(this);'>");
							}
						},
						error : function() {
							console.log("데이터 불러오기 실패.");
						}
					});
		}

		// 혜진_200630_저장 버튼 클릭 시 카드키 정보 수정 반영
		$(function() {
			$("input[type=submit]").click(function() {
				cardModify();
			});
		});

		// 혜진_200630_카드키 정보 수정 ajax
		function cardModify() {
			var memberId = $("#memberId").html();
			var card = $("#card").val();
			var param = {
				memberId : memberId,
				card : card
			}
			$.ajax({
				url : "/healthner/admin/cardModify.do",
				type : "post",
				data : param,
				success : function(data) {
					$("#card").val(data);
					alert("성공");
				},
				error : function(data) {
					consol.log("데이터 전송 실패")
				}
			});
		}
		// 혜진_200630_삭제 버튼 클릭 시 카드키 창 내용 삭제
		//태규_200702_삭제 버튼 클릭 시 confirm 메세지 후 확인 버튼 클릭시 DB에서 카드 정보 삭제
		function inputDelete() {

			var memberId = $("#memberId").html();
			if (confirm(memberId + "의 카드를 삭제하시겠습니까?")) {

				$.ajax({
					url : "/healthner/member/deleteCard.do",
					type : "get",
					data : {
						memberId : memberId
					},
					success : function(data) {

						if (data == "1") {
							alert("카드를 삭제하였습니다.");
							window.location.reload();
							window.opener.location.reload();
						} else {
							alert("카드 삭제에 실패하였습니다.");
						}
					}
				});
			}
		}

		//혜진_200713_사진 에러 시, 에러 화면 처리
		function error(obj) {
			$(obj).attr("src", "/resources/profile/imageError.jpg");
		}
	</script>
	<h5>회원 정보 상세 보기</h5>
	<!-- 혜진_200630_삭제 버튼, 저장 버튼 클릭 시 카드키 정보 수정 -->
	<table>
		<tr>
			<th colspan="2">프로필 이미지</th>
			<th>회원 아이디</th>
			<td id="memberId">${memberId }</td>
		</tr>
		<tr>
			<td colspan="2" rowspan="3" id="profile"></td>
			<th>회원 이름</th>
			<td id="memberName"></td>
		</tr>
		<tr>
			<th>회원 닉네임</th>
			<td id="memberNick"></td>
		</tr>
		<tr>
			<th>이용권 만료일</th>
			<td id="expireDate" style="width: 150px;"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td colspan="3" id="phone"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td colspan="3" id="email"></td>
		</tr>
		<tr>
			<th>카드키</th>
			<td id="card" style="width: 180px;" colspan="2"></td>
			<td><input type="reset" value="삭  제" onclick="inputDelete();"
				class="finish-btn"></td>
		</tr>
	</table>
	<!-- 태규_200702_저장버튼 삭제 -->
	<!-- 혜진_200630_닫기 버튼 기능 활성화 -->
	<!-- 혜진_200101_부모창 새로고침 기능 추가 -->
	<div class="bottom-btn-box">
	<input type="button" value="닫  기"
		onclick="window.close(); opener.parent.location.reload();"
		class="bottom-btn">
		</div>

</body>
</html>