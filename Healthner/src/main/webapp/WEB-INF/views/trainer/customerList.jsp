<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
</head>
<style>
.table2>td {
	padding: 0.75rem;
	vertical-align: middle;
	border-top: 1px solid #dee2e6;
}
</style>
<body>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>

	<!--회원목록 테이블 -->
	<section class="ftco-appointment">
		<div class="overlay"></div>
		<div
			class="container col-md-9 appointment pl-md-5 py-md-5 ftco-animate align-items-center">

			<h3 class="mb-3">Customer List</h3>
				<div class="table-responsive">
					<table class="table2 table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th>번호</th>
								<th>회원이름</th>
								<th>회원 사진</th>
								<th colspan="2">PT횟수</th>
								<th>이용권만기일</th>
							</tr>
						<c:forEach items="${list}" var="memberList" varStatus="status">						
							<tbody class="table2">							
								<tr>								
									<td rowspan="2">${status.count }</td>
									<td rowspan="2">
										<form action="customerInfo.do" class="appointment-form" name="customer">							
												<input type="hidden" name="memberNo" value="${memberList.memberNo }">
												<input type="hidden" name="memberName" value ="${memberList.memberName }">
												<input type="submit" value="${memberList.memberName}" style="border: none; background-color: white;">										
										</form>
									</td>
									<td rowspan="2" style="text-align: center;">
										<a href="#"><img onclick="imgClick(this)" class="img" src="/resources/profile/${memberList.memberProfile}" width="70px;" height="80px;"></a>
									</td>							
									<td rowspan="2">
										<!-- training_cnt -->
										<form action="customerCntUpdate.do" class="appointment-form" name="customerCntUpdate">
											<input type="hidden" name="trainingCnt" value="${memberList.trainingCnt }">
											<input type="hidden" name="memberNo" value="${memberList.memberNo }">
											<input type="hidden" name="trainingMaxcnt" value="${memberList.trainingMaxcnt }">
											${memberList.trainingCnt }/${memberList.trainingMaxcnt }											
										</form>
									</td>								
									<td width="70px;">								
										<!-- 버튼 script로 submit -->
										<input type="button" value="횟수증가"
										class="btn btn-primary py-1 px-1" name="increaseBtn"><br>
										<input type="button" value="횟수차감"
										class="btn btn-primary py-1 px-1" name="decreaseBtn"></td>									
									<td rowspan="2">${memberList.expireDate}</td>
								</tr>								
							</tbody>
						</c:forEach>
					</table>
				</div>
				
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
	<script>
		function imgClick(img){
			var imgClick = $(img).parent().parent().prev().children();
			imgClick.submit();
		}
	
		$(function() {				
			$("input[name=increaseBtn]").click(function() {
				var plusNum = Number($(this).parent().prev().children().children().val())+1;	
				var plusNum2 = Number($(this).parent().prev().children().children().next().val());
				$(this).parent().prev().children().children().eq(0).val(plusNum);
				$(this).parent().prev().children().children().eq(1).val(plusNum2);
				var form = $(this).parent().prev().children();
				var maxCnt = Number($(this).parent().prev().children().children().eq(2).val());
				if(plusNum <= maxCnt){
					form.submit();
				} else{
					alert("PT횟수를 모두 채웠습니다.");
				}
			});
			$("input[name=decreaseBtn]").click(function() {
				var minusNum = Number($(this).parent().prev().children().children().val())-1;
				var minusNum2 = Number($(this).parent().prev().children().children().next().val());
				Number($(this).parent().prev().children().children().eq(0).val(minusNum));
				$(this).parent().prev().children().children().eq(1).val(minusNum2);
				var form = $(this).parent().prev().children();
				if(minusNum > -1){
					form.submit();
				} else{
					alert("0 미만은 줄일 수 없습니다.");
				}
			});	
		});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>