<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive Mail List</title>
	<style>
        #modal {
            float: right;
        }
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForMember.jsp"/>
	<section class="ftco-section ftco-about">
		<div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center fadeInUp ftco-animated">
                    <span class="subheading">
                        <small>
                            <i class="left-bar"></i>
                            ${sessionScope.member.memberName}
                            <i class="right-bar"></i>
                        </small>
                    </span>
                    <h2 class="mb-1">
                        RECEIVE MAIL LIST
                    </h2>
                </div>
            </div>
            <button type="button" id="modal" class="btn btn-primary ftco-animate fadeInUp ftco-animated" data-toggle="modal" data-target="#myModal">
                	쪽지 쓰기
            </button>
		</div>
	</section>
	
	<!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

				<form action="/healthner/mail/insert.do" method="post">
                    <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">쪽지 쓰기</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	
	                <!-- Modal body -->
	                <div class="modal-body">
	                	수신자 선택
	                	<input type="hidden" name="sender" value="${sessionScope.member.memberNo}">
	                	<select class="form-control" name="receiver" onchange="selectOption()">
                            <c:forEach items="${memberList }" var="memberList">
                            	<option value=${memberList.memberNo }>${memberList.memberNick }</option>
                            </c:forEach>
                            <option value="0">직접입력</option>
	                	</select>
                        <div id="writeIdArea" style="display: none">
                            직접입력
                            <input type="text" class="form-control" name="memberId" placeholder="아이디를 입력하세요" disabled>
                            <div class="invalid-feedback" id="checkId"></div>
                        </div>
                        내용
                        <textarea class="form-control" rows="10" name="mailContent" placeholder="쪽지 내용을 입력하세요" required></textarea>
	                </div>
	
	                <!-- Modal footer -->
	                <div class="modal-footer">
						<button type="submit" class="btn btn-primary" onclick="return checkId()">Write</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                </div>
				</form>
            </div>
        </div>
    </div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        var check = true;
        $("#checkId").css("display", "block");
        
        $(function() {
            $("input[name=memberId]").blur(function() {
                var memberId = $("input[name=memberId]").val();
                
                $.ajax({
                    url: "/healthner/mail/selectMemberId.do",
                    data: {memberId: memberId},
                    type: "get",
                    success: function(data) {
                        $("select[name=receiver] option:selected").val(data);
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
        
        function selectOption() {
            var select = $("select[name=receiver] option:selected").val();
            
            if (select == "0") {
                $("#writeIdArea").css("display", "block");
                $("input[name=memberId]").prop("disabled", false);
                $("input[name=memberId]").prop("required", true);
                check = false;
            } else {
                $("select[name=receiver] option:last-child").val("0")
                $("#writeIdArea").css("display", "none");
                $("input[name=memberId]").prop("disabled", true);
                $("input[name=memberId]").prop("required", false);
                check = true;
                $("#checkId").html("");
                $("input[name=memberId]").val("");
            }
        }
        
        function checkId() {
            if (!check) {
                alert("존재하는 아이디를 입력하세요");
            }
            return check;
        }
    </script>
</body>
</html>