<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
<link rel="icon" href="/resources/images/favicon.png">
</head>
<body>
	<c:if test="${empty sessionScope.member}">
		<script>
			location.href = "/";
		</script>
	</c:if>
	<!-- 기존 해더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- 트레이너 전용  -->
	<c:if
		test="${sessionScope.member.memberLevel eq 2 or sessionScope.member.memberLevel eq 3 }">
		<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp" />
	</c:if>
	<!-- 일반 회원 전용 -->
	<c:if test="${sessionScope.member.memberLevel eq 1 }">
		<jsp:include page="/WEB-INF/views/common/headerForMember.jsp" />
	</c:if>
	<!-- 관리자 전용 -->
	<c:if test="${sessionScope.member.memberLevel eq 4 }">
		<script>
			location.href = "/adminMain.do";
		</script>
	</c:if>

	<style>
		#picture{

			background-image: url();
		}
	</style>
	<script>
		
	</script>
	<section>
		<div class="wrapper d-flex align-items-stretch">
			<nav id="sidebar">
				<div class="p-4 pt-5">
		  		<img class="img-circle" src="/resources/profile/train.png" onerror="this.src='/resources/profile/noprofile.png'">
	        <ul class="list-unstyled components mb-5">
	          <li class="active">
	            <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
	            <ul class="collapse list-unstyled" id="homeSubmenu">
                <li>
                    <a href="#">Home 1</a>
                </li>
                <li>
                    <a href="#">Home 2</a>
                </li>
                <li>
                    <a href="#">Home 3</a>
                </li>
	            </ul>
	          </li>
	          <li>
	              <a href="#">About</a>
	          </li>
	          <li>
              <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
              <ul class="collapse list-unstyled" id="pageSubmenu">
                <li>
                    <a href="#">Page 1</a>
                </li>
                <li>
                    <a href="#">Page 2</a>
                </li>
                <li>
                    <a href="#">Page 3</a>
                </li>
              </ul>
	          </li>
	          <li>
              <a href="#">Portfolio</a>
	          </li>
	          <li>
              <a href="#">Contact</a>
	          </li>
	        </ul>

	        

	      </div>
    	</nav>

        <!-- Page Content  -->
      <div id="content" class="p-4 p-md-5">

        

        <h2 class="mb-4">Sidebar #01</h2>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
      </div>
		</div>
	</section>


	<section>
		<div class="d-flex" id="wrapper">
			 <!-- Sidebar -->
			 <div class="bg-light border-right" id="sidebar-wrapper">
				<div class="sidebar-heading">Start Bootstrap </div>
				<div class="list-group list-group-flush">
				  <a href="#" class="list-group-item list-group-item-action bg-dark">Dashboard</a>
				  <a href="#" class="list-group-item list-group-item-action bg-light">Shortcuts</a>
				  <a href="#" class="list-group-item list-group-item-action bg-light">Overview</a>
				  <a href="#" class="list-group-item list-group-item-action bg-light">Events</a>
				  <a href="#" class="list-group-item list-group-item-action bg-light">Profile</a>
				  <a href="#" class="list-group-item list-group-item-action bg-light">Status</a>
				</div>
			  </div>

			  <div>
				  비밀번호 수정하기
				  <button type="button" class="btn btn-primary" id="password">수정</button>
				  <br> 주소 수정
				  <button type="button" class="btn btn-primary" id="address">수정</button>
				  <br>
				  <!-- Make sure the person knows that they need to verify the mail before having access to the account -->
				  이메일 수정
				  <button type="button" class="btn btn-primary" id="">수정</button>
				  <br> 이용권 구매
				  <button type="button" class="btn btn-primary">구매하러 가기</button>
				  <br>
	  
				  <c:if test="${empty sessionScope.member.expireDate}">
					  <a href="/healthner/member/pricing.do">이용권 구매</a>
					  <br>
				  </c:if>
				  <c:if test="${not empty sessionScope.member.expireDate}">
					  이용권 만료일자 : ${sessionScope.member.expireDate} <br>
				  </c:if>
				  <a href="">구매내역</a> <a href="">상품리뷰</a>
			  </div>
			  
		</div>

	</section>


	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>