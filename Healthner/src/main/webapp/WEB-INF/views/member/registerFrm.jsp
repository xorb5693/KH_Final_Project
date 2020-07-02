<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<script
  type="text/javascript"
  src="http://code.jquery.com/jquery-3.3.1.js"
></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Register</title>
  </head>
  <body>
    <script>
      var count = 0;

      $(function () {
        // 아이디 중복 확인 및 정규표현식
        $("input[name=memberId]").keyup(function () {
          var memberId = $(this).val();
          var regEx = /[A-Za-z0-9]{5,12}/;
          $.ajax({
            url: "/healthner/member/selectId.do",
            method: "get",
            data: { memberId: memberId },
            success: function (data) {
              if (data == "0") {
                if (!regEx.test(memberId)) {
                  $("input[name=memberId]")
                    .prev("span")
                    .html("영어 대/소문자 5~12글자");
                  $("input[name=memberId]").prev("span").css("color", "red");
                } else {
                  $("input[name=memberId]").prev("span").html("사용가능");
                  $("input[name=memberId]").prev("span").css("color", "green");
                  $("input[name=memberId]").attr('qualify','true');
                }
              } else {
                $("input[name=memberId]").prev("span").css("color", "red");
                $("input[name=memberId]")
                  .prev("span")
                  .html("이미 사용중인 아이디 입니다");
              }
            },
          });
        });

        // 비밀번호 정규표현식 확인
        $("input[name=memberPw]").keyup(function () {
          var memberPw = $("input[name=memberPw]").val();
          var regEx = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$/;
          $("input[name=chkPw]").val("");
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
                  $('input[name=memberNick]').prev("span").html("사용가능").css("color", "green");
                  $("input[name=memberNick]").attr('qualify','true');
                } else {
                  $('input[name=memberNick]')
                    .prev("span")
                    .css("color", "red")
                    .html("이미 사용중인 이름입니다");
                  $("input[name=memberNick]").attr('qualify','false');
                }
              },
            });
          }
        });

        //나이

        $("input[name=age]").keyup(function () {
          var regEx = /^[1-9]{1}[0-9]$/;
          var age = $(this).val();
          if (!regEx.test(age)) {
            $(this)
              .prev()
              .css("color", "red")
              .html("나이를 숫자로 입력해주세요");
            $("input[name=age]").attr('qualify','false');
          } else {
            $(this).prev().hide();
            $("input[name=age]").attr('qualify','true');
          }
        });

        // 핸드폰
        $("input[name=phone]").keyup(function () {
          var regEx = /^[0-1]{3}[0-9]{4}[0-9]{4}$/;
          var phone = $(this).val();
          if (!regEx.test(phone)) {
            $(this)
              .prev()
              .css("color", "red")
              .html("01000000000 형식으로 입력해주세요");
            $("input[name=phone]").attr('qualify','false');
          } else {
            $(this).prev().hide();
            $("input[name=phone]").attr('qualify','true');
          }
        });

        // 이름
        $("input[name=memberName]").keyup(function () {
          var regEx = /^[가-힣]{2,4}$/;
          var memberName = $(this).val();
          if (!regEx.test(memberName)) {
            $(this)
              .prev()
              .css("color", "red")
              .html("한글로 2~4글자를 입력하세요");
            $("input[name=memberName]").attr('qualify','false');
          } else {
            $(this).prev().hide();
            $("input[name=memberName]").attr('qualify','true');
          }
        });

        // 이메일
        $("input[name=email]").keyup(function () {
          var regEx = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
          var email = $(this).val();
          if (!regEx.test(email)) {
            $(this)
              .prev()
              .css("color", "red")
              .html("이메일을 다시 확인해주세요");
            $("input[name=email]").attr('qualify','false');
          } else {
            $(this).prev().hide();
            $("input[name=email]").attr('qualify','true');
          }
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
              $("input[name=detAddr]").focus();
            },
          }).open();
        });
      });

      function FinalCheck(){
        var id = $('input[name=memberId]').attr('qualify');
        var pw = $('input[name=memberPw]').attr('qualify');
        var chkPw = $('input[name=chkPw]').attr('qualify');
        var email = $('input[name=email]').attr('qualify');
        var name = $('input[name=memberName]').attr('qualify');
        var nickName = $('input[name=memberNick]').attr('qualify');
        var age = $('input[name=age]').attr('qualify');
        var phone = $('input[name=phone]').attr('qualify');
        var detAddr = $('input[name=detAddr]').val();
        var zip = $('input[name=zip]').val();
        if(id != "true"){
          alert('아이디를 확인해주세요');
          return false;
        }
        if(pw != "true"){
          alert('비밀번호를 다시 확인해주세요');
          return false;
        }
        if(chkPw !="true"){
          alert('비밀번호가 동일한지 확인해주세요');
          return false;
        }
        if(email != "true"){
          alert('이메일 주소를 확인해주세요');
          return false;
        }
        if(name != "true"){
          alert('이름을 다시 확인해주세요');
          return false;
        }
        if(nickName != "true"){
          alert('닉네임을 다시 확인해주세요');
          return false;
        }
        if(age != "true"){
          alert('나이를 다시 확인해주세요');
          return false;
        }
        if(phone != "true"){
          alert('핸드폰 번호를 다시 확인해주세요');
          return false;
        }
        if(zip == ""){
          alert('우편번호를 입력해주세요');
          return false;
        }
        if(detAddr == ""){
          alert('상세주소를 다시 입력해주세요');
          return false;
        }
        return true;
      }

    </script>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section
      class="hero-wrap"
      style="background-image: url('/resources/images/bg_02.jpg');"
    >
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text align-items-center justify-content-center"
        >
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
            <br /><br />
            <h1 class="mb-3 bread">Registration</h1>
            <p class="breadcrumbs">
              <span class="mr-2"><a href="trainer.do">Trainer Intro</a></span>
              <span class="mr-2"
                ><a href="customerList.do">My Customer </a></span
              >
              <span class="mr-2"
                ><a href="trainerInputFrm.do">Edit Info</a></span
              >
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="hero-wrap">
      <div class="container">
        <form action="/healthner/member/join.do" method="post" onsubmit="return FinalCheck()" enctype="multipart/form-data">
          <div class="form-row">
            <div class="col-md-5"></div>
            <div class="col-md-2">
              <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-secondary btn-sm active">
                  <input
                    type="radio"
                    name="memberLevel"
                    id="option1"
                    value="1"
                    autocomplete="off"
                    checked
                  />
                  일반회원
                </label>
                <label class="btn btn-secondary btn-bm">
                  <input
                    type="radio"
                    name="memverLevel"
                    id="option2"
                    value="2"
                    autocomplete="off"
                  />
                  트레이너
                </label>
              </div>
            </div>
            <div class="col-md-5"></div>
          </div>
          <div class="form-row">
            <div class="col-md-9">
              아이디: <span></span>
              <input
                type="text"
                name="memberId"
                id=""
                class="form-control"
              />
              <br />
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-5">
              비밀번호:
              <span></span>
              <input
                type="password"
                name="memberPw"
                id=""
                class="form-control"
              />
              <br />
            </div>
            <div class="col-md-5">
              비밀번호 확인:
              <span></span>
              <input
                type="password"
                name="chkPw"
                id=""
                class="form-control"
              />
              <br />
            </div>
          </div>
          <div class="form-row">
            <div class="col">
              사진: <input type="file" name="file" id="" />
              <br />
            </div>
          </div>
          <div class="form-row">
            <div class="col">
              이메일: <span></span>
              <input type="text" name="email" id="" class="form-control" />
            </div>
          </div>
          <div class="form-row">
            <div class="col">
              이름:
              <span></span>
              <input
                type="text"
                name="memberName"
                id=""
                class="form-control"
              />
            </div>
            <div class="col">
              닉네임:
              <span></span>
              <input
                type="text"
                name="memberNick"
                id=""
                class="form-control"
              />
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-6">
              나이:
              <span></span>
              <input
                type="text"
                name="age"
                id=""
                class="form-control"
              />
              <br />
            </div>
            <div class="col-md-6">
              핸드폰:
              <span></span>
              <input
                type="text"
                name="phone"
                id=""
                class="form-control"
              />
              <br />
            </div>
          </div>
          <div class="form-row">
            <div class="col">
              <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-primary btn-sm">
                  <input
                    type="radio"
                    name="gender"
                    id="option1"
                    value="M"
                    checked
                  />
                  남
                </label>
                <label class="btn btn-primary btn-bm">
                  <input
                    type="radio"
                    name="gender"
                    id="option2"
                    value="F"
                  />
                  여
                </label>
              </div>
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-3">
              우편번호:
              <button class="btn btn-primary btn-sm" id="address" type="button">
                조회
              </button>
              <input
                type="text"
                name="zip"
                id=""
                class="form-control"
                readonly
              />
              <br />
            </div>
            <div class="col-md-4">
              도로명:
              <input
                type="text"
                name="roadAddr"
                id=""
                class="form-control"
                readonly
              /><br />
            </div>
            <div class="col-md-4">
              상새주소:
              <input
                type="text"
                name="detAddr"
                id=""
                class="form-control"
                placeholder="상세주소"
              /><br />
            </div>
          </div>
          <div class="form-row">
            <div class="col-md-5"></div>
            <div class="col-md-2">
              <button type="submit" class="btn btn-primary btn-bg">
                회원가입
              </button>
              <input
                type="reset"
                class="btn btn-primary btn-bg"
                value="초기화"
              />
            </div>
            <div class="col-md-5"></div>
          </div>
        </form>
      </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
