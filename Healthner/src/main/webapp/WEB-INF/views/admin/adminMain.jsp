<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/admin/css/style.css">
  </head>
    <!--혜진_200622_기존 템플릿 이외에 스타일 추가-->
    <style>
        .body{
            font-family: 'Nanum Gothic', sans-serif;
        }
        .main-logo{
            width:105%;
            margin-top: 20px;
            margin-bottom: 15px;
        }
        #sidebar{
            font-family: 'Nanum Gothic', sans-serif;
        }
        .sub-list{
            line-height: 0;
            display: none;
        }
        .sub-list li span{
            margin-left: 20px;
        }
        .logo span{
            display: inline-block;
        }
        .side-bar h1 span:hover{
            color:#f7da00;
        }
    </style>
    <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
  <body>
		<div class="container d-flex align-items-stretch">
			<nav id="sidebar" class="img" style="background-image: url(/admin/images/admin_main_column.jpg);">
				<div class="p-4">
                    <h1><a href="/adminMain.do" class="logo"><img src="/admin/images/Picture4.png" class="main-logo"></a><a href="index.html" class="logo"><span style="float:right;" id="logout"> [Admin]&nbsp;Logout</span></a></h1>
	        <ul class="list-unstyled components mb-5 main-list" >
	          <li>
	            <a href="#" style="margin-top:55px;"><span class="fa fa-user mr-3"></span> <span></span>회원 관리</a>
                  <ul class="sub-list list-unstyled">
                      <li>
                      <a href="#"><span class="fa fa-long-arrow-right mr-3"></span>트레이너 관리</a>
                      </li>
                      <li>
                      <a href="#"><span class="fa fa-long-arrow-right mr-3"></span>PT Mapping 관리</a>
                      </li>
                  </ul>
	          </li>
	          <li >
	              <a href="#"><span class="fa fa-warning mr-3"></span>신고 관리</a>
                  <ul class="sub-list list-unstyled">
                    <li>
                      <a href="#"><span class="fa fa-long-arrow-right mr-3"></span>회원 정지 관리</a>
                      </li>
                  </ul>
	          </li>
	          <li>
              <a href="#"><span class="fa fa-shopping-cart mr-3"></span>상품 관리</a>
	          </li>
	          <li>
              <a href="#"><span class="fa fa-send-o mr-3"></span>쪽지함</a>
	          </li>
	          <li>
              <a href="#"><span class="fa fa-calendar mr-3"></span>예약 목록 관리</a>
	          </li>
	        </ul>
<!--
	        <div class="mb-5">
						<h3 class="h6 mb-3">Subscribe for newsletter</h3>
						<form action="#" class="subscribe-form">
	            <div class="form-group d-flex">
	            	<div class="icon"><span class="icon-paper-plane"></span></div>
	              <input type="text" class="form-control" placeholder="Enter Email Address">
	            </div>

	          </form>
					</div>
-->
	        <div class="footer">
	       <!-- 	<p>
						  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib.com</a>
						</p>
-->
	        </div>

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5 pt-5">
        <h2 class="mb-4">Sidebar #06</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </div>
		</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
  </body>
    
    <script>
        //혜진_200622_관리자 페이지 사이드 메뉴_메뉴를 클릭하면 색상을 흰->노랑으로 변경
        $(function(){
            $(".fa").parent("a").click(function(){
                $("li").removeClass("active");
                $(this).parent("li").addClass("active");
            });
        });
        //혜진_200622_관리자 페이지 사이드 메뉴_메인 메뉴 클릭하면 아래 서브메뉴 길이 확장
        $(function(){
            $(".main-list").children("li").children("a").click(function(){
                $(".sub-list").hide();
                $(this).parent().children("ul").show().slideDown(1000);
            });
            $(".sub-list").children("li").children("a").click(function(){
                $(this).parent("li").parent("ul").show();
            });
          });
    </script>
    
</html>