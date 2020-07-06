<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
    <section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">TRAINERS</h1>
            <p class="breadcrumbs">
	            <c:if test="${sessionScope.member.memberLevel == 3 }">
	            	<span class="mr-2"><a href="/healthner/trainer/trainer.do">Trainer Intro</a></span> 
	            	<span class="mr-2"><a href="/healthner/trainer/customerList.do">My Customer </a></span> 
	            	<span class="mr-2"><a href="/healthner/trainer/oneTrainerInfo.do">My Info</a></span>
	            	<span class="mr-2"><a href="/healthner/trainer/trainerInputFrm.do">Edit Info</a></span>
	            </c:if>
            </p>
          </div>
        </div>
      </div>
    </section>