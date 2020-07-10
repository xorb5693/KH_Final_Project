<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<link rel="icon" href="/resources/images/favicon.png">
</head>
<body>
	<c:if test="${empty sessionScope.member}">
		<script>
			location.href = "/";
		</script>
	</c:if>
	<c:if test="${not empty requestScope.msg}">
		<script>
			var msg = "${requestScope.msg}";
			if(msg == "success"){
				alert("수정 성공");
			}else{
				alert("수정 실패");
			}
		</script>
	</c:if>
	<!-- 기존 해더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 트레이너 전용  -->
	<c:if
		test="${sessionScope.member.memberLevel eq 2 or sessionScope.member.memberLevel eq 3 }">
		<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp" />
	</c:if>
	<!-- 일반 회원 전용 -->
	<c:if test="${sessionScope.member.memberLevel eq 1 }">
		<jsp:include page="/WEB-INF/views/common/headerForMember.jsp" />
	</c:if>
	<!-- 관리자 전용 -->
	<c:if test="${sessionScope.member.memberLevel eq 4 }">
		<script>
			location.href = "/adminMain.do";
		</script>
	</c:if>


	<script>
		$(function(){
			$("#changePw").on('hidden.bs.modal', function(){
				$("#check").show();
				$("#change").hide();
			});
		});
		function quit(){
			if(confirm("회원탈퇴 하시겠습니까")){
				$.ajax({
					url: "/healthner/member/quit.do",
					method: "get",
					success: function(data){
						if(data=="success"){
							alert("다음에 또 뵐게요~");
						}else{
							alert("오류가 발생했습니다 관리자에게 문의 부탁드립니다");
						}
						location.href="/";
					}
				});
			}
		}
		function checkPw(){
			var memberPw = $("input[name=oldMemberPw]").val();
			var memberNo = $("#memberNo").val();
			$.ajax({
				url: "/healthner/member/checkPw.do",
				method: "post",
				data: {memberPw : memberPw,
						memberNo : memberNo},
				success: function(data){
					if(data=="1"){
						$("#check").hide();
						$("input[name=oldMemberPw]").val("");
						$("#change").show();
					}else{
						alert("비밀번호가 틀렸습니다");
					}
				}
			});
		}
		function myInfo(){
			location.href="/healthner/member/mypageFrm.do"
		}
		function changePw(){
			var regExp = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
			var memberPw = $("input[name=memberPw]");
			var chkPw = $("input[name=chkPw]");
			if(!regExp.test(memberPw.val())){
				memberPw.prev().html("영어 대/소문자 특수문자 8~16자리").attr('color','red');
			}else{
				memberPw.prev().html("");
				if(memberPw.val() != chkPw.val()){
					chkPw.prev().html("비밀번호가 동일하지 않습니다").attr("color","red");
					return false;
				}else{
					chkPw.prev().html("");
				}
			}
			return true;
		}
		function changeAddr(){
			location.href="/healthner/member/changeAddrFrm.do";
		}
		function changeMail(){}
		function purchaseLog(){}
		function purchaseMember(){
			location.href="/healthner/member/pricing.do";
		}
		function checkExpire(){}
	</script>
	<section>
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
					<div class="bordered" style="width: 300px;height: 300px;" >
						<a href="/healthner/member/changeProfilePic.do">
							<img src="/resources/profile/${sessionScope.member.memberProfile}" style="width: 300px; height: 300px;" onerror="this.src='/resources/profile/noprofile.png'">
						</a>
						<!-- background-image: url(/resources/profile/${sessionScope.member.memberProfile}), url(/resources/profile/noprofile.png);background-size: contain;background-repeat: no-repeat;" -->
					</div>
					

					
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="list-group-item list-group-item-action bg-dark dropdown-toggle" style="color: white;">회원정보</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
					<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">정보 보기</a> -->
					<button type="button" onclick="myInfo()" class="list-group-item list-group-item-action bg-dark" style="color: rgb(163, 163, 163);">정보 보기</button>
                </li>
                <li>
					<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">비밀번호 수정</a> -->
					<button type="button" data-toggle="modal" data-target="#changePw" onclick="changePw()" class="list-group-item list-group-item-action bg-dark" style="color: rgb(163, 163, 163);">비밀번호 수정</button>
                </li>
                <li>
					<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">주소 수정</a> -->
					<button type="button" onclick="changeAddr()" class="list-group-item list-group-item-action bg-dark" style="color: rgb(163, 163, 163);">주소 수정</button>
                </li>
                <li>
					<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">이메일 변경</a> -->
					<button type="button" onclick="changeMail()" class="list-group-item list-group-item-action bg-dark" style="color: rgb(163, 163, 163);">이메일 변경</button>
                </li>
	            </ul>
	          </li>
	          <li>
				  <button type="button" onclick="purchaseLog()" class="list-group-item list-group-item-action bg-dark" style="color: white;"> 결제 내역</button>
	              <!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">결제 내역</a> -->
			  </li>
			  <li>
				  <button type="button" onclick="quit()" class="list-group-item list-group-item-action bg-dark" style="color: white;">회원탈퇴</button>
				<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">회원 탈퇴</a> -->
			  </li>
			  <c:if test="${empty sessionScope.member.expireDate}">
				  <li>
					  <button type="button" onclick="purchaseMember()" class="list-group-item list-group-item-action bg-dark" style="color: white;">이용권 구매</button>
					<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">회원 탈퇴</a> -->
				  </li>
				</c:if>
				<c:if test="${not empty sessionScope.member.expireDate}">
					<li>
						<button type="button" onclick="checkExpire()" class="list-group-item list-group-item-action bg-dark" style="color: white;">이용권 만료일</button>
					  <!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">회원 탈퇴</a> -->
					</li>

			  </c:if>
	          
	          
	        </ul>

	        

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">

        

        <h2 class="mb-4">Sidebar #01</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="changePw" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content bg-dark" >
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLongTitle" style="color: white;">비밀번호 수정</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="modal-body">
					<p id="modalBody">
						<div id="check">
							<div class="form-row">

								<input type="password" name="oldMemberPw" class="form-control" id="">
							</div>
							<br>
							<div class="form-row" >
								<button type="button" onclick="checkPw();" class="btn btn-primary">비밀번호 확인</button>
							</div>
						</div>
						<div style="display: none;" id="change">
							<form action="/healthner/member/changePw.do" onsubmit="return changePw()"  method="post">
								<div class="form-row" style="color: white;">
									새 비밀번호<span></span>
									<input type="password" class="form-control" name="memberPw" id="memberPw">
								</div>
								<div class="form-row" style="color: white;">
									비밀번호 확인<span></span>
									<input type="password" name="chkPw" class="form-control" id="checkPw">
								</div>
								<br>
								<div class="form-row">
									<input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.member.memberNo}">
									<input type="submit" class="btn btn-primary" value="변경">
								</div>
							</form>

						</div>

					</p>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			  </div>
			</div>
	</section>


	


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>