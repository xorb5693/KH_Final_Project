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
</head>
<style>
	.table2>td {
	    padding: 0.75rem;
	    vertical-align: middle;
	    border-top: 1px solid #dee2e6;
	}
	

</style>
<body>

	
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>
	
	<!-- 트레이너 인트로 -->
	
	<!-- 가입된 트레이너 정보 가져오기
	<section class="ftco-section bg-light">
		<div class="container-fluid px-4">
			<c:forEach items="${list }" var="list">
				<div class="col-lg-3 d-flex">
    				<div class="coach align-items-stretch">
	    				<a class="img" style="background-image: url(images/trainer-1.jpg);"></a>
	    				</div>
	    				<div class="text pt-3 ftco-animate">
	    					<h3>${list.memberName }</a></h3>
	    					<p>${list.catFirst }</p><br>
	    					<p>${list.catSecond }</p><br>
	    					<p>${list.catThird }</p><br>
	    					<p></p>
	    				</div>
	    			</div>
    			</div>
			</c:forEach>
		</div>
	</section>
	 -->
	<!-- DataTales Example -->
	<section class="ftco-section bg-light">
          <div class="container mb-4 ftco-animate">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table2 table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>회원이름</th>
                      <th>회원 사진</th>
                      <th colspan="2">PT횟수</th>
                      <th>이용권만기일</th>
                    </tr>
                  </thead>
                  <tbody class="table2">
                    <tr>
                      <td rowspan="2">순서대로 번호</td>
                      <td rowspan="2">김기창</td>
                      <td rowspan="2">김기창 사진</td>
                      <td rowspan="2">2/10</td>
                      <td width="70px;">
                		<input type="submit" value="횟수증가" class="btn btn-primary py-1 px-1"><br>
                		<input type="submit" value="횟수차감" class="btn btn-primary py-1 px-1">
                      </td>
                      <td rowspan="2">만기일</td>
                    </tr>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
        <div class="row mt-5">
		          <div class="col text-center">
		            <div class="block-27">
		              <ul>
		                <li><a href="#">&lt;</a></li>
		                <li class="active"><span>1</span></li>
		                <li><a href="#">2</a></li>
		                <li><a href="#">3</a></li>
		                <li><a href="#">4</a></li>
		                <li><a href="#">5</a></li>
		                <li><a href="#">&gt;</a></li>
		              </ul>
		            </div>
		          </div>
		        </div>
	</section>
		        
		        
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->
	
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
</body>
</html>