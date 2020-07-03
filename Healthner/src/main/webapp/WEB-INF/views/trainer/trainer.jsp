<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trainer Intro</title>
 <link
	href="https://fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,500,500i,700,700i,900,900i&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">

<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">

<link rel="stylesheet" href="/resources/css/aos.css">

<link rel="stylesheet" href="/resources/css/ionicons.min.css">

<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<style>	
	* {
  margin: 0;
  padding: 0;
}

body {
  margin: 100px;
}

.pop-layer .pop-container {
  padding: 20px 25px;
}

.pop-layer p.ctxt {
  color: #666;
  line-height: 25px;
}

.pop-layer .btn-r {
  width: 100%;
  margin: 10px 0 20px;
  padding-top: 10px;
  border-top: 1px solid #DDD;
  text-align: right;
}

.pop-layer {
  display: none;
  position: absolute;
  top: 50%;
  left: 50%;
  width: 410px;
  height: auto;
  background-color: #fff;
  border: 5px solid #3571B5;
  z-index: 10;
}

.dim-layer {
  display: none;
  position: fixed;
  _position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  z-index: 100;
}

.dim-layer .dimBg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: #000;
  opacity: .5;
  filter: alpha(opacity=50);
}

.dim-layer .pop-layer {
  display: block;
}

a.btn-layerClose {
  display: inline-block;
  height: 25px;
  padding: 0 14px 0;
  border: 1px solid #304a8a;
  background-color: #3f5a9d;
  font-size: 13px;
  color: #fff;
  line-height: 25px;
}

a.btn-layerClose:hover {
  border: 1px solid #091940;
  background-color: #1f326a;
  color: #fff;
}
.displayNone{
	display: block;
	display: none;
}
.img{
	border: none;
}
.profileImg{
	width: 500px;
	heigth: 600px;
}
	
</style>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">TRAINERS</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="trainer.do">Trainer Intro</a></span> <span class="mr-2"><a href="customerList.do">My Customer </a></span> <span class="mr-2"><a href="trainerInputFrm.do">Edit Info</a></span></p>
          </div>
        </div>
      </div>
    </section>
	
	<!-- 트레이너 인트로 -->
	
	<!-- 가입된 트레이너 정보 가져오기  -->
		<section class="ftco-section bg-light">
    	<div class="container px-4">
    		<div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<h3 class="subheading">Shape Your Body</h3>
            <h2 class="mb-1">Our Coaches</h2>
          </div>
        </div>
        
    		<div class="row">
    		 <c:forEach items="${list }" var="list">
    			<div class="col-lg-3 d-flex">
    				<div class="coach align-items-stretch">
	    				<div class="img ftco-animate" style="width: 200px; height: 300px;" 
	    				id="myImg" data-toggle="modal" data-target="#readPostscript" onclick="readPostscript(this)">
	    					<input type="image" src="/resources/profile/${list.memberProfile }" style="width: 200px; height: 300px;" value="${list.memberProfile }">
	    				</div>
	    				<button type="button" class="btn displayNone"></button>
	    				<div class="text pt-3 ftco-animate">
	    					<h3>${list.memberName }</h3>
	    					<p>주특기 1 : ${list.catFirstName }</p>
	    					<p>주특기 2 : ${list.catSecondName }</p>
	    					<p>주특기 3 : ${list.catThirdName }</p>
	    					<input type="hidden" value="${list.trainerIntro }">
	    				</div>
	    			</div>
    			</div>
    			</c:forEach>
    		</div>	
    	</div>
    </section>
    
<!-- The Read Modal -->
    <div class="modal" id="readPostscript">
        <div class="modal-dialog">
            <div class="modal-content">        
                <!-- Modal body -->
                <div class="modal-body" id="readImage">
                	<input id="readImage2" class="d-flex align-items-center" type="image" style="width: 350px; height: 500px;">
                </div>
                <div class="col-md-6 text pt-4 pt-md-0" id="readArea">
                </div>
                
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
                
            </div>
        </div>
    </div>

            
            
            
            
            
            
            
            
            
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
    <script>
    function readPostscript(btn) {
    	$("#readArea").html($(btn).next().next().children("input[type=hidden]").val());
    	var imagePlace = $(btn).children().val();
    	console.log(imagePlace);
    	$("#readImage2").attr("src","/resources/profile/" + imagePlace);
    	

    }
    
    function closeModal(btn) {
        $("#modifyTextarea").val($("#readArea").html());
        $(btn).next().click();
    }
    
    </script>
	
	
	
	
	
</body>
</html>