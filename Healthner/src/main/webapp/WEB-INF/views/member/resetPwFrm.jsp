<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script
		  type="text/javascript"
		  src="http://code.jquery.com/jquery-3.3.1.js"
		></script>
</head>
<script>
	function checkPw(){
		var memberPw = $("input[name=memberPw]").attr("qualify");
		var chkPw = $("input[name=chkPw]").attr("qualify");
		if(memberPw != 'true'){
			alert("비밀번호를 조건에 맞게 작성해주세요");
			return false;
		}
		if(chkPw != "true"){
			alert("비밀번호가 동일하지 않습니다");
			return false;
		}
		return true;
	}
	$(function(){
		$("input[name=memberPw]").keyup(function () {
          var memberPw = $("input[name=memberPw]").val();
          var regEx = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
          if (!regEx.test(memberPw)) {
            $("input[name=memberPw]").prev("span").css("color", "red");
            $("input[name=memberPw]")
              .prev("span")
              .html("영어 대/소문자 특수문자 8~16자리");
            $("input[name=memberPw]").attr('qualify','false');
          } else {
            $("input[name=memberPw]").prev().hide();
            $("input[name=memberPw]").attr('qualify','true');
          }
        });
		$("input[name=memberPw]").focus(function(){
          $("input[name=chkPw]").val("");
		});
        // 비밀번호 일치 확인
        $("input[name=chkPw]").keyup(function () {
          var memberPw = $("input[name=memberPw]").val();
          var chkPw = $("input[name=chkPw]").val();
          if (chkPw != memberPw) {
            $(this).prev("span").css("color", "red");
            $(this).prev("span").html("비밀번호가 일치하지 않습니다");
            $("input[name=chkPw]").attr('qualify','false');
          } else {
            $(this).prev("span").hide();
            $("input[name=chkPw]").attr('qualify','true');
          }
        });
	});
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
		<div class="overlay"></div>
		<div class="container">
		  <div class="row no-gutters slider-text align-items-center justify-content-center">
			<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
			<br><br>
			  <h1 class="mb-3 bread">reset password</h1>
			</div>
		  </div>
		</div>
	  </section>
	<section class="hero-wrap">
		<div class="container">

			<form action="/healthner/member/resetPw.do" onsubmit="return checkPw();" method="post">
				<div class="form-row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="card-body">
							<div class="input-group form-group">
								새로운 비밀번호 입력
								<span></span>
								<input type="text" name="memberPw" id="" class="form-control">
							</div>
	
						</div>
					</div>
	
				</div>
				<div class="form-row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<div class="input-group form-group">
							비밀번호 확인
							<span></span>
							<input type="text" name="chkPw" class="form-control" id="">
						</div>
	
					</div>
				</div>
				<div class="form-row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<button type="submit" class="btn btn-primary">
							재설정
						</button>
					</div>
				</div>
			</form>
		</div>
	</section>  
	  
	  
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>