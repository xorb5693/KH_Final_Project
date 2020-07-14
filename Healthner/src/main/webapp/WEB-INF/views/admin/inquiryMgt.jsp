<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 예약 목록 관리</title>
  	<link rel="icon" href="/resources/images/favicon.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/admin/css/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat+Subrayada&display=swap" rel="stylesheet">
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
	height: 35px;
	margin-top: 5px;
	margin-right: 10px;
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
select[name=responseFin]{
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
</style>
  <body>
	<!-- 혜진_200624_메뉴바 삽입 -->
 	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

    <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
       <b><h4 style="font-family: 'Montserrat Subrayada', sans-serif; margin-bottom:60px; margin-top:20px;">Inquiry Management</h4></b>
       <div id="boxforselect">
      <input type="checkbox" name="selectAll">&nbsp;&nbsp;&nbsp;<span>전체 선택</span>
       </div>
       <div id="searchBox">
       <span onclick="recent();" style="cursor:pointer;">최근 등록 순</span><span>|</span><span onclick="oldest();" style="cursor:pointer;">가장 오래된 순</span>
       <select name="responseFin" style="padding-left:5px;">
			<option value=0>선택</option>
			<option value=1>완료</option>
			<option value=2>미완료</option>
		</select>
		<input type="button" value="검  색" class="admin-btn" id="admin-search"
				onclick="show_meetinglist(1,1,0);">
		<input type="button" value="삭  제" class="admin-btn" onclick="deletelist();">
		</div>
       <table style="width:100%;">
     	  <tr>
       		<th>선택</th>
       		<th>No</th>
       		<th>이름</th>
       		<th>전화번호</th>
       		<th>이메일 주소</th>
       		<th>BMI</th>
       		<th>응답완료</th>
       	</tr>
       </table>
       <button class="more-btn" currentCount="0" totalCount="" value="">더
				보 기</button>
      </div>
      <script>
		//혜진_200709_ajax로 DB에서 예약목록 데이터 불러오기
		function recent(){
			show_meetinglist(1,1,0);
		}
		function oldest(){
			show_meetinglist(1,1,1);
		}
		function show_meetinglist(start, btnNum, sorting) {
			$(".more-btn").attr("currentCount", 0);
			var responseFin = $("select[name=responseFin]").val();
			var param = {
				responseFin : responseFin,
				start: start,
				sorting:sorting
			};
			$.ajax({
						url : "/healthner/admin/meetinglist.do",
						type : "post",
						data : param,
						dataType : "json",
						success : function(data) {
							if (btnNum == 1) {
								$(".contentsRow").html("");
							}
							var html = "";
							for (var i = 0; i < data.listms.length; i++) {
								html += "<tr class='contentsRow'>";
								html += "<td id='selectAll'><input type='checkbox' name='reportSelectAll'>"
								html += "<input type='hidden' value="+data.listms[i].meetingSeq+" id='meetingSeq'>"
										+ "</td>";
								html += "<td>" + data.listms[i].rnum + "</td>";
								html += "<td>" + data.listms[i].name+ "</td>";
								html += "<td>"+data.listms[i].phone+"</td>";
								html += "<td>"+data.listms[i].email+"</td>";
								if(data.listms[i].bmi==0){
									html += "<td>0.00</td>";
								}else{
									html += "<td>"+data.listms[i].bmi+"</td>";
								}
								if(data.listms[i].responseFin!=1){
									html += "<td><input type='button' value='완 료' class='finish-btn' onclick='finResponse(this);'></td>";
								}else{
									html += "<td>완 료</td>";
								}
								
								html += "</tr>";
							}
							$("table").children("tbody").append(html);
							$(".more-btn").val(Number(start) + 10);
							$(".more-btn").attr(
									"currentCount",
									Number($(".more-btn").attr("currentCount"))
											+ data.listms.length);
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

		//혜진_200709_페이지 로드 시, 데이터 조회, 더보기 버튼
		$(function() {
			show_meetinglist(1, 1, 0);
			$(".more-btn").click(function() {
				var val = $(this).val();
				show_meetinglist(val, 2,0);
			});
		});

		//혜진_200709_전체 선택 클릭 시, 전체 체크 박스 선택
		$(function() {
			$("input[name='selectAll']").click(function() {
				if ($("input[name='selectAll']").prop("checked")) {
					$("input[name='reportSelectAll']").prop("checked", true);
				} else {
					$("input[name='reportSelectAll']").prop("checked", false);
				}
			});
		});
		
		//혜진_200710_완료 클릭 시, 응답 완료 상태로 변경
		function finResponse(obj){
			if(confirm("해당 예약을 응답 완료 상태로 변경하시겠습니까?")){
			var meetingSeq = $(obj).parent().parent().children().eq(0).children().eq(1).val();
			console.log(meetingSeq);
			var responseFin = 1;
			var param = {meetingSeq: meetingSeq, responseFin: responseFin}
			$.ajax({
				url: "/healthner/admin/finResponse.do",
				data: param,
				Type: "post",
				dataType: "json",
				success: function(data){
					alert("변경이 완료되었습니다.");
					location.reload();
				}
			});
			}
		}
		
		//혜진_200710_선택하여 삭제 버튼 클릭 시, 다중 삭제
		function deletelist(){
			var meetingSeqArr = [];
			$("input[name='reportSelectAll']:checked").each(function() {
				meetingSeq = $(this).parent().parent().children().eq(0).children().eq(1).val();
				meetingSeqArr.push(meetingSeq);
			});
			if (meetingSeqArr == '') {
				alert("삭제할 대상을 선택하세요.");
				return false;
			}
			if (confirm("정보를 삭제 하시겠습니까?")) {
				 jQuery.ajaxSettings.traditional = true;
				$.ajax({
					url : "/healthner/admin/deleteMeeting.do",
					type : "post",
					data : {meetingSeqArr: meetingSeqArr},
					dataType : "json",
					success : function(data) {
						alert("삭제되었습니다.");
						location.reload();
					}
				});
			}
		}
		
		//
		function recent(){
			show_meetinglist(1, 1, 0);
		}
		function oldest(){
			show_meetinglist(1, 1, 1);
		}
      </script>
      
      
      
      	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js">
		
	</script>
  </body>    
</html>