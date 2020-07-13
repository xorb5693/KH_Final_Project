<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<script
  type="text/javascript"
  src="http://code.jquery.com/jquery-3.3.1.js"
></script>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="icon" href="/resources/images/favicon.png">
  </head>
  <body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    <section
      class="hero-wrap"
      style="background-image: url('/resources/images/bg_02.jpg');"
    >
      <div class="overlay"></div>
      <div class="container">
        <div
          class="row no-gutters slider-text align-items-center justify-content-center"
        >
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
            <br /><br />
            <h1 class="mb-3 bread">About Us</h1>
            <p class="breadcrumbs">
            	<span class="mr-2"><a href="/healthner/member/about.do">ABOUT</a></span>
            </p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section ftco-about">
      <div class="container">
        <div class="row">
          <div class="col-md-6">
            <div
              class="img img-video d-flex align-items-center"
              style="background-image: url(/resources/images/about.jpg);"
            >
              <div class="video justify-content-center">
                <a
                  href="https://vimeo.com/45830194"
                  class="icon-video popup-vimeo d-flex justify-content-center align-items-center"
                >
                  <span class="ion-ios-play"></span>
                </a>
              </div>
            </div>
            <div class="thumb-wrap d-flex">
              <a
                href="#"
                class="thumb img"
                style="background-image: url(/resources/images/program-1.jpg);"
              ></a>
              <a
                href="#"
                class="thumb img"
                style="background-image: url(/resources/images/program-2.jpg);"
              ></a>
              <a
                href="#"
                class="thumb img"
                style="background-image: url(/resources/images/program-3.jpg);"
              ></a>
            </div>
          </div>
          <div class="col-md-6 pl-md-5 ftco-animate d-flex align-items-center">
            <div class="text pt-4 pt-md-0">
              <div class="heading-section mb-4">
                <span class="subheading">Welcome</span>
                <h2 class="mb-1">
                  환영합니다 <br> <span> 헬트너쉽 </span> <br> 너는 내가 책임 GYM
                </h2>
              </div>
              <p>헬트너쉽과 함께 당신의 피트니스 스토리를 만들어보세요. 더 즐겁고 더 에너지 넘치는 일상을 위해 삶을 더욱 효율적으로 즐길 수 있는 ‘복합 피트니스 문화 플랫폼’으로 활기찬 라이프스타일을 제시하고자 합니다.</p>
              <p>
                <a href="#" class="btn btn-primary p-3">Join us</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section>
      <div class="pt-md-5 pt-5">
        <div class="row">
          <div class="col-md-6">
            <!-- google map api -->
            <div id="kakaomap" style="width: 500px; height: 400px;margin: 50px;"></div>

          </div>
          <div class="col-md-6">
            <div>
              
            </div>

          </div>
        </div>

      </div>

    </section>

    <script
      type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b48153ef48da1d16b36f37175dd3662"
    ></script>
    <script>
      var container = document.getElementById("kakaomap");
      var options = {
        center: new kakao.maps.LatLng(37.53319, 126.89637),
        level: 3,
      };

      var map = new kakao.maps.Map(container, options);

      // 마커가 표시될 위치입니다
      var markerPosition = new kakao.maps.LatLng(37.53319, 126.89637);

      // 마커를 생성합니다
      var marker = new kakao.maps.Marker({
        position: markerPosition,
      });

      // 마커가 지도 위에 표시되도록 설정합니다
      marker.setMap(map);

      var iwContent =
          '<div style="height:60px;padding:5px;width:90px;">헬트너십 <br><a class="btn btn-primary btn-sm" href="https://map.kakao.com/link/map/Healthner,37.53319, 126.89637" target="_blank">큰지도보기</a> </div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
        iwPosition = new kakao.maps.LatLng(37.53319, 126.89637); //인포윈도우 표시 위치입니다

      // 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
        position: iwPosition,
        content: iwContent,
      });
      infowindow.open(map,marker);
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
  </body>
</html>
