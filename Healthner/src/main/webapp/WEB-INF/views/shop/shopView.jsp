<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shop</title>
<link rel="icon" href="/resources/images/favicon.png">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<style>
	.gallery-wrap .img-big-wrap img {
    height: 450px;
    width: auto;
    display: inline-block;
    cursor: zoom-in;
}


.gallery-wrap .img-small-wrap .item-gallery {
    width: 60px;
    height: 60px;
    border: 1px solid #ddd;
    margin: 7px 2px;
    display: inline-block;
    overflow: hidden;
}

.gallery-wrap .img-small-wrap {
    text-align: center;
}
.gallery-wrap .img-small-wrap img {
    max-width: 100%;
    max-height: 100%;
    object-fit: cover;
    border-radius: 4px;
    cursor: zoom-in;
}
	</style>
</head>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />





		<section class="hero-wrap"
			style="background-image: url('/resources/images/bg_1.jpg');">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
						<br> <br>
						<h1 class="mb-3 bread">Place title here</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<div class="content">

			<div class="card">
				<div class="row">
					<aside class="col-sm-5 border-right">
						<article class="gallery-wrap">
							<div class="img-big-wrap">
								<div>
								<img src="${p.thumbnail }" width="250px" height="250px">
								</div>
							</div>
							<!-- slider-product.// -->
							<!-- <div class="img-small-wrap">
								<div class="item-gallery">
									<img src="https://s9.postimg.org/tupxkvfj3/image.jpg">
								</div>
								<div class="item-gallery">
									<img src="https://s9.postimg.org/tupxkvfj3/image.jpg">
								</div>
								<div class="item-gallery">
									<img src="https://s9.postimg.org/tupxkvfj3/image.jpg">
								</div>
								<div class="item-gallery">
									<img src="https://s9.postimg.org/tupxkvfj3/image.jpg">
								</div>
							</div> -->
							<!-- slider-nav.// -->
						</article>
						<!-- gallery-wrap .end// -->
					</aside>
					<aside class="col-sm-7">
					<form action="/healthner/shop/basket.do" method="post">
						<article class="card-body p-5">
							<input type="hidden" value="${p.pno }" name="pno">
							<input type="hidden" value="${sessionScope.member.memberNo }" name="memberNo">
							<h3 class="title mb-3">${p.pname }</h3>

							<p class="price-detail-wrap">
								<span class="price h3 text-warning">
								<span class="currency">${p.price }</span>
								</span>
							</p>
							<!-- price-detail-wrap .// -->
							<dl class="item-property">
								<dt>Description</dt>
								<dd>
									<p>상품설명 적는곳</p>
								</dd>
							</dl>
							<dl class="param param-feature">
								<dt>1번카테고리</dt>
								<dd>${p.category }</dd>
							</dl>
							<!-- item-property-hor .// -->
							<dl class="param param-feature">
								<dt>2번카테로기</dt>
								<dd>${p.category2 }</dd>
							</dl>
							<!-- item-property-hor .// -->
							<dl class="param param-feature">
								<dt>3번카테고리</dt>
								<dd>${p.category3 }</dd>
							</dl>
							<!-- item-property-hor .// -->

							<hr>
							<div class="row">
								<div class="col-sm-5">
									<dl class="param param-inline">
										<dt>stock:</dt>
										<dd>
											<select class="form-control form-control-sm"
												style="width: 70px;" name="stock">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
											</select>
										</dd>
									</dl>
									<!-- item-property .// -->
								</div>
								<!-- col.// -->
								<div class="col-sm-7">
									<dl class="param param-inline">
										<dt>Size:</dt>
										<dd>
											<label class="form-check form-check-inline"> <input
												class="form-check-input" type="radio"
												name="inlineRadioOptions" id="inlineRadio2" value="option2">
												<span class="form-check-label">SM</span>
											</label> <label class="form-check form-check-inline"> <input
												class="form-check-input" type="radio"
												name="inlineRadioOptions" id="inlineRadio2" value="option2">
												<span class="form-check-label">MD</span>
											</label> <label class="form-check form-check-inline"> <input
												class="form-check-input" type="radio"
												name="inlineRadioOptions" id="inlineRadio2" value="option2">
												<span class="form-check-label">XXL</span>
											</label>
										</dd>
									</dl>
									<!-- item-property .// -->
								</div>
								<!-- col.// -->
							</div>
							<!-- row.// -->
							<hr>
							<c:if test="${not empty sessionScope.member }">
								<button type="submit"
								class="btn btn-lg btn-outline-primary text-uppercase"> <i
								class="fas fa-shopping-cart"></i> Add to cart
								</button>
							</c:if>
							<c:if test="${empty sessionScope.member }">
								<button type="button" onclick="loginplz()"
								class="btn btn-lg btn-outline-primary text-uppercase"> <i
								class="fas fa-shopping-cart"></i> Add to cart
								</button>
							</c:if>
							
						</article>
						<!-- card-body.// -->
						</form>
					</aside>
					<!-- col.// -->
				</div>
				<!-- row.// -->
			</div>
			<!-- card.// -->








		</div>


		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
<script>
	function loginplz(){
		alert("로그인이후 사용하실수 있습니다.");
		
	}
</script>
</body>
</html>