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
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
  <script type="text/javascript">
    window.history.forward();

    function noBack() {
      window.history.forward();
    }
  </script>
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
      <section class="container">
        <div class="py-5 text-center">
          
          <h2 class="m-4" style="color: white;">이용권 구매</h2>
          <p class="lead m-2" style="color: white;">
            회원권을 구매 함으로써 고객님은 건강을 위한 첫 걸음을 밟으셨습니다.
          </p>
          <p class="lead m-2" style="color: white;">
            고객님께서 저희 서비스를 이용 함 으로써 개인 트레이닝을 집중적으로 받으시며 본인이 원하시는 몸에 한발 가까워습니다.
          </p>
        </div>
        <div class="row">
          <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
              <span class="text-muted" style="color: white;">결제 바구니</span>
            </h4>
            <ul class="list-group mb-3">
              <li
                class="list-group-item d-flex justify-content-between 1h-condensed"
              >
                <div>
                  <h6 class="my-0" >이용권 구매</h6>
                  <small class="text-muted"></small>
                </div>
                <span class="text-muted">${requestScope.amount}원</span>
              </li>
              <li class="list-group-item d-flex justify-content-between">
                <span>Total (KRW)</span> <strong class="price" id="price">${requestScope.amount}</strong>
              </li>
            </ul>
            <form class="card p-2">
              <div class="input-group">
                <input
                  type="text"
                  class="form-control"
                  placeholder="프로모션 코드"
                />
                <div class="input-group-append">
                  <button type="submit" class="btn btn-secondary">Redeem</button>
                </div>
              </div>
            </form>
          </div>
          <div class="col-md-8 order-md-1">
            <form
              class="needs-validation"
              action="/healthner/member/paymentComplete.do"
              id="payment"
              novalidate
            >
              <h4 class="mb-3" style="color: white;">결제 상세</h4>
              <div class="row">
                <div class="col-md-6 mb-3">
                  <label for="성" style="color: white;">이름 입력</label>
                  <input
                    type="text"
                    class="form-control"
                    id="성"
                    value="${sessionScope.member.memberName}"
                    required
                    readonly
                  />
                  <div class="invalid-feedback" style="color: white;">성 입력 필수</div>
                </div>
              </div>
              <div class="mb-3">
                <label for="username" style="color: white;">ID</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text">@</span>
                  </div>
                  <input
                    type="text"
                    class="form-control"
                    id="username"
                    value="${member.memberId}"
                    required
                    readonly
                  />
                  <div class="invalid-feedback" style="width: 100%;"></div>
                </div>
              </div>
              <div class="mb-3">
                <label for="email" style="color: white;"
                  >Email<span class="text-muted" style="color: white;">(Optional)</span></label
                >
                <input
                  type="email"
                  class="form-control"
                  id="email"
                  value="${member.email}"
                  readonly
                />
                <div class="invalid-feedback" style="color: white;">이메일을 다시 확인해주세요</div>
              </div>
              <div class="mb-3">
                <label for="addr" style="color: white;">주소<span style="color: white;">(필수 확인)</span></label>
                <input
                  type="text"
                  class="form-control"
                  id="addr"
                  value="${member.detAddr}"
                  readonly
                />
                <input type="hidden" name="zip" id="zip" value="${sessionScope.member.zip}">
                <input type="hidden" name="memberNo" id="memberNo" value="${sessionScope.member.memberNo}">
                <input type="hidden" name="price" id="" value="${requestScope.amount}">
              </div>
              <button
                type="button"
                class="btn btn-primary btn-lg btn-block checkout"
              >
                Continue to checkout
              </button>
            </form>
          </div>
        </div>
      </section>
      
    </section>
    <script>
      $(".checkout").click(function () {
        var price = $("#price").html();
        console.log(price);
        var d = new Date();
        var date =
          d.getFullYear() +
          "" +
          (d.getMonth() + 1) +
          "" +
          d.getHours() +
          "" +
          d.getMinutes() +
          "" +
          d.getSeconds();
        IMP.init("imp57751904");
        IMP.request_pay(
          {
            merchant_uid: "Healthner_" + date,
            name: "한달 이용권",
            amount: price,
            buyer_email: "${sessionScope.user.email}",
            buyer_name: "${sessionScope.user.userName}",
            buyer_tel: "${sessionScope.user.phone}",
            buyer_addr: "Kairos.co",
            buyer_postcode: "01234",
          },
          function (rsp) {
            if (rsp.success) {
              var r1 = $(
                "<input name='personalId' type='hidden' value='" +
                  rsp.imp_uid +
                  "'>"
              );
              var r2 = $(
                "<input name='merchantId' type='hidden' value='" +
                  rsp.merchant_uid +
                  "'>"
              );
              var r3 = $(
                "<input name='amount' type='hidden' value='" +
                  rsp.paid_amount +
                  "'>"
              );
              var r4 = $(
                "<input name='verifyNo' type='hidden' value='" +
                  rsp.apply_num +
                  "'>"
              );
              $("#payment").append(r1, r2, r3, r4);
              alert("결제가 완료되었습니다");
              $("#payment").submit();
              // 					$("#paymentResult").html(msg+"<br>"+r1+"<br>"+r2+"<br>"+r3+"<br>"+r4);
            } else {
              console.log("에러 내용: " + rsp.error_msg);
            }
          }
        );
      });
    </script>
  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>