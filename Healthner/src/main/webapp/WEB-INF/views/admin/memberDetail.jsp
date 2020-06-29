<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리 - 회원 상세보기</title>
<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.small-img{
	width: 100px;
}
</style>
</head>
<body>
<script>
//혜진_200629_페이지 로드하자마자 회원 아이디로 회원 정보를 검색하여 table에 반환
	$(function(){
		memberDetail();
	});
	
	function memberDetail(){
		var memberId = $("#memberId").html();
		var param = {memberId: memberId}
		$.ajax({
			url : "/oneMemberSearch.do",
			type : "post",
			data : param,
			dataType : "json",
			success : function(data) {
				$("#memberName").html(data.memberName);
				$("#memberNick").html(data.memberNick);
				$("#expireDate").html(data.expireDate);
				$("#phone").html(data.phone);
				$("#email").html(data.email);
				$("#card").html(data.card);
				if(data.profile ==null){
					$("#profile").html("<img src='/resources/profile/noprofile.png' class='small-img'>");
				}else{
					$("#profile").html("<img src='/resources/profile/'"+data.profile+"class='small-img'>");
				}
			},
			error : function() {
				console.log("데이터 불러오기 실패.")
			}
		});
	}
</script>
	<h5>회원 정보 상세 보기</h5>
	<table border="1">
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
			<td id="expireDate"></td>
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
			<td colspan="2" id="card"></td>
			<td><input type="button" value="삭  제"></td>
		</tr>
	</table>
	<button >저  장</button>
	<button>닫  기</button>
		
</body>
</html>