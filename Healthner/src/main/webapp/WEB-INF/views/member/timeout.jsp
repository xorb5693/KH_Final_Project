<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
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
            <h1 class="mb-3 bread">Validation</h1>
            
          </div>
        </div>
      </div>
    </section>
    <section class="hero-wrap">
        <div class="container">
            <h1 class="mb-3 bread">시간이 만료 되었습니다</h1>
            <h2 class="mb-2 bread">
              기간이 만료 되었습니다 
              <a href="/healthner/member/resend.do?memberId=${memberId}">
                다시 인증하기
              </a>
            </h2>
        </div>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>