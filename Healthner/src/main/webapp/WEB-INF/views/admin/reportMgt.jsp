<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
<head>
<title>관리자 페이지 - 신고 관리</title>
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
<body>
	<!-- 혜진_200624_메뉴바 삽입 -->
	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5">
		<h6>신고글 관리</h6>
		<div class="search-box">
			<!-- 혜진_200708_검색창 제작 -->
			<span>전체 선택</span><input type="checkbox" name="selectAll"> <select
				name="writeType">
				<option value=0>게시물 종류</option>
				<option value=1>게시글</option>
				<option value=2>댓글</option>
			</select> <select name="reportCat">
				<option value=0>신고 사유</option>
				<option value=1>욕설</option>
				<option value=2>부적절한 내용</option>
				<option value=3>광고</option>
				<option value=4>기타</option>
			</select> <input type="text" id="searchWord" placeholder="게시글 제목을 입력하세요.">
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_reportlist(1,1);">
			<!-- 혜진_200708_삭제 버튼 추가 -->
			<input type="button" class="admin-btn" value="글삭제"
				onclick="deleteAction();">
		</div>
		<div class="reportTb">
			<table border="1" id="parentTB">
				<tr class="titleRow">
					<th>선택</th>
					<th>No</th>
					<th>신고된 회원 아이디</th>
					<th>신고된 회원 닉네임</th>
					<th>게시물 타입</th>
					<th>게시글 제목/내용</th>
					<th>누적 신고 수</th>
					<th>내용 확인</th>
				</tr>
			</table>
			<!-- 혜진_200708_더보기 버튼 추가 -->
			<button class="more-btn" currentCount="0" totalCount="" value="">더
				보 기</button>
		</div>
	</div>
	<script>
		//혜진_200708_ajax로 DB에서 신고글 데이터 불러오기
		function show_reportlist(start, btnNum) {
			$(".more-btn").attr("currentCount", 0);
			var searchWord = $("#searchWord").val();
			var writeType = $("select[name=writeType]").val();
			var reportCat = $("select[name=reportCat]").val();
			var param = {
				searchWord : searchWord,
				writeType : writeType,
				reportCat : reportCat,
				start : start
			};
			$
					.ajax({
						url : "/healthner/admin/reportlist.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							if (btnNum == 1) {
								$(".contentsRow").html("");
							}
							var html = "";
							for (var i = 0; i < data.listrp.length; i++) {
								html += "<tr class='contentsRow'>";
								html += "<td id='selectAll'><input type='checkbox' name='reportSelectAll'>"
								html += "<input type='hidden' value="+data.listrp[i].writeType+" id='writeType'>";
								html += "<input type='hidden' value="+data.listrp[i].writeNo+" id='writeNo'>"
										+ "</td>";
								html += "<td>" + data.listrp[i].rnum + "</td>";
								html += "<td>" + data.listrp[i].reportedId
										+ "</td>";
								html += "<td>" + data.listrp[i].reportedName
										+ "</td>";
								if (data.listrp[i].writeType == 1) {
									html += "<td>게시판</td>";
									html += "<td>" + data.listrp[i].boardTitle
											+ "</td>";
								} else if (data.listrp[i].writeType == 2) {
									html += "<td>댓글</td>";
									html += "<td>"
											+ data.listrp[i].commentContent
											+ "</td>";
								}
								html += "<td>" + data.listrp[i].reportCnt
										+ "</td>";
								html += "<td><input type='button' value='확 인' class='admin-btn' onclick='openModal(this);'></td>";
								html += "</tr>";
							}
							$("#parentTB").children("tbody").append(html);
							//혜진_200630_더보기 버튼에 현재 count 정보와 데이터 길이 저장
							$(".more-btn").val(Number(start) + 5);
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

		//혜진_200708_페이지 로드 시, 데이터 조회, 더보기 버튼
		$(function() {
			show_reportlist(1, 1);
			$(".more-btn").click(function() {
				var val = $(this).val();
				show_reportlist(val, 2);
			});
		});

		//혜진_200708_전체 선택 클릭 시, 전체 체크 박스 선택
		$(function() {
			$("input[name='selectAll']").click(function() {
				if ($("input[name='selectAll']").prop("checked")) {
					$("input[name='reportSelectAll']").prop("checked", true);
				} else {
					$("input[name='reportSelectAll']").prop("checked", false);
				}
			});
		});

		//혜진_200709_삭제 버튼 클릭 시, 선택된 신고글 삭제
		function deleteAction() {
			var checkWriteType = "";
			var checkWriteNo = "";
			var writeType = [];
			var writeNo = [];
			$("input[name='reportSelectAll']:checked").each(function() {
				checkWriteType = $(this).parent().children().eq(1).val();
				checkWriteNo = $(this).parent().children().eq(2).val();
				writeType.push(checkWriteType);
				writeNo.push(checkWriteNo);
			});
			var param = {
				writeType : writeType,
				writeNo : writeNo
			};
			if (checkWriteType == '') {
				alert("삭제할 대상을 선택하세요.");
				return false;
			}
			if (confirm("정보를 삭제 하시겠습니까?")) {
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url : "/healthner/admin/deleteReport.do",
					type : "get",
					data : param,
					dataType : "json",
					success : function(data) {
						location.reload();
					}
				});
			}
		}
	</script>
	<!-- 혜진_200709_모달창 띄우기 -->
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
			신고 내용 상세 보기
			<div class="reportDetail-box">
				<table border="1" id="reportContent">
					<tr>
						<th>게시글 일부 내용</th>
					</tr>
				</table>
			</div>
			<div id="memberInfo-box">
				<table id="reportComment" border="1">
					<tr>
						<th>No</th>
						<th>신고한 회원 아이디</th>
						<th>신고 사유</th>
						<th>신고 상세 사유</th>
					</tr>
				</table>
			</div>
			<input type="button" class="admin-btn" value="닫 기"
				onClick="closeModal();">
		</div>
	</div>
	<!-- 추가버튼 클릭 시, 모달창 켜기 -->
	<script>
		//(1) 모달창 켜기
		function openModal(obj) {
			$("#modal").show();
			var writeType = $(obj).parent().parent().children().eq(0)
					.children().eq(1).val();
			var writeNo = $(obj).parent().parent().children().eq(0).children()
					.eq(2).val();
			var param = {
				writeType : writeType,
				writeNo : writeNo
			}
			//(1-1) 모달창 켜자마자, 정보 페이지 로드 - 신고당한 글의 contents
			$
					.ajax({
						url : "/healthner/admin/reportedDetail.do",
						data : param,
						type : "post",
						dataType : "json",
						success : function(data) {
							if ($("#contentBox").length != 1) {
								//신고글 상세(1==board, 2==comment)
								if (data.writeType == 1) {
									var htmlCt = "<tr id='contentBox'><td><textarea style='width:100%;'>"
											+ "[ "
											+ data.boardTitle
											+ " ]"
											+ "\n"
											+ data.boardContent
											+ "</textarea></td></tr>";
								} else if (data.writeType == 2) {
									var htmlCt = "<tr><td><textarea style='width:100%;'>"
											+ data.commentContent
											+ "</textarea></td></tr>";
								}
								$("#reportContent").children("tbody").append(
										htmlCt);
							}

						}
					});
			show_detailList(1,writeType, writeNo);
		}
		//(1-2) 신고한 사람 리스트 및 이유
		function show_detailList(start, writeType, writeNo) {
			var param = {
				writeType : writeType,
				writeNo : writeNo,
				start : start
			}
			console.log(param);
			//(1-1) 모달창 켜자마자, 정보 페이지 로드 - 신고당한 글의 contents
			$.ajax({
				url : "/healthner/admin/reportedDetailList.do",
				data : param,
				type : "post",
				dataType : "json",
				success : function(data) {
					//1) 초기화
					$(".contentsRow").html("");
					//2) 본문 - 리스트
					var html = "";
					console.log(data.listrp);
					for (var i = 0; i < data.listrp.length; i++) {
						html += "<tr class='contentsRow'><td>"
								+ data.listrp[i].rnum + "</td>";
						html += "<td>" + data.listrp[i].memberNick + "</td>";
						html += "<td>" + data.listrp[i].categoryName + "</td>";
						html += "<td>" + data.listrp[i].reportDetail + "</td>";
						html += "</tr>";
					}
					$("#reportComment").children("tbody").append(html);
					//3) 넘버링
					var numbering = "";
				}

			});
		}
		//(2) 모달창 끄기
		function closeModal() {
			$('.searchModal').hide();
		};
	</script>


	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js">
		
	</script>
</body>
</html>
