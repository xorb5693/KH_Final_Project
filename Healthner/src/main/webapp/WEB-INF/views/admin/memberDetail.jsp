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

                if (confirm(memberId + " 회원에 카드 번호 " + cardNo + "을(를) 등록하시겠습니까?")) {
                    $.ajax({
                        url: "/healthner/member/inserCard.do",
                        data: {memberId: memberId, card: cardNo},
                        type: "get",
                        success: function(data) {
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
	$(function(){
		memberDetail();
        connect();
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
                if (data.card == null) {
                    $("#card").next().children().prop("disabled", true);
                }
				if(data.profile ==null){
					$("#profile").html("<img src='/resources/profile/noprofile.png' class='small-img'>");
				}else{
					$("#profile").html("<img src='/resources/profile/'"+data.profile+"class='small-img'>");
				}
			},
			error : function() {
				console.log("데이터 불러오기 실패.");
			}
		});
	}
	
// 혜진_200630_저장 버튼 클릭 시 카드키 정보 수정 반영
	$(function(){
		$("input[type=submit]").click(function(){
			cardModify();
		});
	});
	
// 혜진_200630_카드키 정보 수정 ajax
	function cardModify(){
		var memberId = $("#memberId").html();
		var card = $("#card").val();
		var param = {memberId:memberId, card:card}
		$.ajax({
			url: "/cardModify.do",
			type: "post",
			data: param,
			success: function(data){
				$("#card").val(data);
				alert("성공");
			},
			error: function(data){
				consol.log("데이터 전송 실패")
			}
		});
	}
// 혜진_200630_삭제 버튼 클릭 시 카드키 창 내용 삭제
//태규_200702_삭제 버튼 클릭 시 confirm 메세지 후 확인 버튼 클릭시 DB에서 카드 정보 삭제
	function inputDelete(){
        
        var memberId = $("#memberId").html();
        if (confirm(memberId + "의 카드를 삭제하시겠습니까?")) {
        
            $.ajax({
                url: "/healthner/member/deleteCard.do",
                type: "get",
                data: {memberId: memberId},
                success: function(data) {

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
	
</script>
	<h5>회원 정보 상세 보기</h5>
<!-- 혜진_200630_삭제 버튼, 저장 버튼 클릭 시 카드키 정보 수정 -->
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
			<td><input type="reset" value="삭  제" onclick="inputDelete();"class="pop-up-btn"></td>
		</tr>
	</table>
<!-- 태규_200702_저장버튼 삭제 -->
<!-- 혜진_200630_닫기 버튼 기능 활성화 -->
<!-- 혜진_200101_부모창 새로고침 기능 추가 -->
	<input type="button" value="닫  기" onclick = "window.close(); opener.parent.location.reload();" class="pop-up-btn">
		
</body>
</html>