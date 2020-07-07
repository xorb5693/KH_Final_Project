<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
	<link rel="icon" href="/resources/images/favicon.png">
	<script
  type="text/javascript"
  src="http://code.jquery.com/jquery-3.3.1.js"
></script>
 <link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
	rel="stylesheet">

  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <!-- END nav -->
    <script>
      $(function(){
        $("#login").click(function(){
          var memberId = $("input[name=memberId]").val();
          var memberPw = $("input[name=memberPw]").val();
          $.ajax({
            url: "/healthner/member/login.do",
            method: "post",
            data: {memberId : memberId,
                    memberPw : memberPw
            },
            success: function(data){
              
            }
          });
          if($("#remember").is(":checked")){
            console.log("checked");
          }else{
            console.log("not checked");
          }
        });
      });
      function createCookie(){

      }
      function deleteCookie(){

      }
    </script>
    <section
      class="hero-wrap js-fullheight"
      style="background-image: url('/resources/images/bg_2.jpg');"
    >
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
        >
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
            <!-- Login -->

            <!-- 			<div class="d-flex justify-content-center h-100 disabled" id="section-counter">
				<div class="card"> -->

            <div class="card-body">
              <form action="/healthner/member/login.do" method="POST">
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
                    placeholder="username"
                  />
                </div>
                <div class="input-group form-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text"
                      ><i class="icon-key"></i
                    ></span>
                  </div>
                  <input
                    type="password"
                    name="memberPw"
                    class="form-control"
                    placeholder="password"
                  />
                </div>
                <div class="row align-items-center remember">
                  <label>
                    <input type="checkbox" class="" id="remember" />
                    Remember Me
                  </label>
                </div>
                <div class="form-group">
                  <button type="button" id="login" class="btn btn-primary btn-outline-white">로그인</button>
                </div>
              </form>
            </div>
            <div class="card-footer">
              <div class="d-flex justify-content-center links">
                Don't have an account?<a href="/healthner/member/registerFrm.do"
                  >회원가입</a
                >
              </div>
              <div class="d-flex justify-content-center">
                <a href="/healthner/member/retrieveFrm.do"
                  >아이디/비밀번호 찾기</a
                >
              </div>
            </div>
            <!-- 				</div>
			</div>  -->
          </div>
        </div>
      </div>
    </section>

    <script src="/resources/js/jquery.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/jquery.easing.1.3.js"></script>
    <script src="/resources/js/jquery.waypoints.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/aos.js"></script>
    <script src="/resources/js/jquery.animateNumber.min.js"></script>
    <script src="/resources/js/bootstrap-datepicker.js"></script>
    <script src="/resources/js/jquery.timepicker.min.js"></script>
    <script src="/resources/js/scrollax.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
    <script src="/resources/js/google-map.js"></script>
    <script src="/resources/js/main.js"></script>
  </body>
</html>
