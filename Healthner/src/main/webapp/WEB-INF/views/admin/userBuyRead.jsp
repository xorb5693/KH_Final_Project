<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 구매 관리</title>
  	<link rel="icon" href="/resources/images/favicon.png">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/admin/css/style.css">
    <style>
        #content>button {
            float: right;
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
        
        .col-xs-12 {
            width: 100%;
        }
        
        .title-content {
            font-family: NotoSansCJKkr-M;
            padding: 10px 0 0 15px;
            font-size: 16px;
            color: #212121;
            font-weight: 700;
        }
        
        .title-area {
            border-top: 1px solid #d8d8d8;
            height: 48px;
            background-color: #f5f5f5;
        }
        
        .info-area {
            margin: 25px 0 25px 0;
        }
        
        .form-group {
            margin-bottom: 15px;
        }
        
        .row {
            margin-right: -15px;
            margin-left: -15px;
        }
        
        .label-style {
            font-weight: bold;
            color: #212121;
            font-size: 14px;
        }
        
        .info-style {
            font-weight: normal;
            color: #212121;
            font-size: 14px;
            padding-left: 0px !important;
        }
        
        .table-header {
            background-color: #f5f5f5;
        }
        
        #traceTable td {
            font-size: 14px;
        }
    </style>
</head>
<body>
	<!-- 혜진_200624_메뉴바 삽입 -->
 	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />
    <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

    <!-- Page Content  -->
    <!--  태규_200708_페이지 제작  -->
    <div id="content" class="p-4 p-md-5 pt-5">
        <h2 class="mb-4">User Buy Read</h2>
            
		<br>
		<br>
		<table class="table">
            <tr>
                <th scope="row">구매자</th>
                <td colspan="2">${purchase.memberId}</td>
                <th scope="row">가격</th>
                <td colspan="2">${purchase.totalPrice}</td>
            </tr>
            <tr>
                <th scope="row">주소</th>
                <td colspan="5">${purchase.buyAddr}</td>
            </tr>
            <tr>
                <th scope="row">송장번호</th>
                <td colspan="5">
                    ${purchase.invoiceNumber}
                    <button type="button" id="modal"
                    class="btn btn-primary ftco-animate fadeInUp ftco-animated"
                    data-toggle="modal" data-target="#myModal">
                        <c:if test="${purchase.deliveryBool eq 0}">
                            송장번호 입력
                        </c:if>
                        <c:if test="${purchase.deliveryBool eq 1}">
                            송장번호 수정
                        </c:if>
                    </button>
                    <c:if test="${purchase.deliveryBool eq 1}">
                        <button type="button" id="trace" class="btn btn-primary ftco-animate fadeInUp ftco-animated" data-toggle="modal" data-target="#parcelTrace">택배배송 추적</button>
                    </c:if>
                </td>
            </tr>
            <tr>
                <th scope="row" colspan="3">물품 리스트</th>
                <th scope="row">구매일</th>
                <td colspan="2">${purchase.buyDate}</td>
            </tr>
            <c:forEach items="${list }" var="product">
                <tr>
                    <td><a class="tg-black" href="/productRead.do?pno=${product.pno}"><img src="/resources/upload/thumbnail/${product.thumbnail }" style="width: 100%"></a></td>
                    <td colspan="3"><a class="tg-black" href="/productRead.do?pno=${product.pno}">${product.pname}</a></td>
                    <td>${product.price}원</td>
                    <td>${product.stock}개</td>
                </tr>
            </c:forEach>
		</table>
	</div>
    
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <form action="/modifyInvoiceNumber.do" method="get">
            
                <input type="hidden" name="buyNo" value="${purchase.buyNo}">
                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <c:if test="${purchase.deliveryBool eq 0}">
                                송장번호 입력
                            </c:if>
                            <c:if test="${purchase.deliveryBool eq 1}">
                                송장번호 수정
                            </c:if>
                        </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <div class="modal-body">
                        <p>송장번호</p>
                        <input type="text" class="form-control" name="invoiceNumber" placeholder="송장번호를 입력하세요." value="${purchase.invoiceNumber}">
                    </div>
                    <div class="modal-footer">
                        <button type="Submit" class="btn btn-primary">Write</button>
                        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    
    <!-- Trace Modal -->
    <div class="modal fade" id="parcelTrace" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">배송조회</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="title-area title-content">택배정보</div>
                        </div>
                    </div>
                    <div class="col-xs-12 info-area">
                        <div class="form-group row">
                            <label for="invoice" class="col-lg-4 label-style">운송장번호</label>
                            <div id="invoice" class="col-lg-8 info-style"></div>
                        </div>
                        <div class="form-group row">
                            <label for="to" class="col-lg-4 label-style">받는 사람</label>
                            <div id="to" class="col-lg-8 info-style"></div>
                        </div>
                        <div class="form-group row">
                            <label for="from" class="col-lg-4 label-style">보낸 사람</label>
                            <div id="from" class="col-lg-8 info-style"></div>
                        </div>
                        <div class="row">
                            <label for="adress" class="col-lg-4 label-style">수령 주소</label>
                            <div id="adress" class="col-lg-8 info-style">${purchase.buyAddr}</div>
                        </div>
                    </div>

                    <div class="col-xs-12" style="padding-left: 0px; padding-right: 0px;">
                        <table id="traceTable" class="table" style=" TABLE-layout:fixed;">
                            <thead class="table-header">
                                <tr>
                                    <th class="td-time" style="width: 38%">시간</th>
                                    <th class="td-location" style="width: 42%">현재 위치</th>
                                    <th class="td-status" style="width: 20%">배송 상태</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function checkDelete() {
            var count = $("input[name=deleteNo]:checked").length;
            
            if (count == 0) {
                alert("삭제할 물품을 선택하세요.")
                return false;
            } else {
                if (confirm("해당 물품들을 삭제하시겠습니까?")) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        
        $(function() {
            $("#trace").click(function() {
                var invoiceNumber = "${purchase.invoiceNumber}";
                $.ajax({
                    url: "/healthner/shop/parcelTrace.do",
                    data: {invoiceNumber: invoiceNumber},
                    type: "post",
                    success: function(data) {
                        console.log(data);
                        $("#invoice").html(data['invoiceNo']);
                        $("#to").html(data['receiverName']);
                        $("#from").html(data['senderName']);
                        var tbody = $("#traceTable>tbody");
                        
                        for (var i = 0; i < data['trackingDetails'].length; i++) {
                            var tr = $("<tr></tr>");
                            var time = $("<td class='td-time'>" + data['trackingDetails'][i]['timeString'] + "</td>");
                            var location = $("<td class='td-location'>" + data['trackingDetails'][i]['where'] + "</td>");
                            var status = $("<td class='td-status'>" + data['trackingDetails'][i]['kind'] + "</td>");
                            
                            tr.append(time);
                            tr.append(location);
                            tr.append(status);
                            
                            tbody.prepend(tr);
                        }
                    }
                });
            });
        });
    </script>
</body>    
</html>