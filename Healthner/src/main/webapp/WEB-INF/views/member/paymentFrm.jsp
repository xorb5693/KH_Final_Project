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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="/resources/images/favicon.png">
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/header.jsp"/>
   <section class="hero-wrap" style="background-image: url('/resources/images/bg_02.jpg');">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
          <br><br>
            <h1 class="mb-3 bread">Payment</h1>
          </div>
        </div>
      </div>
    </section>
  
    <section>
      <div class="container">
        
      </div>
    </section>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>