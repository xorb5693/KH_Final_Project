<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 신고 관리</title>
  	<link rel="icon" href="/resources/images/favicon.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
			<span>전체 선택</span><input type="checkbox" name="selectAll">
			<select name="writeType">
				<option value=0>게시물 종류</option>
				<option value=1>게시글</option>
				<option value=2>댓글</option>
			</select>
			<select name="reportCat">
				<option value=0>신고 사유</option>
				<option value=1>욕설</option>
				<option value=2>부적절한 내용</option>
				<option value=3>광고</option>
				<option value=4>기타</option>
			</select>
			<input type="text" id="searchWord" placeholder="게시글 제목을 입력하세요.">
			<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_reportlist(1,1);">
		</div>
		<div class="reportTb">
			<table border="1">
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
			<button class="more-btn" currentCount="0" totalCount=""
				value="">더 보 기</button>
			<!-- 혜진_200708_삭제 버튼 추가 -->
			<input type="button" class="admin-btn" value="삭  제">
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
				start: start
			};
			$.ajax({
				url : "/reportlist.do",
				type : "post",
				data : param,
				dataType : "json",
				success : function(data) {
					if(btnNum==1){
						$(".contentsRow").html("");
						}
					var html = "";
					for (var i = 0; i < data.listrp.length; i++) {
						html += "<tr class='contentsRow'>";
						html += "<td id='selectAll'><input type='checkbox' name='reportSelectAll'></td>";
						html += "<td>"+(i+1)+"</td>";
						html += "<td>"+data.listrp[i].reportedId+"</td>";
						html += "<td>"+data.listrp[i].reportedName+"</td>";
						if(data.listrp[i].writeType==1){
							html += "<td>게시판</td>";
							html += "<td>"+data.listrp[i].boardTitle+"</td>";
						}else if(data.listrp[i].writeType==2){
							html += "<td>댓글</td>";
							html += "<td>"+data.listrp[i].commentContent+"</td>";
						}
						html += "<td>"+data.listrp[i].reportCnt+"</td>";
						html += "<td><input type='button' value='확 인' class='admin-btn'></td>";
						html += "</tr>";
					}
					$("table").children("tbody").append(html);
					//혜진_200630_더보기 버튼에 현재 count 정보와 데이터 길이 저장
					$(".more-btn").val(Number(start) + 5);
					$(".more-btn").attr("currentCount", Number($(".more-btn").attr("currentCount"))+ data.listrp.length);
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
		
		//혜진_200708_페이지 로드 시, 데이터 조회, 더보기 버튼
		$(function(){
			show_reportlist(1,1);
			$(".more-btn").click(function() {
				var val = $(this).val();
				show_reportlist(val,2);
			});
		});
		
		//혜진_200708_전체 선택 클릭 시, 전체 체크 박스 선택
		$(function(){
			$("input[name='selectAll']").click(function(){
				if($("input[name='selectAll']").prop("checked")){
					$("input[name='reportSelectAll']").prop("checked",true);
				}else{
					$("input[name='reportSelectAll']").prop("checked",false);
				}
			});
		});
	</script>
	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js"></script>
  </body>    
</html>