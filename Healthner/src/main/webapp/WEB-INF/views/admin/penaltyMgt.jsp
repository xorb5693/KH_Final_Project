<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
<head>
<title>관리자 페이지 - 회원 정지 관리</title>
<link rel="icon" href="/resources/images/favicon.png">
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
	<link
	href="https://fonts.googleapis.com/css2?family=Montserrat+Subrayada&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/admin/css/style.css">
</head>
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
	height: 50px;
}

body {
	font-family: 'Nanum Gothic', sans-serif;
}

.small-img {
	margin: 0 auto;
	width: 70px;
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
	margin: 5px;
	margin-bottom:20px;
	border-radius: 5px;
}

.admin-btn:hover {
	color: #fff;
	background-color: #33290e;
	border-color: #33290e;
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
#profile {
	width: 75px;
}

.search-box {
	width: 100%;
	margin: 0 auto;
	margin-bottom: 20px;
}
#searchWord{
	width: 300px;
	height: 37px;
	margin-top: 5px;
	margin-right: 10px;
	border: 0.5px solid gray;
	border-radius: 5px;
}
.right-searchbox{
	float:right;
}
.checkbox-span{
	font-size: 1.1em;
}
.finish-btn:hover{
background-color: #33290e;
color:#fff;
border: 1px solid transparent;
}
.finish-btn{
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
#searchBox{
	float: right;
}
select[name=memberType]{
	margin-top: 6;
    line-height: 40px;
    height: 38;
    margin-right: 8;
    width: 100;
    border: 0.5px solid gray;
    border-radius: 5px;
}
span{
	font-size: 1.2em;
	margin-right: 10px;
}
#boxforselect{
	margin-top:10px;
	display: inline-block;
	margin-left: 32;
}
h4{
	text-align:center;
}
.blockDisable{
	background-color: #e3e1de;
	cursor: not-allowed;
}

