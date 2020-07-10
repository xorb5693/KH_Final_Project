<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<!-- <script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->


<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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

h1 {
	font-style: italic;
	font-weight: 900;
}
</style>
<script>
	var array = new Array(); /* 상품가격 */
	var array2 = new Array(); /* 상품수량 */
	var array3 = new Array(); /* 상품넘버 */
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
		for(var i=0;i<array3.length;i++){
			console.log(array3[i]);
		}
		$('a[name=sum]').html(submit);
		$('strong[name=sum]').html(submit);
	});
	
</script>
</head>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForShop.jsp"/>
		<div class="content">
			<br> <br>
			<div class="container mb-4">
				<div class="row">
					<div class="col-12">
						<div class="table-responsive">
							<table class="table table-striped">
								<thead>
									<h1>Basket List</h1>
									<tr>
										<th scope="col"></th>
										<th scope="col">Product</th>
										<th scope="col"></th>
										<th scope="col" class="text-center">Stock</th>
										<th scope="col" class="text-right">Price</th>
										<th></th>
									</tr>
									<br>
								</thead>
								<tbody>
									<c:if
										test="${list[0].memberNo == sessionScope.member.memberNo }">
										<c:forEach items="${pv }" var="m">
											<script>
									array.push(${m.price });
									array2.push(${m.stock});
									array3.push(${m.pno});
								</script>

											<tr>
												<input type="hidden" name="pno" value="${m.pno }">
												<td><img src="${m.thumbnail }" width='100px'
													height='80px' /></td>
												<td>${m.pname }</td>
												<td></td>
												<td><input class="form-control" type="text"
													value="${m.stock }" /></td>
												<td class="text-right">${m.price }&#8361;</td>
												<td class="text-right">
													<button class="btn btn-sm btn-danger"
														onclick="deleteBasket(${m.pno},${sessionScope.member.memberNo });">
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
						<br>
						<div class="row">
							<div class="col-sm-12  col-md-6">
								<button class="btn btn-block btn-light">
									<a href="/healthner/shop/shop.do?reqPage=1">Continue
										Shopping</a>
								</button>
							</div>
							<div class="col-sm-12 col-md-6 text-right">
								<%-- <button class="btn btn-lg btn-block btn-success text-uppercase"
									type="button"
									onclick="checkOut('${sessionScope.member.detAddr}');">Checkout</button> --%>
								<button type="button"
									class="btn btn-lg btn-block btn-success text-uppercase"
									data-toggle="modal" data-target="#myModal"
									onclick="checkOut('${sessionScope.member.zip}','${sessionScope.member.roadAddr}','${sessionScope.member.detAddr}');">Checkout
								</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 여기까지 컨텐츠 -->
			<br> <br>
			<!-- The Modal -->
			<div class="modal" id="myModal">
				<div class="modal-dialog">
					<form action="/healthner/shop/buy.do" method="post">
					<input type="hidden" name="zip" value="${sessionScope.member.zip }">
					<input type="hidden" name="roadAddr" value="${sessionScope.member.roadAddr }">
					<input type="hidden" name="detAddr" value="${sessionScope.member.detAddr }">
						<div class="modal-content">
							<!-- Modal Header -->
							<div class="modal-header">
								<h4 class="modal-title">결제 정보 확인</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body" id="modal-content">
								<div class="col" id="address">

									<div class="col">
										우편번호:
										<button class="btn btn-ground" id="searchAddr" type="button">조회</button>

										<input type="text" id="old1" class="form-control"
											readonly />
									</div>
									<div class="col">
										도로명: <input type="text" id="old2"
											class="form-control" readonly />
									</div>
									<div class="col">
										상세주소: <input type="text" id="old3"
											class="form-control" placeholder="상세주소" />
									</div>
								</div>
							</div><!-- Modal footer -->
						<div class="modal-footer">
							<input type="submit" class="btn btn-success" 
								value="buy">
							<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
						</div>
						</div>


						
					</form>
				</div>
			</div>
		</div>

	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
	 function deleteBasket(pno,memberNo){ // 장바구니 비우기
		/* var test = $(this).val(); */
		var pno = pno;
		var memberNo = memberNo;
		location.href = "/healthner/shop/deleteBasket.do?pno="+pno+"&memberNo="+memberNo;
	}
	 function checkOut(zip,roadAddr,detAddr){ // 결제하기 준비듕
		 var modal = $("#modal-content");
		 
		 var modalf = $('.modal-footer');
		 
		 modal.find("p").remove();
		/*  modalf.find("input").remove(); */
		
		 
		 modal.append("<p id='oldaddr'>배송주소 : "+zip+" "+roadAddr+" "+detAddr+"</p>");
		 
		 modal.append("<p>배송받을 주소 새로 입력하기<input type='checkbox' id='newaddr'></a></p>");
			
		 var sum = $('strong[name=sum]').html();
		 console.log("구매테스트");
		 console.log(detAddr);
		 console.log(${sessionScope.member.memberNo});
		 console.log(sum);
		 
		 var arrPno = new Array();
		 var arrStock = new Array();
		 
		 modal.find($('#address')).hide(); // 새로운주소 입력창 숨기기
		 for(var i=0;i<array3.length;i++){	 
			 arrPno[i]=array2[i];
			 arrStock[i]=array3[i]; 
		 }
	
		 
		 $('#newaddr').click(function(){
			 
			 modal.find($('#oldaddr')).toggle(); // 기본주소 숨기고 나타내기
			 modal.find($('#address')).toggle(); // 새로운주소 입력창 숨기고 나타내기
			 if($('#newaddr').prop("checked")){
					$("#old1").prop("required",true);
                    $("#old1").val("");
					$("#old2").prop("required",true);
                    $("#old2").val("");
					$("#old3").prop("required",true);
                    $("#old3").val("");
			 }else{
				 $("input[name=zip]").val("${sessionScope.member.zip}");
				 $("input[name=roadAddr]").val("${sessionScope.member.roadAddr}");
				 $("input[name=detAddr]").val("${sessionScope.member.detAddr}");
				 $("#old1").prop("required",false);
				 $("#old2").prop("required",false);
				 $("#old3").prop("required",false);
			 } 
		 });
		 
		 // 여기서부터 결제정보에 넘길값 pname,totalprice,addr(3개) 넘기고 (5개) , 데이터베이스 basket에 있는값 pno에 따라서 stock (2갸) 줄이기위해 넘겨야함
		 modal.append("<input type='hidden' name='array3' value='"+arrPno+"'>");
		 modal.append("<input type='hidden' name='array2' value='"+arrStock+"'>");
		 modal.append("<input type='hidden' name='memberNo' value='"+${sessionScope.member.memberNo}+"'>");
		 modal.append("<input type='hidden' name='totalPrice' value='"+sum+"'>");
		 
			 
		 
		 
		 
		/*  modalf.append("<input type='submit' class='btn btn-success' value='buy'>"); */
		
	 }
	 $(function(){
		$("#old1").change(function(){
			$("input[name=zip]").val($(this).val());
		});

		$("#old2").change(function(){
			$("input[name=roadAddr]").val($(this).val());
		});

		$("#old3").keyup(function(){
			$("input[name=detAddr]").val($(this).val());
		});
         
		$("#old3").change(function(){
			$("input[name=detAddr]").val($(this).val());
		});
		
	 });
	 
	 //
	 $("#searchAddr").click(function () { //주소찾기 api 실행
          new daum.Postcode({
            oncomplete: function (data) {
              var addr = ""; // 주소 변수
              var extraAddr = ""; // 참고항목 변수

              if (data.userSelectedType === "R") {
                addr = data.roadAddress;
              } else {
                addr = data.jibunAddress;
              }

              if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                  extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                  extraAddr +=
                    extraAddr !== ""
                      ? ", " + data.buildingName
                      : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== "") {
                  extraAddr = " (" + extraAddr + ")";
                }
              }

              $("#old1").val(data.zonecode);
              $("#old1").change();
              $("#old2").val(addr);
              $("#old2").change();
              // 커서를 상세주소 필드로 이동한다.
              $("#old3").focus();
            },
          }).open();
        });
	 
	 
	</script>

</body>
</html>