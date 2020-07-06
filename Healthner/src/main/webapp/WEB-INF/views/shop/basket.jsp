<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>Basket</title>
<link rel="icon" href="/resources/images/favicon.png">
<style>
.bloc_left_price {
	color: #c01508;
	text-align: center;
	font-weight: bold;
	font-size: 150%;
}

.category_block li:hover {
	background-color: #007bff;
}

.category_block li:hover a {
	color: #ffffff;
}

.category_block li a {
	color: #343a40;
}

.add_to_cart_block .price {
	color: #c01508;
	text-align: center;
	font-weight: bold;
	font-size: 200%;
	margin-bottom: 0;
}

.add_to_cart_block .price_discounted {
	color: #343a40;
	text-align: center;
	text-decoration: line-through;
	font-size: 140%;
}

.product_rassurance {
	padding: 10px;
	margin-top: 15px;
	background: #ffffff;
	border: 1px solid #6c757d;
	color: #6c757d;
}

.product_rassurance .list-inline {
	margin-bottom: 0;
	text-transform: uppercase;
	text-align: center;
}

.product_rassurance .list-inline li:hover {
	color: #343a40;
}

.reviews_product .fa-star {
	color: gold;
}

.pagination {
	margin-top: 20px;
}
</style>
<script>
	var array = new Array(); /* 상품가격 */
	var array2 = new Array(); /* 상품수량 */
	
	$(function(){
		/* var sum = $('input[name=sum]').val();
		var sum2 = $('input[name=sum2]').val();
		$('input[name=sum4]').val(sum3); */
		for(var i=0;i<array2.length;i++){
			console.log(array2[i]);
			
		}
		for(var i=0;i<array.length;i++){
			console.log(array[i]);
		}
		var submit = 0;
		for(var i=0;i<array2.length;i++){
			submit += array2[i]*array[i];
		}
		$('a[name=sum]').html(submit);
		$('strong[name=sum]').html(submit);
	});
	
</script>
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
						<h1 class="mb-3 bread">Basket</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>
		<div class="content">

			<div class="container mb-4">
				<div class="row">
					<div class="col-12">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
								
									<tr>
										<th scope="col"></th>
										<th scope="col">Product</th>
										<th scope="col"></th>
										<th scope="col" class="text-center">Stock</th>
										<th scope="col" class="text-right">Price</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<c:if test="${list[0].memberNo == sessionScope.member.memberNo }">
								<c:forEach items="${pv }" var="m">
								<script>
									array.push(${m.price });
									array2.push(${m.stock});
								</script>
								
									<tr>
									<input type="hidden" name="pno" value="${m.pno }">
										<td><img src="${m.thumbnail }" width='100px' height='80px' />
										</td>
										<td>${m.pname }</td>
										<td></td>
										<td><input class="form-control" type="text" value="${m.stock }"/></td>
										<td class="text-right">
											${m.price }
											
											
											 원</td>
										<td class="text-right">
											<button class="btn btn-sm btn-danger" onclick="deleteBasket(${m.pno},${sessionScope.member.memberNo });">
												<i class="fa fa-trash"></i>
											</button>
										</td>
									</tr>
									</c:forEach>
								</c:if>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>Total</td>
										<td class="text-right"><a name="sum"></a></td>
									</tr>
									
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td><strong>Total</strong></td>
										<td class="text-right"><strong name="sum"></strong></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="col mb-2">
						<div class="row">
							<div class="col-sm-12  col-md-6">
								<button class="btn btn-block btn-light">Continue
									Shopping</button>
							</div>
							<div class="col-sm-12 col-md-6 text-right">
								<button class="btn btn-lg btn-block btn-success text-uppercase">Checkout</button>
							</div>
						</div>
					</div>
				</div>
			</div>
				<!-- 여기까지 컨텐츠 -->



		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script>
	 function deleteBasket(pno,memberNo){
		/* var test = $(this).val(); */
		var pno = pno;
		var memberNo = memberNo;
		location.href = "/deleteBasket.do?pno="+pno+"&memberNo="+memberNo;
	} 
	</script>

</body>
</html>