</style>
<body>
	<!-- 혜진_200624_메뉴바 삽입 -->
	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5">
		<b><h4 style="font-family: 'Montserrat Subrayada', sans-serif; margin-bottom: 60px; margin-top: 20px;">
		Penalty by report</h4></b>
		<div id="boxforselect">
		<input type="checkbox" name="selectAll">&nbsp;&nbsp;&nbsp;<span>전체 선택</span></div>
		<div id="searchBox">
			<span onclick="reportCnt();" style="cursor: pointer;">신고 많은 순</span>
			<select name="memberType">
				<option value=0>회원 타입</option>
				<option value=3>트레이너</option>
				<option value=1>회원</option>
			</select> <input type="text" id="searchWord" placeholder="아이디/이름을 입력하세요.">
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_penaltylist(1,1,0);">
		</div>
		<div>
			<table style="width: 100%;">
				<tr>
					<th>선택</th>
					<th>No</th>
					<th>회원 아이디</th>
					<th>회원 닉네임</th>
					<th>회원 타입</th>
					<th>신고 게시글 수</th>
					<th>신고 댓글 수</th>
					<th>누적 신고 수</th>
				</tr>
			</table>
			<button class="more-btn" currentCount="0" totalCount="" value="">더
				보 기</button>
		</div>
		<div class="bottom-btn-box">
		<input type="button" value="권한정지" class="bottom-btn"
			onclick="givePenalty();"> <input type="button"
			value="삭     제" class="bottom-btn" onclick="deletelist();">
			</div>
	</div>
	<script>
		//혜진_200710_ajax로 DB에서 신고받은 회원 데이터 불러오기
		function reportCnt() {
			show_penaltylist(1, 1, 1);
		}
		function show_penaltylist(start, btnNum, sorting) {
			$(".more-btn").attr("currentCount", 0);
			var memberType = $("select[name=memberType]").val();
			var searchWord = $("#searchWord").val();
			var param = {
				memberType : memberType,
				start : start,
				sorting : sorting,
				searchWord : searchWord
			};
			$
					.ajax({
						url : "/healthner/admin/penaltylist.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							if (btnNum == 1) {
								$(".contentsRow").html("");
							}
							var html = "";
							for (var i = 0; i < data.listrp.length; i++) {
								
								if(data.listrp[i].inBanListCheck!=1){
									html += "<tr class='contentsRow'>";
									html += "<td id='selectAll'>"
									html += "<input type='checkbox' name='reportSelectAll'>"
								}else{
									html += "<tr class='contentsRow blockDisable'>";
									html += "<td id='selectAll'>"
								}
								html += "<input type='hidden' value="+data.listrp[i].reportedNo+" id='reportedNo'>"
										+ "</td>";
								html += "<td>" + data.listrp[i].rnum + "</td>";
								html += "<td>" + data.listrp[i].reportedId
										+ "</td>";
								html += "<td>" + data.listrp[i].reportedName
										+ "</td>";
								if (data.listrp[i].memberType == 1) {
									html += "<td>회원</td>";
								} else if (data.listrp[i].memberType == 2) {
									html += "<td>트레이너</td>";
								}
								html += "<td>" + data.listrp[i].boardCnt
										+ "</td>";
								html += "<td>" + data.listrp[i].commentCnt
										+ "</td>";
								html += "<td>" + data.listrp[i].totalReportRec
										+ "</td>";
								html += "</tr>";
							}
							$("table").children("tbody").append(html);
							$(".more-btn").val(Number(start) + 10);
							$(".more-btn").attr(
									"currentCount",
									Number($(".more-btn").attr("currentCount"))
											+ data.listrp.length);
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

		//혜진_200710_페이지 로드 시, 데이터 조회, 더보기 버튼
		$(function() {
			show_penaltylist(1, 1, 0);
			$(".more-btn").click(function() {
				var val = $(this).val();
				show_penaltylist(val, 2, 0);
			});
		});

		//혜진_200710_전체 선택 클릭 시, 전체 체크 박스 선택
		$(function() {
			$("input[name='selectAll']").click(function() {
				if ($("input[name='selectAll']").prop("checked")) {
					$("input[name='reportSelectAll']").prop("checked", true);
				} else {
					$("input[name='reportSelectAll']").prop("checked", false);
				}
			});
		});

		//혜진_200710_선택하여 삭제 버튼 클릭 시, 다중 삭제
		function deletelist() {
			var penaltyArr = [];
			$("input[name='reportSelectAll']:checked").each(
					function() {
						penaltyNo = $(this).parent().parent().children().eq(0)
								.children().eq(1).val();
						penaltyArr.push(penaltyNo);
					});
			if (penaltyArr == '') {
				alert("삭제할 대상을 선택하세요.");
				return false;
			}
			if (confirm("정보를 삭제 하시겠습니까?")) {
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url : "/healthner/admin/deletePenalty.do",
					type : "post",
					data : {
						penaltyArr : penaltyArr
					},
					dataType : "json",
					success : function(data) {
						if (data > 0) {
							alert("삭제되었습니다.");
							location.reload();
						}
					}
				});
			}
		}

		//혜진_200710_선택하여 권한정지 버튼 클릭 시, 스케줄 적용하고 데이터 비활성화 처리
		function givePenalty() {
			var penaltyArr = [];
			$("input[name='reportSelectAll']:checked").each(
					function() {
						penaltyNo = $(this).parent().parent().children().eq(0)
								.children().eq(1).val();
						penaltyArr.push(penaltyNo);
					});
			if (penaltyArr == '') {
				alert("권한을 정지할 대상을 선택하세요.");
				return false;
			}
			if (confirm("선택한 회원의 권한을 정지 하시겠습니까?")) {
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url : "/healthner/admin/givePenalty.do",
					type : "post",
					data : {
						penaltyArr : penaltyArr
					},
					dataType : "json",
					success : function(data) {
						if (data > 0) {
							alert("권한이 정지되었습니다.");
							location.reload();
						}
					}
				});
			}
		}
	</script>



	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js"></script>
</body>
</html>