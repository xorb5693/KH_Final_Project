<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<title>관리자 페이지 - PT 관리</title>
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
		<!-- 혜진_200701_MAPPING 검색 조회 box_회원/트레이너 검색, 아이디/이름/닉네임 입력, PT잔여순 정렬, 검색버튼  -->
		<div class="search-box">
			<select name="memberType">
				<option value="3">트레이너</option>
				<option value="1">회원</option>
			</select>
			<!-- (1) 이름 입력 -->
			<input type="text" id="searchWord" placeholder="검색할 이름을 입력하세요.">
			<!-- (2) 잔여순 정렬 -->
			PT 잔여순 정렬<input type="checkbox" value="ptleft" name="ptleft">
			<!-- (3)검색 버튼 -->
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_memberlist(1,1);">
			<!-- (4)추가 버튼-->
			<input type="button" value="추  가" class="admin-btn" id="admin-add">
		</div>
		<div class="mappingTB">
			<table border="1" id="mappingPTtable">
				<tr class="titleRow">
					<th>No</th>
					<th>트레이너 프로필</th>
					<th>트레이너 이름</th>
					<th>주특기 1</th>
					<th>주특기 2</th>
					<th>주특기 3</th>
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
			var memberType = $("select[name=memberType]").val();
			if ($("input[name=ptleft]").prop("checked")) {
				var checkbox1 = 1;
			} else {
				var checkbox1 = 0;
			}
			var param = {
				searchWord : searchWord,
				memberType : memberType,
				checkbox1 : checkbox1,
				start : start
			};
			$
					.ajax({
						url : "/ptTrainerList.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							//혜진_200701_검색 클릭 시에만 초기화 설정
							if (btnNum == 1) {
								$(".contentsRow").html("");
							}
							//혜진_200703_트레이너 정보 아작스
							var html = "";
							//(1) 트레이너 정보 출력
							for (var i = 0; i < data.listpt.length; i++) {
								html += "<tr class='contentsRow'>"
								html += "<td id='cnt'>" + (i + 1) + "</td>";
								if (data.listpt[i].trainerProfile == " ") {
									html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
								} else {
									html += "<td><img src='/resources/profile/"+data.listpt[i].trainerProfile+"' class='small-img'></td>";
								}
								html += "<td>" + data.listpt[i].trainerName
										+ "</td>";
								html += "<td>" + data.listpt[i].catFirst
										+ "</td>";
								html += "<td>" + data.listpt[i].catSecond
										+ "</td>";
								html += "<td>" + data.listpt[i].catThird
										+ "</td>";
								//(2) 회원 정보 출력
								if (data.listpt[i].memberProfile == " ") {
									html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
								} else {
									html += "<td><img src='/resources/profile/"+data.listpt[i].memberProfile+"' class='small-img'></td>";
								}
								html += "<td>" + data.listpt[i].memberName
										+ "</td>";
								html += "<td>" + data.listpt[i].expireDate
										+ "</td>";
								html += "<td>" + data.listpt[i].trainingLeft
										+ "</td>";
								html += "<td><input type='button' class='admin-btn' value='수 정' onclick='modifyPT(this.id);' id='"
										+ data.listpt[i].mappingSeq + "'></td>";
								html += "<td><input type='button' class='admin-btn' value='삭 제' onclick='deletePT(this.id);' id='"
										+ data.listpt[i].mappingSeq + "'></td>";
								html += "</tr>"
							}
							$("#mappingPTtable").children("tbody").append(html);
							//혜진_200629_더보기 버튼에 현재 count 정보와 데이터 길이 저장
							$(".more-btn").val(Number(start) + 5);
							$(".more-btn").attr(
									"currentCount",
									Number($(".more-btn").attr("currentCount"))
											+ data.listpt.length);
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

		//혜진_200706_삭제 누르면 컨펌창으로 확인 받고 삭제처리
		function deletePT(mpSeq) {
			confirm("해당 데이터를 삭제하시겠습니까?");
			$.ajax({
				url : '/mappingDelete.do',
				type : "post",
				data : {
					mpSeq : mpSeq
				},
				dataType : "json",
				success : function(data) {
					if (data > 0) {
						window.location.reload();
					}
				}
			});
		}
		
		function modifyPT(mpSeq){
			$("#modal").show(mpSeq);
			$.ajax({
				url : '/mappingCheck.do',
				type : "post",
				data : {
					mpSeq : mpSeq
				},
				dataType : "json",
				success : function(data) {
						$("#fixMember").children("span").html(data.memberName);
						$("#fixMember").children("input").val(data.memberNo);
						$("#fixTrainer").children("span").html(data.trainerName);
						$("#fixTrainer").children("input").val(data.trainerNo);
						$("#PTmax").val(data.PTmax);
						$("#PTleft").val(data.PTleft);
				}
			});
		}
	</script>

	<!-- 혜진_200703_모달창 띄우기 -->
	<style>
/* The Modal (background) */
.searchModal {
	display: none;
	position: fixed;
	z-index: 10;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0, 0, 0);
	background-color: rgba(0, 0, 0, 0.4);
}
/* Modal Content/Box */
.search-modal-content {
	border-radius: 10px;
	background-color: #fefefe;
	margin: 0 auto;
	margin-top: 30px;
	padding: 20px;
	border: 1px solid #888;
	width: 60%; /* Could be more or less, depending on screen size */
	height: 500px;
}

#memberInfo-box {
	width: 100%;
	height: 300px;
	border: 1px solid black;
}

