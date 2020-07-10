<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="hero-wrap"
			style="background-image: url('/resources/images/bg_1.jpg');">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
						<br> <br>
						<h1 class="mb-3 bread"><a href="/healthner/shop/shop.do?reqPage=1">SHOP</a></h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="/healthner/shop/basketList.do?memberNo=${sessionScope.member.memberNo}">장바구니보기</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>