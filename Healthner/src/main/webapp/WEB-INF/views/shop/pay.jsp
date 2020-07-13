<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>pay</title>
<link rel="icon" href="/resources/images/favicon.png">

<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
						<h1 class="mb-3 bread">Pay</h1>
						<p class="breadcrumbs"></p>
					</div>
				</div>
			</div>
		</section>
		<div class="content">${p.totalPrice }</div>
		<script>
			$(function() {
				/* var price = $("#pay span").html(); */
				//                console.log($("#pay span").html());
				var d = new Date();
				var date = d.getFullYear() + "" + (d.getMonth() + 1) + ""
						+ d.getDate() + "" + d.getHours() + "" + d.getMinutes()
						+ "" + d.getSeconds();
				IMP.init("imp62087111");
				IMP.request_pay({
					merchant_uid : '상품명_' + date,
					name : '결제테스트',
					/* amount: '${p.totalPrice}', */
					amount : '${p.totalPrice }',
					buyer_email : '${sessionScope.member.email}',
					buyer_name : '${sessionScope.member.memberName}',
					buyer_tel : '${sessionScope.member.phone}',
					buyer_addr : '${p.buyAddr}',
					buyer_postcode : '${sessionScope.member.zip}'
				}, function(rsp) {
					if (rsp.success) {
						var msg = "결제가 완료되었습니다.";
						var r1 = "고유 ID : " + rsp.imp_uid;
						var r2 = "상점 거래 아이디 : " + rsp.merchant_uid;
						var r3 = rsp.paid_amount;
						var r4 = "카드 승인번호 : " + rsp.apply_num;
						var r5 = ${p.memberNo};
						var r6 = rsp.buyer_addr;
						alert(msg + "\n" + r1 + "\n" + r2 + "\n" + r3 + "\n"
								+ r4 + "\n" + r5+ "\n" + r6);
						location.href="/healthner/shop/paySuccess.do?totalPrice="+r3+"&memberNo="+r5+"&buyAddr="+r6;

					} else {
						
						alert('결제실패 : ' + rsp.error_msg);
						location.href="/healthner/shop/shop.do?reqPage=1";
						/* alert('결제실패 : ' + rsp.error_msg); */
					}
				});
			});
		</script>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- // location.href="/healthner/shop/paySuccess.do?totalPrice="+r3+"&memberNo="+r5+"&stock="+r6+"&pno="+r7; */ -->
	<%-- /* 	
							 */ --%>
</body>
</html>