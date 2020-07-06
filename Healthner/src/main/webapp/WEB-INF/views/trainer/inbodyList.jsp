<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer List</title>
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>
	
	<!--회원목록 테이블 -->
	<section class="ftco-appointment">
			<div class="overlay"></div>
    	<div class="container col-md-6 appointment pl-md-5 py-md-5 ftco-animate align-items-center">
			<div class="row justify-content-center">
	    		<div class="col-md-8 text-center">
					<div class="heading-section mb-5">
						<span class="subheading"><small><i class="left-bar"></i>Services<i
								class="right-bar"></i></small></span>
						<h2 class="mb-1">
							인바디 리스트
						</h2>
					</div>
				</div>
			</div> 
			<input type="button" value="글쓰기" class="btn btn-secondary py-1 px-3 mr-2" id="btn" style="display:block; float: right;">            
		  <form action = "/healthner/trainer/inbodyInputFrm.do" id="inbodyInputFrm">
		 	 <input type="hidden" name="memberNo" value="${memberNo}">
		  </form>  
		 <table class="table" style="text-align: center;">
		  <thead>
		    <tr>
		      <th scope="col">No.</th>
		      <th scope="col">인바디</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach items="${list }" var="list"  varStatus="status">
		    <tr>
		      <th scope="row">${status.count }</th>
		      <td>
		      <form action="/healthner/trainer/inbodyGraph.do" id="beforeInbodyGraph">
		      	<a href="#" style="color: black; font-weight: bold;" class="click">${list.measureDate} 인바디</a>
		      	<input type="hidden" value="${list.inbodyNo }" name="inbodyNo">
		      	<input type="hidden" value="${list.memberNo }" name="memberNo">
		      </form>
		      </td>
		    </tr>
		   </c:forEach>
		  </tbody>
		</table>
              <div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		               <li>${pageNavi }</li>

		              </ul>
		            </div>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/resources/js/google-map.js"></script>
	<script src="/resources/js/main.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
		               
	<script>
		$(function(){
			$("#btn").click(function(){
				$("#inbodyInputFrm").submit();
			});
			$(".click").click(function(){
				var clickedOne = $(this).parent();
				var clickedOne = $(this).parent().submit();
			});
		});
	</script>
</body>
</html>