table {
	width: 100%;
}

#memberInfo tr:hover {
	border: 1px solid red;
	cursor: pointer;
}
</style>
	<!--모달창 본문-->
	<div id="modal" class="searchModal">
		<div class="search-modal-content">
			<div class="searchbar">
				<select name="modal-memberType">
					<option value=1>회원</option>
					<option value=3>트레이너</option>
				</select> <input type="text" placeholder="아이디/이름 입력" name="searchWord">
				<input type="button" class="admin-btn" id="modal-search" value="검색">
			</div>
			<div id="memberInfo-box">
				<table id="memberInfo" border="1">
					<tr>
						<th>No</th>
						<th>프로필</th>
						<th>아이디</th>
						<th>이름</th>
						<th>나이</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>주소</th>
					</tr>
				</table>
			</div>
			<table id="memberChoose" border="1">
				<tr>
					<th>회원 이름</th>
					<th>트레이너 이름</th>
					<th>PT 최대 횟수</th>
					<th>PT 잔여 횟수</th>
				</tr>
				<tr>
					<td id="fixMember" ondblclick="outputMember(this);"><input
						type="hidden" value="" id="fixMemberNo"><span></span></td>
					<td id="fixTrainer" ondblclick="outputMember(this);"><input
						type="hidden" value="" id="fixTrainerNo"><span></span></td>
					<td><input type="text" id="PTmax" placeholder=0 value=""
						style="text-align: right;"></td>
					<td><input type="text" id="PTleft" placeholder=0 value=""
						style="text-align: right;"></td>
				</tr>
			</table>
			<input type="submit" class=admin-btn value="등 록"
				onclick="inputNewMapping();"> <input type="button"
				class="admin-btn" value="닫 기" onClick="closeModal();">
		</div>
	</div>
	<!-- 추가버튼 클릭 시, 모달창 켜기 -->
	<script>
		//(1) 모달창 켜기
		$(function() {
			$("#admin-add").click(function() {
				$("#fixMember").children("span").html("");
				$("#fixMember").children("input").val("");
				$("#fixTrainer").children("span").html("");
				$("#fixTrainer").children("input").val("");
				$("#PTmax").val("");
				$("#PTleft").val("");
				$("#modal").show();
			});
		});
		//(2) 모달창 끄기
		function closeModal() {
			$('.searchModal').hide();
		};
		//(3) 검색 클릭 - 검색어 없이 검색을 클릭하는 경우 경고, 검색어 있으면 검색을 처리
		$(function() {
			$("#modal-search")
					.click(
							function() {
								if ($("input[name=searchWord]").val() == "") {
									alert("검색할 회원 정보를 입력해주세요.");
								} else {
									var searchWord = $("input[name=searchWord]")
											.val();
									var memberType = $(
											"select[name=modal-memberType]")
											.val();
									var param = {
										searchWord : searchWord,
										memberType : memberType
									};
									$
											.ajax({
												url : '/mappingDetail.do',
												type : 'post',
												data : param,
												dataType : "json",
												success : function(data) {
													var html = "";
													$(".contentsRow").html("");
													for (var i = 0; i < data.list.length; i++) {
														html += "<tr class='contentsRow' ondblclick='inputMember(this);'>";
														html += "<td>"
																+ (i + 1)
																+ "</td>";
														if (data.list[i].memberProfile == " ") {
															html += "<td><img src='/resources/profile/noprofile.png' class='small-img'></td>";
														} else {
															html += "<td><img src='/resources/profile/"+data.list[i].memberProfile+"' class='small-img'></td>";
														}
														html += "<td>"
																+ data.list[i].memberId + "<input type='hidden' id='modal-memberNo' value='"+data.list[i].memberNo+"'>"
																+ "</td>";
														html += "<td>"
																+ data.list[i].memberName
																+ "</td>";
														html += "<td>"
																+ data.list[i].age
																+ "</td>";
														html += "<td>"
																+ data.list[i].phone
																+ "</td>";
														html += "<td>"
																+ data.list[i].email
																+ "</td>";
														html += "<td>"
																+ data.list[i].roadAddr
																+ data.list[i].detAddr
																+ "</td>";
														html += "</tr>";
													}
													$("#memberInfo").children(
															"tbody").append(
															html);
												},
												error : function() {
													console.log("데이터 전송 실패");
												}
											});
								}
							});
		});
		//(4) 더블 클릭 시 회원이름, 트레이너 이름 칸으로 값 전달
		function inputMember(obj) {
			var name = $(obj).children().eq(3).html();
			var memberNo = $(obj).children().eq(2).children("input").val();
			var memberType = $("select[name=modal-memberType]").val();
			if (memberType == 1) {
				$("#fixMember").children("span").html(name);
				$("#fixMember").children("input").val(
						memberNo);
			} else if (memberType == 3) {
				$("#fixTrainer").children("span").html(name);
				$("#fixTrainer").children("input").val(
						memberNo);
			}
		}
		//(5) 더블 클릭 시, 담긴 회원 이름과 트레이너 이름 각각 삭제
		function outputMember(obj) {
			$(obj).children("span").html("");
		}
		//(6) mapping을 등록/수정
		function inputNewMapping() {
			//0 이상,해당 테이블 공란 검사 추가할 것
			if ($("#PTmax").val() < $("#PTleft").val()) {
				alert("가능한 PT 최대 횟수보다 잔여 횟수가 많습니다.\n다시 입력해주세요.");
				$("#PTleft").val("");
			} else {
				confirm("매칭 정보를 등록하시겠습니까?");
				var PTmax = $("#PTmax").val();
				var PTleft = $("#PTleft").val();
				var memberNo = $("#fixMember").children("input").val();
				var trainerNo = $("#fixTrainer").children("input").val();
				console.log(PTmax, PTleft, memberNo, trainerNo);
				var param = {
					PTmax : PTmax,
					PTleft : PTleft,
					memberNo : memberNo,
					trainerNo : trainerNo
				};
				$.ajax({
					url : "/inputNewMapping.do",
					data : param,
					type : 'post',
					dataType : 'json',
					success : function(data) {
						if(data>0){
							closeModal();
							alert("입력이 완료되었습니다.");
							location.reload();
						}else{
							alert("실패하였습니다.\n다시 시도해주십시오.'");
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