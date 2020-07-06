<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>Insert title here</title>
		<script
		  type="text/javascript"
		  src="http://code.jquery.com/jquery-3.3.1.js"
		></script>
		<link rel="icon" href="/resources/images/favicon.png">
  </head>
<script>
	function retrieveId(){
		var memberName = $("input[name=memberName]").val();
		var email = $("input[name=email]").val();
		$.ajax({
			url: "/healthner/member/retrieveId.do",
			method: "get",
			data: { memberName : memberName,
					email : email
			},
			success:function(data){
				if(data!=null){
					console.log(data["memberId"]);
					$("#modalBody").html("회원님의 아이디는: "+data["memberId"]+" 입니다");
				}else{
					console.log(data);
					$("#modalBody").html("이름/이메일 주소를 다시 확인해주세요");
				}
			}
		});
	
	}
	$(function(){
		$("#retrievePw").click(function(){
			var memberId = $("input[name=memberId]").val();
			var email = $("input[name=emailPw]").val();
			$.ajax({
				url: "/healthner/member/retrievePw.do",
				method: "get",
				data: { memberId : memberId ,
						email : email
				},
				success: function(data){
					console.log(data["memberId"]);
					if(data!=null){
						alert("이메일로 링크가 보내졌습니다");
					}else{
						alert("아이디/이메일을 확인해주세요");
					}
					
				}

			})
		});
	});
</script>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
		<div class="overlay"></div>
		<div class="container">
		  <div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
			<br><br>
			  <h1 class="mb-3 bread">retrieve</h1>
			</div>
		  </div>
		</div>
	  </section>
	
	<section class="container">
		<div class="row">

			<div class="col-md-6 ftco-animate text-center pt-md-5 pt-5">
				<div class="card-body">
					<h2>아이디 찾기</h2>
				  <form action="/healthner/member/retrieve.do" method="POST">
					<div class="input-group form-group">
					  <div class="input-group-prepend">
						<span class="input-group-text"
						  ><i class="icon-person_outline"></i
						></span>
					  </div>
					  <input
						type="text"
						name="memberName"
						class="form-control"
						placeholder="이름을 입력하세요"
						required
					  />
					</div>
					<div class="input-group form-group">
					  <div class="input-group-prepend">
						<span class="input-group-text"><i class="icon-mail_outline"></i></span>
					  </div>
					  <input
						type="text"
						name="email"
						class="form-control"
						placeholder="이메일을 입력하세요"
						required
					  />
					</div>
					<div class="form-group">
					  <button type="button" onclick="retrieveId()" class="btn btn-primary" data-toggle="modal" data-target="#idRetrieval" >아이디 찾기</button>
					
					</div>
				  </form>
				</div>
	
			</div>
			<div class="col-md-6 ftco-animate text-center pt-md-5 pt-5">
				<div class="card-body">
					<h2>비밀번호 찾기</h2>
				  <form action="/healthner/member/retrieve.do" method="POST">
					<div class="input-group form-group">
					  <div class="input-group-prepend">
						<span class="input-group-text"
						  ><i class="icon-person_outline"></i
						></span>
					  </div>
					  <input
						type="text"
						name="memberId"
						class="form-control"
						placeholder="아이디를 입력하세요"
						required
					  />
					</div>
					<div class="input-group form-group">
						<div class="input-group-prepend">
						  <span class="input-group-text"><i class="icon-mail_outline"></i></span>
						</div>
						<input
						  type="text"
						  name="emailPw"
						  class="form-control"
						  placeholder="이메일을 입력하세요"
						  required
						/>
					  </div>
					<div class="form-group">
					  <button type="button" class="btn btn-primary" id="retrievePw">
						  비밀번호 찾기
					  </button>
					</div>
				  </form>
				</div>
	
			</div>
		</div>

		<!-- Modal -->
		<div class="modal fade" id="idRetrieval" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
			  <div class="modal-content">
				<div class="modal-header">
				  <h5 class="modal-title" id="exampleModalLongTitle">아이디 찾기</h5>
				  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				  </button>
				</div>
				<div class="modal-body">
					<p id="modalBody"></p>
				</div>
				<div class="modal-footer">
				  <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				  <button type="button" class="btn btn-primary">Save changes</button>
				</div>
			  </div>
			</div>
	</section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
