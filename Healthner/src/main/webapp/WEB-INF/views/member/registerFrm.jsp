<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>
</head>
<body>
  <script>
    $(function(){
      $('input[name=memberId]').keyup(function(){
        var memberId = $(this).val();
        $.ajax({
          url: '/healthner/member/selectId.do',
          method: 'get',
          data: {memberId : memberId},
          success: function(data){
            if(data == "0"){
              $(this).next().html("사용가능")
            }else{
              $(this).next().html("이미 사용중인 아이디")
            }
          }
        });
      });
    });
  </script>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section class="hero-wrap js-fullheight" style="background-image: url('/resources/images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">hello</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span></p>
          </div>
        </div>
      </div>
    </section>
	
  <section class="hero-wrap">
    <form action="/healthner/member/join.do" method="get">
      아이디: <input type="text" name="memberId" id="" class="input-group-text" required><span></span><br>
      비밀번호: <input type="password" name="memberPw" id="" class="input-group-text" required><span></span><br>
      비밀번호 확인:<input type="password" name="chkPw" id="" class="input-group-text" required><span></span><br>
      닉네임: <input type="text" name="memberNick" id="" class="input-group-text" required><span></span><br>
      우편번호: <input type="text" name="zip" id="" class="input-group-text" readonly><button class="btn btn-primary" type="button">조회</button><br>
      도로명: <input type="text" name="roadAddr" id="" class="input-group-text" readonly><br>
      상새주소: <input type="text" name="detAddr" id="" class="input-group-text" required><br>
      성별: <input type="radio" name="gender" value="M" id="" required>남 <input type="radio" name="gender" value="F" id="">여<br>
      나이: <input type="text" name="age" id="" class="input-group-text" required><br>
      핸드폰: <input type="text" name="phone" id="" class="input-group-text" required><br>
      <input type="submit" value="회원가입">

    </form>
  </section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>