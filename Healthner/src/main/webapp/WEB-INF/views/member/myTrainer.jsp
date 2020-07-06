<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Trainer</title>
    <style>
        .form-control {
            resize: none;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForMember.jsp"/>
    <section class="ftco-section bg-light">
        <div class="container-fluid px-4">
            <div class="row justify-content-center mb-5">
                <div class="col-md-7 heading-section text-center ftco-animate fadeInUp ftco-animated">
                    <span class="subheading">
                        <small>
                            <i class="left-bar"></i>
                            ${sessionScope.member.memberName}
                            <i class="right-bar"></i>
                        </small>
                    </span>
                    <h2 class="mb-1">My Trainer</h2>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${list }" var="data">
                	<div class="col-lg-3 d-flex">
	                    <div class="coach align-items-stretch">
	                        <div class="img" style="background-image: url(/resources/profile/${data.trainer.memberProfile}), url(/resources/profile/noprofile.png);">
	                        </div>
	                        <div class="text pt-3 ftco-animate fadeInUp ftco-animated">
	                            <span class="subheading">${data.trainer.catFirstName } / ${data.trainer.catSecondName } / ${data.trainer.catThirdName }</span>
	                            <h3>${data.trainer.memberName }</h3>
	                            <p>트레이닝 횟수 : ${data.mapping.trainingCnt }/${data.mapping.trainingMaxcnt }</p>
                                <input type="hidden" value="${data.mapping.mappingSeq }">
	                        </div>
	                        <div>
	                        	<c:if test="${not empty data.mapping.trainingPostscript }">
	                            	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#readPostscript" onclick="readPostscript(this)">후기 보기</button>
                                    <input type="hidden" value="${data.mapping.trainingPostscript }">
	                        	</c:if>
	                        	<c:if test="${empty data.mapping.trainingPostscript }">
	                            	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#writePostscript" onclick="writePostscript(this)">후기 입력</button>
	                        	</c:if>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
            </div>
        </div>
    </section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- The Read Modal -->
    <div class="modal" id="readPostscript">
        <div class="modal-dialog">
            <div class="modal-content">
      
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">후기 보기</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body" id="readArea">
                    Read Modal body
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modifyPostscript" onclick="closeModal(this)">후기 수정</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                </div>
                
            </div>
        </div>
    </div>
    <!-- The Write Modal -->
    <div class="modal" id="writePostscript">
        <div class="modal-dialog">
            <div class="modal-content">
      
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">후기 작성</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="/healthner/member/insertPostscript.do" method="post">
                    <input type="hidden" name="mappingSeq">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <textarea class="form-control" name="trainingPostscript"></textarea>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">입력 완료</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- The Modify Modal -->
    <div class="modal" id="modifyPostscript">
        <div class="modal-dialog">
            <div class="modal-content">
      
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">후기 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="/healthner/member/insertPostscript.do" method="post">
                    <input type="hidden" name="mappingSeq">
                    <!-- Modal body -->
                    <div class="modal-body">
                        <textarea class="form-control" name="trainingPostscript" id="modifyTextarea"></textarea>
                    </div>

                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">수정 완료</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <script>
        function readPostscript(btn) {
            $("#readArea").html($(btn).next().val());
            var hidden = $(btn).parent().prev().children("input[type=hidden]").val();
//            console.log(hidden);
            $("input[name=mappingSeq]").val(hidden);
        }
        
        function closeModal(btn) {
            $("#modifyTextarea").val($("#readArea").html());
            $(btn).next().click();
        }
        
        function writePostscript(btn) {
            var hidden = $(btn).parent().prev().children("input[type=hidden]").val();
//            console.log(hidden);
            $("input[name=mappingSeq]").val(hidden);
        }
    </script>
</body>
</html>