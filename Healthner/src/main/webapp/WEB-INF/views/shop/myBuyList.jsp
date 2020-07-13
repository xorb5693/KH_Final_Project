<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>My Buy List</title>
<link rel="icon" href="/resources/images/favicon.png">
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/album/">

<!-- Bootstrap core CSS -->
<link href="../assets/dist/css/bootstrap.css" rel="stylesheet">
<link href="album.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
    
    .span.span-primary {
            background: #fcd307;
            border-color: #fcd307;
            border: 1px solid #fcd307;
            color: #fff;
        }

        .span {
            -webkit-border-radius: 40px;
            -moz-border-radius: 40px;
            -ms-border-radius: 40px;
            border-radius: 40px;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            font-size: 14px;
            -webkit-border-radius: 40px;
            -moz-border-radius: 40px;
            -ms-border-radius: 40px;
            border-radius: 40px;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            font-size: 14px;
            display: inline-block;
            font-weight: 400;
            color: #212529;
            text-align: center;
            vertical-align: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            background-color: transparent;
            border: 1px solid transparent;
            padding: 0.375rem 0.75rem;
            font-size: 1rem;
            line-height: 1.5;
            border-radius: 0.25rem;
            -webkit-transition: color 0.15s ease-in-out, background-color 0.15s
                ease-in-out, border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s
                ease-in-out;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
                border-color 0.15s ease-in-out, -webkit-box-shadow 0.15s ease-in-out;
            -o-transition: color 0.15s ease-in-out, background-color 0.15s
                ease-in-out, border-color 0.15s ease-in-out, box-shadow 0.15s
                ease-in-out;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
                border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            transition: color 0.15s ease-in-out, background-color 0.15s ease-in-out,
                border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out,
                -webkit-box-shadow 0.15s ease-in-out;
        }

        .span, .btn {
            margin-left: 10px;
            margin-right: 10px;
        }

        .pageNavi {
            text-align: center;
        }

        .table td, .table th, .table td div {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .table {
            table-layout: fixed;
        }
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <jsp:include page="/WEB-INF/views/common/headerForShop.jsp" />
	<section class="ftco-section ftco-about">
        <div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center fadeInUp ftco-animated">
                    <span class="subheading">
                        <small>
                            <i class="left-bar"></i>
                            ${sessionScope.member.memberName}
                            <i class="right-bar"></i>
                        </small>
                    </span>
                    <h2 class="mb-1">My Buy List</h2>
                </div>
            </div>
            <table class="table">
            <thead>
                <tr>
                    <th scope="col" style="width: 10%">이미지</th>
                    <th scope="col" style="width: 45%">이름</th>
                    <th scope="col" style="width: 14.5%">가격</th>
                    <th scope="col" style="width: 14.5%">구매자</th>
                    <th scope="col" style="width: 15%">구매일</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list}" var="purchase">
	                <tr>
	                	<td><img src="/resources/upload/thumbnail/${purchase.thumbnail }" style="width: 100%"></td>
                        <td><a class="tg-black" href="/healthner/shop/myBuyRead.do?buyNo=${purchase.buyNo}"><div>${purchase.pname}</div> <c:if test="${purchase.count ne 0}">외 ${purchase.count}개</c:if></a></td>
                        <td>${purchase.totalPrice}</td>
                        <td>${purchase.memberId}</td>
                        <td>${purchase.buyDate}</td>
	                </tr>
                </c:forEach>
            </tbody>
		</table>
		<div class="pageNavi">${pageNavi}</div>
        </div>
    </section>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script>
		window.jQuery
				|| document
						.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')
	</script>
	<script src="../assets/dist/js/bootstrap.bundle.js"></script>
</body>
</html>