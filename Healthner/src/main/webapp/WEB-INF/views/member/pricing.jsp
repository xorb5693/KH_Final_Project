<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <script
  type="text/javascript"
  src="http://code.jquery.com/jquery-3.3.1.js"
></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <script>
		function payment(){
			console.log("working");
		}
    </script>


    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
            <h1 class="mb-3 bread">Membership</h1>
          </div>
        </div>
      </div>
    </section>

    <!-- Membership Price -->
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-3">
				<div class="col-md-7 heading-section ftco-animate text-center">
					<span class="subheading"><small><i class="left-bar"></i>Pricing
							Tables<i class="right-bar"></i></small></span>
					<h2 class="mb-1">Membership Plans</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 ftco-animate">
					<div class="block-7">
						<div class="text-center">
							<h2 class="heading">하루 트레이닝</h2>
							<span class="price"><sup>&#8361;</sup> <span class="number" style="font-size: 3.3em;">15,000</span></span>
							<span class="excerpt d-block">하루 무제한 이용권</span> 
							<c:if test="${not empty sessionScope.member}">
								<a href="/healthner/member/payment.do?amount=15000" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>
							</c:if>
							<c:if test="${empty sessionScope.member}">
								<a href="/healthner/member/loginFrm.do" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>
							</c:if>

							<h3 class="heading-2 mb-4">Enjoy All The Features</h3>

							<ul class="pricing-text">
								<li>헬스장의 모든 시설을 이용가능</li>
								<li>GX 트레이닝 참여</li>
								<li>휘트니스 오리언테이션</li>
								<li>트레이너 1:1 상담 무료</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="block-7">
						<div class="text-center">
							<h2 class="heading">정기권 결제</h2>
							<span class="price"><sup>&#8361;</sup> <span class="number" style="font-size: 3.3em;">30,000</span></span>
							<span class="excerpt d-block">이용권 결제</span> 
							
							<c:if test="${not empty sessionScope.member}">
								<a href="/healthner/member/payment.do?amount=30000" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>
							</c:if>
							<c:if test="${empty sessionScope.member}">
								<a href="/healthner/member/loginFrm.do" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>
							</c:if>
							
							<h3 class="heading-2 mb-4">Enjoy All The Features</h3>
							
							<ul class="pricing-text">
								<li>매달 2회 GX 트레이닝 참여</li>
								<li>10회 트레이너 1:1 상담</li>
								<li>한달에 한번 식단 평가</li>
								<li>트레이너 1:1 상담 무료</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-md-4 ftco-animate">
					<div class="block-7">
						<div class="text-center">
							<h2 class="heading">일년 이용권</h2>
							<span class="price"><sup>&#8361;</sup> <span class="number" style="font-size: 3.3em;">125,000</span></span>
							<span class="excerpt d-block">All features are included</span> 
							<c:if test="${not empty sessionScope.member}">
								<a href="/healthner/member/payment.do?amount=125000" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>
							</c:if>
							<c:if test="${empty sessionScope.member}">
								<a href="/healthner/member/loginFrm.do" class="btn btn-primary d-block px-2 py-4 mb-4">Get Started</a>
							</c:if>
							
							<h3 class="heading-2 mb-4">Enjoy All The Features</h3>
							
							<ul class="pricing-text">
								<li>GX 트레이닝 무제한 참여</li>
								<li>매달 트레이너 2회 상담</li>
								<li>담당 트레이너 지정</li>
								<li>트레이너 1:1 상담 무료</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			

			<div class="row mt-5">
				<div class="col-md-4">
					<div class="services d-flex ftco-animate">
						<div
							class="icon-2 d-flex justify-content-center align-items-center">
							<span class="flaticon-ruler"></span>
						</div>
						<div class="text px-md-2 pl-4">
							<h3>1K+ Equipment</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="services d-flex ftco-animate">
						<div
							class="icon-2 d-flex justify-content-center align-items-center">
							<span class="flaticon-gym"></span>
						</div>
						<div class="text px-md-2 pl-4">
							<h3>Open 24/7</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="services d-flex ftco-animate">
						<div
							class="icon-2 d-flex justify-content-center align-items-center">
							<span class="flaticon-tools-and-utensils"></span>
						</div>
						<div class="text px-md-2 pl-4">
							<h3>Food Supply</h3>
							<p>A small river named Duden flows by their place and
								supplies it with the necessary regelialia. It is a paradisematic
								country</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>