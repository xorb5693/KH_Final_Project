<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">

<head>
<title>관리자 페이지 - 송신 쪽지함</title>
<link rel="icon" href="/resources/images/favicon.png">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="/admin/css/style.css">
<style>
form>button {
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

.table td, .table th {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.table {
	table-layout: fixed;
}

#readModal div.modal-body div {
	display: inline-block;
	white-space: pre-line;
}

#mailContent {
	width: 95%;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	padding: 5px;
	border: 1px solid rgba(0, 0, 0, 0.2);
}
</style>
</head>

<body>
	<!-- 혜진_200624_메뉴바 삽입 -->
	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

	<!-- Page Content  -->
	<div id="content" class="p-4 p-md-5 pt-5">
		<h5>
			<a href="/healthner/admin/mail.do?reqPage=1">Receive Mail List</a> / Send Mail List
		</h5>
		<h2 class="mb-4">Send Mail List</h2>
		<form action="/healthner/admin/adminDeleteMail.do" method="get">
			<input type="hidden" name="readType" value="1">
			<button type="button" id="modal" style="width: 100px;"
				class="btn btn-primary ftco-animate fadeInUp ftco-animated"
				data-toggle="modal" data-target="#myModal">쪽지 쓰기</button>
			<button type="submit" style="width: 100px;"
				class="btn btn-primary ftco-animate fadeInUp ftco-animated"
				onclick="return checkDelete()">삭제</button>
			<br>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th scope="col" style="width: 10%">삭제</th>
						<th scope="col" style="width: 10%">읽음</th>
						<th scope="col" style="width: 50%">내용</th>
						<th scope="col" style="width: 14.5%">수신자</th>
						<th scope="col" style="width: 14.5%">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="mail">
						<tr>
							<td style="width: 10%"><input type="checkbox"
								name="deleteNo" value="${mail.mailNo }"></td>
							<td style="width: 10%"><c:if test="${mail.readCount == 0 }">
									<i class="icon-envelope tg-black"></i>
								</c:if> <c:if test="${mail.readCount != 0 }">
									<span class="icon-envelope-open tg-gray"></span>
								</c:if></td>
							<td style="width: 50%"><a class="tg-black"
								href="javascript:void(0)" data-toggle="modal"
								data-target="#readModal"
								onclick="readMail(this, ${mail.mailNo})">${mail.mailContent }</a></td>
							<td style="width: 14.5%">${mail.memberNick }</td>
							<td style="width: 14.5%">${mail.writeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
		<div class="pageNavi">${pageNavi}</div>
	</div>

	<!-- The Modal -->
	<div class="modal" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<form action="/healthner/admin/adminInsertMail.do" method="post">
					<input type="hidden" value="1" name="readType">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">쪽지 쓰기</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<input type="hidden" name="sender"
							value="${sessionScope.member.memberNo}"> <input
							type="hidden" name="receiver">
						<div id="writeIdArea">
							아이디 입력 <input type="text" class="form-control" name="memberId"
								placeholder="아이디를 입력하세요" required>
							<div class="invalid-feedback" id="checkId"></div>
						</div>
						내용
						<textarea class="form-control" rows="10" name="mailContent"
							placeholder="쪽지 내용을 입력하세요" required></textarea>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary"
							onclick="return checkId()">Write</button>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- The Read Modal -->
	<div class="modal" id="readModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">쪽지 읽기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<strong> 수신자 :
						<div id="writer"></div> <br> 작성일 :
						<div id="writeDate"></div> <br> 내용 :
					</strong> <br>
					<div id="mailContent"></div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button id="close" type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
        var check = false;
        $("#checkId").css("display", "block");
        
        $(function() {
            $("input[name=memberId]").blur(function() {
                var memberId = $("input[name=memberId]").val();
                
                $.ajax({
                    url: "/healthner/mail/selectMemberId.do",
                    data: {memberId: memberId},
                    type: "get",
                    success: function(data) {
                        $("input[name=receiver]").val(data);
                        if (data != "0") {
                            check = true;
                            $("#checkId").html("");
                        } else {
                            check = false;
                            $("#checkId").html("해당 아이디가 존재하지 않습니다.");
                        }
                    }
                });
            });
            
            $("input[name=memberId]").keydown(function() {
                if (event.keyCode == 13) {
                    event.preventDefault();
                }
            });
            
        });
        
        function checkId() {
            if (!check) {
                alert("존재하는 아이디를 입력하세요");
            }
            return check;
        }
        
        function checkDelete() {
            var count = $("input[name=deleteNo]:checked").length;
            
            if (count == 0) {
                alert("삭제할 쪽지를 선택하세요.")
                return false;
            } else {
                if (confirm("쪽지를 삭제하시겠습니까?")) {
                    return true;
                } else {
                    return false;
                }
            }
        }
        
        function readMail(obj, mailNo) {
            
            $.ajax({
                url: "/healthner/mail/readMail.do",
                data: {mailNo: mailNo, readType: 1},
                type: "get",
                success: function(data) {
                    $("#writer").html(data['memberNick']);
                    $("#writeDate").html(data['writeDate']);
                    $("#mailContent").html(data['mailContent']);
                }
            });
        }
    </script>
</body>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

</html>
