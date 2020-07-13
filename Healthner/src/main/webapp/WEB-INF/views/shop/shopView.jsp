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
		<jsp:include page="/WEB-INF/views/common/headerForShop.jsp"/>
		<section class="ftco-section bg-light">
		<div class="container">
		
		<div class="content">
<h1 class="bread" style="font-style:italic; font-weight:900;">Product View</h1><br><br>
			<div class="card">
				<div class="row">
					<aside class="col-sm-5 border-right">
						<article class="gallery-wrap">
							<div class="img-big-wrap">
								<div>
								<img src="/resources/upload/thumbnail/${p.thumbnail }" onerror="this.src='/resources/images/favicon.png'; this.onerror=null;" width="100%"
										height="225">
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
					<form action="/healthner/shop/basket.do?reqPage=1" method="post">
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
								<c:if test="${p.category eq 1}">
									<dd>국내상품</dd>
								</c:if>
								<c:if test="${p.category eq 2}">
									<dd>해외상품</dd>
								</c:if>
							</dl>
							<!-- item-property-hor .// -->
							<dl class="param param-feature">
								<dt>2번카테고리</dt>
								<c:if test="${p.category2 eq 1}">
									<dd>운동기구</dd>
								</c:if>
								<c:if test="${p.category2 eq 2}">
									<dd>보조식품</dd>
								</c:if>
								<c:if test="${p.category2 eq 3}">
									<dd>의류</dd>
								</c:if>
							</dl>
							<!-- item-property-hor .// -->
							<dl class="param param-feature">
								<dt>3번카테고리</dt>
								<c:if test="${p.category3 eq 1}">
									<dd>공용</dd>
								</c:if>
								<c:if test="${p.category3 eq 2}">
									<dd>남성</dd>
								</c:if>
								<c:if test="${p.category3 eq 3}">
									<dd>여성</dd>
								</c:if>
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
		
		</div>
		</section>
		
		<div>
			
		<section class="ftco-section bg-light">
		<div class="container">
		
		<h1 class="bread" style="font-style:italic; font-weight:900;">Product Detail</h1><br><hr><br>
			${p.pcontent }
		
		</div>
		
		</section>
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