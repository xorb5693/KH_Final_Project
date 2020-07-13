<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<link rel="icon" href="/resources/images/favicon.png">
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
			if (msg == "success") {
				alert("수정 성공");
			} else {
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
			location.href = "/healthner/admin/adminMain.do";
		</script>
	</c:if>

	<style>
		#changingProfile :hover{
			cursor: pointer;
		}
	</style>
	<script>
		$(function() {
			$("#changePw").on('hidden.bs.modal', function() {
				$("#check").show();
				$("#change").hide();
			});

			// 주소 입력
			$("#address").click(function () {
          new daum.Postcode({
            oncomplete: function (data) {
              var addr = ""; // 주소 변수
              var extraAddr = ""; // 참고항목 변수

              if (data.userSelectedType === "R") {
                addr = data.roadAddress;
              } else {
                addr = data.jibunAddress;
              }

              if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                  extraAddr +=
                    extraAddr !== ""
                      ? ", " + data.buildingName
                      : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== "") {
                  extraAddr = " (" + extraAddr + ")";
                }
              }

              $("input[name=zip]").val(data.zonecode);
              $("input[name=roadAddr]").val(addr);
              // 커서를 상세주소 필드로 이동한다.
			  
              $("input[name=detAddr]").attr("readonly",false);
			  $("input[name=detAddr]").focus();
            },
          }).open();
        });
	});

		$(function(){
			$("#modify").click(function(){
				$("#subBtn").hide();
				$("#finalBtn").show();
				$("input[name=memberNick]").attr("readonly",false).focus();
				$("#address").show();

			});
		});


		// 회원 탈퇴
		function quit() {
			if (confirm("회원탈퇴 하시겠습니까")) {
				$.ajax({
					url : "/healthner/member/quit.do",
					method : "get",
					success : function(data) {
						if (data == "success") {
							alert("다음에 또 뵐게요~");
						} else {
							alert("오류가 발생했습니다 관리자에게 문의 부탁드립니다");
						}
						location.href = "/";
					}
				});
			}
		}
		function checkPw() {
			var memberPw = $("input[name=oldMemberPw]").val();
			var memberNo = $("#memberNo").val();
			$.ajax({
				url : "/healthner/member/checkPw.do",
				method : "post",
				data : {
					memberPw : memberPw,
					memberNo : memberNo
				},
				success : function(data) {
					if (data == "1") {
						$("#check").hide();
						$("input[name=oldMemberPw]").val("");
						$("#change").show();
					} else {
						alert("비밀번호가 틀렸습니다");
					}
				}
			});
		}
		function myInfo() {
			location.href = "/healthner/member/mypageFrm.do"
		}
		function changePw() {
			var regExp = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
			var memberPw = $("input[name=memberPw]");
			var chkPw = $("input[name=chkPw]");
			if (!regExp.test(memberPw.val())) {
				memberPw.prev().html("영어 대/소문자 특수문자 8~16자리").attr('color',
						'red');
			} else {
				memberPw.prev().html("");
				if (memberPw.val() != chkPw.val()) {
					chkPw.prev().html("비밀번호가 동일하지 않습니다").attr("color", "red");
					return false;
				} else {
					chkPw.prev().html("");
				}
			}
			return true;
		}
		
		function changeMail() {
		}
		function purchaseLog() {
			location.href = "/healthner/shop/myBuyList.do?reqPage=1";
		}
		function purchaseMember() {
			location.href = "/healthner/member/pricing.do";
		}
		
	</script>
	
	<section class="ftco-section ftco-about">
		<div class="container">
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
					<div class="bordered" id="changingProfile" style="width: 300px; height: 300px;">
						<img
							src="/resources/profile/${sessionScope.member.memberProfile}"
							style="width: 300px; height: 300px;" data-toggle="modal"
							data-target="#changeProfile" 
							onerror="this.src='/resources/profile/noprofile.png'">
						<!-- background-image: url(/resources/profile/${sessionScope.member.memberProfile}), url(/resources/profile/noprofile.png);background-size: contain;background-repeat: no-repeat;" -->
					</div>



					<ul class="list-unstyled components mb-5">
						<li class="active"><a href="#homeSubmenu"
							data-toggle="collapse" aria-expanded="false"
							class="list-group-item list-group-item-action bg-dark dropdown-toggle"
							style="color: white;">회원정보</a>
							<ul class="collapse list-unstyled" id="homeSubmenu">
								<li>
									<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">정보 보기</a> -->
									<button type="button" onclick="myInfo()"
										class="list-group-item list-group-item-action bg-dark"
										style="color: rgb(163, 163, 163);">정보 보기</button>
								</li>
								<li>
									<!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">이메일 변경</a> -->
									<button type="button" onclick="quit()"
								class="list-group-item list-group-item-action bg-dark"
								style="color: white;">회원탈퇴</button> <!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">회원 탈퇴</a> -->
								</li>
							</ul>
						</li>
						<li>
							<button type="button" onclick="purchaseLog()"
								class="list-group-item list-group-item-action bg-dark"
								style="color: white;">결제 내역</button> <!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">결제 내역</a> -->
						</li>
						<c:if test="${empty sessionScope.member.expireDate}">
							<li>
								<button type="button" onclick="purchaseMember()"
									class="list-group-item list-group-item-action bg-dark"
									style="color: white;">이용권 구매</button> <!-- <a href="#" class="list-group-item list-group-item-action bg-dark" style="color: white;">회원 탈퇴</a> -->
							</li>
						</c:if>


					</ul>



				</div>
			</nav>

			<script>
				$(function(){

					$("#mailBtn").click(function(){
						$("input[name=email]").attr("readonly",false);
						$("input[name=email]").val("").focus();
						$("#mailBtn").hide();
						$("#mailCheck").show();
					});
					$("#mailCheck").click(function(){
						var email = $("input[name=email]").val();
						$.ajax({
							method: "get",
							url: "/healthner/member/changeMail.do",
							data: {email:email},
							success: function(data){
								if(data!=""){
									$("#confirm").show();
									$("#mailCheck").hide();
									$("#code").show();
									$("#resultCode").val(data);
								}else{
									alert("도중에 에러가 발생했습니다 관리자를 연락해주세요");
								}
							}
						})
					});
					$("#confirm").click(function(){
						var code = $("input[name=code]").val();
						var confirm = $("#resultCode").val();
						var emailChange = $("input[name=email]").val();
						if(code == confirm){
							$.ajax({
								url: "/healthner/member/changeMailFinal.do",
								method: "get",
								data: { emailChange:emailChange },
								success: function(data){
									if(data =="0" ){
										alert("이메일 수정 완료");
										location.reload();
									}else{
										alert("이메일 수정 실패");
									}
								}
							});
						}else{
							alert("코드가 다릅니다");
						}
					});
					// 닉네임 조건
					$("input[name=memberNick]").keyup(function () {
					var memberNick = $("input[name=memberNick]").val();
					var regEx = /[A-Za-z0-9가-힣]{3,12}/;
					if (!regEx.test(memberNick)) {
						$(this)
						.prev("span")
						.css("color", "red")
						.html("최소 3글자를 이용해주세요");
					} else {
						$.ajax({
						url: "/healthner/member/checkNick.do",
						method: "get",
						data: { memberNick: memberNick },
						success: function (data) {
							if (data == "0") {
							$("input[name=memberNick]")
								.prev("span")
								.html("사용가능")
								.css("color", "green");
							$("input[name=memberNick]").attr("qualify", "true");
							} else {
							$("input[name=memberNick]")
								.prev("span")
								.css("color", "red")
								.html("이미 사용중인 이름입니다");
							$("input[name=memberNick]").attr("qualify", "false");
							}
						},
						});
					}
					});

					//submit
					$("#finalChk").click(function(){
						var memberNick = $("input[name=memberNick]").attr("qualify");
						var detAddr = $("input[name=detAddr]").attr("qualify");
						if(memberNick != "true"){
							alert("닉네임을 다시 확인해주세요");
							return;
						}
						if(detAddr == ""){
							alert("주소를 확인해주세요");
						}
						$("#memberModify").submit();
					});

				});
			</script>
			<!-- Page Content  -->
			<div id="content" class="border border-light p-4 p-md-5">



				<h2>개인정보 수정</h2>
				<form action="/healthner/member/memberModify.do" id="memberModify"
					method="post" >
					<input type='hidden' id='modifyFullMail' name='modifyFullMail'>
					<div class="wrapper">

						<table>
							<c:if test="${not empty sessionScope.member.expireDate}">
								<tr>
									<td>
										<span >이용권 만료일</span>
									</td>
									<td>
										<span>${sessionScope.member.expireDate}</span>
									</td>
								</tr>
							</c:if>
							<tr>
								<th><label for="memberId">아이디</label></th>
								<td style="width: 500px;"><input type="text"
									name="memberId" id="memberId" class="form-control"
									value="${sessionScope.member.memberId }" readonly> 
								</td>
							</tr>
							<tr>
								<th><label for="memberPw">비밀번호</label></th>
								<td>
									<button type="button" data-toggle="modal"
										data-target="#changePw" onclick="changePw()"
										class="btn btn-dark btn-lg "
										style="color: rgb(163, 163, 163);">비밀번호 수정</button> 
								</td>
							</tr>
							<tr>
								<th>
								<label for="memberName">이름</label></th>
								<td> <input type="text" name="memberName"
									id="memberName" class="form-control"
									value="${sessionScope.member.memberName }"readonly required> 
								<span id="nameMsg"></span></td>
							</tr>
							<tr>
								<th>
								<label for="memberNick">닉네임</label></th>
								<td><span></span><input type="text" id="memberNick"
									class="form-control" style="width: 200px;" name="memberNick"
									value="${sessionScope.member.memberNick }" readonly required> 
								</td>
							</tr>
							<tr>
								<th>
								<label for="phone">전화번호</label></th>
								<td> <input type="text" id="phone" name="phone"
									class="form-control" value="${sessionScope.member.phone }"
									readonly required> 
								<span id="phoneMsg"></span></td>
								</td>
							</tr>
							<tr>
								<th><label for="mail1">이메일</label></th>
								<td>
									<button type="button" id="mailBtn" class="btn btn-dark">이메일
										변경</button>
									<input type="text" name="email" id=""
									value="${sessionScope.member.email}" class="form-control" readonly />
									
									<button type="button" class="btn btn-dark" id="mailCheck" style="display: none;">메일확인</button>
									<input type="text" name="code" id="code" style="display: none;" class="form-control">
									<input type="hidden" name="code" id="resultCode" value="">
									<input type="button" value="인증하기" id="confirm" style="display: none;" class="btn btn-dark">
								</td>
							</tr>
							<tr style="border-bottom: 1px solid black;">
								<th><label for="addrSearch">주소</label> </th>
								<td>
									<button type="button" id="address" class="btn btn-dark" style="display: none;">주소검색</button>
									 <input type="text" id="zip"
									name="zip" class="form-control"
									placeholder="${sessionScope.member.zip}" readonly required>
									 <input type="text" id="roadAddr" name="roadAddr"
									class="form-control"
									placeholder="${sessionScope.member.roadAddr}" readonly required>
									<input id="detAddr" name="detAddr" class="form-control"
									type="text" placeholder="${sessionScope.member.detAddr}"
									required readonly> <span id="addrMsg"></span>
									<input type="hidden" name="memberNo" id="memberNo"
										value="${sessionScope.member.memberNo}"> 
								</td>
							</tr>
							<tr style="display: none;" id="finalBtn">
								<td colspan="2" style="text-align: center;">
									<button type="button" id="finalChk"
										class="btn btn-dark btn-block" >수정하기</button>
									<button type="button" id="cancel"
										class="btn btn-dark btn-block">메인페이지로</button></td>
							</tr>
						</table>
					</div>
				</form>
				<table id="subBtn"  style="width: 602px;">
					<tr >
						<td colspan="2" style="text-align: center;" >
							<button type="button" id="modify"
								class="btn btn-dark btn-block">수정하기</button>
							<button type="button" id="cancel"
								class="btn btn-dark btn-block">메인페이지로</button></td>
					</tr>

				</table>
			</div>
		</div>

		<!-- Modal for changePw -->
		<div class="modal fade" id="changePw" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content bg-dark">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle"
							style="color: white;">비밀번호 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p id="modalBody">
						<div id="check">
							<div class="form-row">

								<input type="password" name="oldMemberPw" class="form-control"
									id="">
							</div>
							<br>
							<div class="form-row">
								<button type="button" onclick="checkPw();"
									class="btn btn-primary">비밀번호 확인</button>
							</div>
						</div>
						<div style="display: none;" id="change">
							<form action="/healthner/member/changePw.do"
								onsubmit="return changePw()" method="post">
								<div class="form-row" style="color: white;">
									새 비밀번호<span></span> <input type="password" class="form-control"
										name="memberPw" id="memberPw">
								</div>
								<div class="form-row" style="color: white;">
									비밀번호 확인<span></span> <input type="password" name="chkPw"
										class="form-control" id="checkPw">
								</div>
								<br>
								<div class="form-row">
									<input type="hidden" name="memberNo" id="memberNo"
										value="${sessionScope.member.memberNo}"> <input
										type="submit" class="btn btn-primary">
								</div>
							</form>

						</div>

						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
			<!-- Modal for profilePic -->
		<div class="modal fade" id="changeProfile" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content bg-dark">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLongTitle"
							style="color: white;">사진 수정</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p id="modalBody">
						<div>
							<div class="form-row">
								<form action="/healthner/member/updateProfile.do" enctype="multipart/form-data" method="post">
									<input type="file" name="file" id="">
									<input type="submit" class="btn btn-dark" value="바꾸기">
								</form>
							</div>
						</div>

						</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		</div>
	</section>





	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>