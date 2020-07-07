<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<section class="hero-wrap" style="background-image: url('/resources/images/bg_02.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">About Us</h1>
          </div>
        </div>
      </div>
    </section>
  
    <section class="ftco-section ftco-about">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div class="img img-video d-flex align-items-center"
              style="background-image: url(/resources/images/about.jpg);">
              <div class="video justify-content-center">
                <a href="https://vimeo.com/45830194"
                  class="icon-video popup-vimeo d-flex justify-content-center align-items-center">
                  <span class="ion-ios-play"></span>
                </a>
              </div>
            </div>
            <div class="thumb-wrap d-flex">
              <a href="#" class="thumb img"
                style="background-image: url(/resources/images/program-1.jpg);"></a>
              <a href="#" class="thumb img"
                style="background-image: url(/resources/images/program-2.jpg);"></a>
              <a href="#" class="thumb img"
                style="background-image: url(/resources/images/program-3.jpg);"></a>
            </div>
          </div>
          <div class="col-md-6 pl-md-5 ftco-animate d-flex align-items-center">
            <div class="text pt-4 pt-md-0">
              <div class="heading-section mb-4">
                <span class="subheading">Welcome</span>
                <h2 class="mb-1">
                  Welcome to <span>Endurance</span> Crossfit Gym
                </h2>
              </div>
              <p>A small river named Duden flows by their place and supplies
                it with the necessary regelialia. It is a paradisematic country,
                in which roasted parts of sentences fly into your mouth. Far far
                away, behind the word mountains, far from the countries Vokalia
                and Consonantia, there live the blind texts. Separated they live
                in Bookmarksgrove right at the coast of the Semantics, a large
                language ocean.</p>
              <p>
                <a href="#" class="btn btn-primary p-3">Join us</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- google map api -->
    <section>
      <div id="kakaomap" style="width: 700px; height: 500px;">

      </div>
    </section>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33549e4f7958e9c5c0db54ab321263c8"></script>
    <script>
      $(document).ready(function(){
        var container = document.getElementById("kakaomap");
        var options = {
          center: new kakao.maps.LatLng(37.533190, 126.896370),
          level: 3
        };
        
        var map = new kakao.maps.Map(container,options);

      });
    </script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>