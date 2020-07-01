<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
    <section class="hero-wrap" style="background-image: url('/resources/images/bg_2.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">MY PAGE</h1>
            <p class="breadcrumbs">
            	<span class="mr-2"><a href="/healthner/member/mypageFrm.do">My Info</a></span>
            	<span class="mr-2"><a href="/healthner/member/myEat.do?memberNo=${sessionScope.member.memberNo }&reqPage=1">My Eat</a></span>
            	<span class="mr-2"><a href="/healthner/member/myTrainer.do">My Trainer</a></span>
            	<span class="mr-2"><a href="/healthner/member/attendanceRead.do?memberNo=${sessionScope.member.memberNo }">My Attendance</a></span>
            	<span class="mr-2"><a href="/healthner/mail/receiveList.do?reqPage=1">My Mail</a></span>
            </p>
          </div>
        </div>
      </div>
    </section>