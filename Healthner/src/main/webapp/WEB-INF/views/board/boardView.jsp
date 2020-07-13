<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board</title>
<link rel="icon" href="/resources/images/favicon.png">
<style>
.commentList {
	width: 100%;
	clear: both;
	border: 1px solid #ccc;
	border-radius: 5px;
	overflow: hidden;
}

.commentList>li {
	float: left;
	color: black;
	list-style: none;
}

.comment-wrapper {
	margin: 20px;
}

.commentList {
	margin: 10px;
	margin: center;
}
</style>
</head>
<body>
	<div class="wraper">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp" />
		<section class="ftco-section bg-light">
			<div class="container">
				<h1 class="bread" style="font-style: italic; font-weight: 900;">Board
					View</h1>
				<br>
				<c:if test="${sessionScope.member.memberNo eq b.boardWriter}">
				<a style="float: right;"
					href="/healthner/board/boardModify.do?boardNo=${b.boardNo }">내용수정</a>
				<a style="float: right; padding-right: 10px;"
					href="/healthner/board/boardDelete.do?boardNo=${b.boardNo }">글삭제</a>
				</c:if>
				<br>
				<div class="content wraper col-md-12" style="overflow:hidden;">

					<div>
						<div>
							제목<span><strong>${b.boardTitle }</strong></span><span
								style="float: right;"><span>${b.boardDate }</span></span>
						</div>
						<hr>
						<div>
							글쓴이 ${b.memberNick }<span style="float: right;"><button
									type="button"
									onclick="reportBoard('1','${b.boardNo}','${b.boardWriter}','${sessionScope.member.memberNo}');"
									class="btn" data-toggle="modal" style="border: 1px solid #999"
									data-target="#exampleModal" data-whatever="@mdo">신고하기</button></span>
						</div>
						<hr>
						<br>
						<div class="">${b.boardContent }</div>
					</div>









				</div>
				<br>
				<hr>
				<c:if test="${not empty sessionScope.member}">

					<!-- 댓글작성하기 -->
					<div class="comment-wrapper">
						<div>
						
							<form action="/healthner/board/boardCommentInsert.do" method="post">
								<input type="hidden" name="commentWriter"
									value="${sessionScope.member.memberNo}"> <input
									type="hidden" name="ref" value="${b.boardNo }"> <input
									type="hidden" name="commentLevel" value="1"> <input
									type="hidden" name="commentRef" value="0"> <input
									type="hidden" name="boardNo" value="${b.boardNo }">
								<div class="row">
								<div class="col-md-1" style="margin-top:15px;">댓글</div>
									<div class="col-md-10">
										<input type="text" class="form-control" name="commentContent">
									</div>
									<div class="col-md-1">
										<button type="submit" class="btn btn-dark">등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<!-- 댓글 출력하기 -->
					<div class="comment-wrapper">
						<c:forEach items="${list }" var="nc">
							<c:if test="${nc.commentLevel eq 1 }">
								<ul class="commentList">
									<li style="width: 10%; text-align: center"><span>${nc.memberNick }</span>
									</li>
									<li style="width: 50%; text-align: center"><span>${nc.commentContent }</span>
										<input type="text" class="form-control" name="commentContent"
										value="${nc.commentContent }" style="display: none"></li>
									<li style="width: 10%; text-align: center"><span>${nc.commentDate }</span>
									</li>
									<li style="width: 30%; text-align: center"><c:if
											test="${not empty sessionScope.member }">
											<a href="javascript:void(0)"
												onclick="insertComment(this,'${nc.commentNo}','${b.boardNo}','${sessionScope.member.memberNo}')">댓글달기</a>
											<c:if
												test="${sessionScope.member.memberNo == nc.commentWriter }">
												<a href="javascript:void(0)"
													onclick="modifyComment(this,'${nc.commentNo}','${nc.ref}')">수정</a>
												<a href="javascript:void(0)"
													onclick="deleteComment('${nc.commentNo}','${nc.ref}')">삭제</a>

											</c:if>
											<button type="button"
												onclick="reportComment('2','${nc.commentNo}','${nc.commentWriter}','${sessionScope.member.memberNo}');"
												class="btn" data-toggle="modal"
												style="border: 1px solid #999" data-target="#exampleModal"
												data-whatever="@mdo">신고하기</button>
										</c:if></li>
								</ul>
							</c:if>
							<c:forEach items="${list }" var="ncc">
								<c:if
									test="${ncc.commentLevel eq 2 && nc.commentNo eq ncc.commentRef}">
									<ul class="commentList">
									<c:if test="${not empty sessionScope.member }">
										<li style="width: 5%; text-align: center"><span>└─</span>
										<li style="width: 10%; text-align: center"><span>${ncc.memberNick }</span>
										</li>
										<li style="width: 60%; text-align: center"><span>${ncc.commentContent }</span>
											<input type="text" class="form-control" name="commentContent"
											value="${ncc.commentContent }" style="display: none"></li>
										<li style="width: 10%; text-align: center"><span>${ncc.commentDate }</span>
										</li>
										<li style="width: 15%; text-align: center"><c:if
												test="${ not empty sessionScope.member && sessionScope.member.memberNo eq ncc.commentWriter}">
												<a href="javascript:void(0)"
													onclick="modifyComment(this,'${ncc.commentNo}','${ncc.ref}')">수정</a>
												<a href="javascript:void(0)"
													onclick="deleteComment('${ncc.commentNo}','${ncc.ref}')">삭제</a>
													</c:if>
													
												<button type="button"
													onclick="reportComment('2','${ncc.commentNo}','${nc.commentWriter}','${sessionScope.member.memberNo}');"
													class="btn" data-toggle="modal"
													style="border: 1px solid #999" data-target="#exampleModal"
													data-whatever="@mdo">신고하기</button>
											</li>
											</c:if>
									</ul>
								</c:if>
							</c:forEach>

						</c:forEach>

					</div>
				</c:if>
			</div>
		</section>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">신고작성</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">


					<div class="form-group" id="modal-content">
					<form action="/healthner/report/insertReport.do" method="post"
						id="inputReviewBox">
						<div class="form-group">
						<input type="hidden" name="boardNo" value="${b.boardNo }">
							<div class="form-group" id="report-ability-wrapper">
								<span class="field-label-header">무분별한 신고는 도히려 정지당할수 있습니다.</span><br>
								<span class="field-label-info"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">신고사유를
								선택해주세요</label><br> <input type="hidden" id="rating" class="rating"
								name="reportCat" value="" required="required"> <input
								type="radio" value="2" name="rr" class="rr">욕설/인신공격<br>
							<input type="radio" value="4" name="rr" class="rr">도배성글/댓글반복<br>
							<input type="radio" value="6" name="rr" class="rr">음란성/선정성<br>
							<input type="radio" value="8" name="rr" class="rr">개인정보노출/사생활침해<br>
							<input type="radio" value="10" name="rr" class="rr">불법광고/영리목적<br>
							<input type="radio" value="12" name="rr" class="rr">기타<br>
							<textarea class="form-control" id="message-text"
								name="reportDetail" placeholder="상세사유를 적어주세요" required></textarea>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소하기</button>
					<button type="submit" class="btn btn-primary" id="radioButton">신고하기</button>

					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function insertComment(obj, commentNo, boardNo, memberNo) {
			$(obj).parent().hide();
			
			var $form = $("<form action='/healthner/board/boardCommentInsert.do' method='post'></form>");
			var $ul = $("<ul class='commentList'></ul>");
			$form
					.append($("<input type='hidden' name='commentWriter' value='"+memberNo+"'>"));
			$form
					.append($("<input type='hidden' name='boardNo' value='"+boardNo+"'>"));
			$form
					.append($("<input type='hidden' name='ref' value='"+boardNo+"'>"));
			$form
					.append($("<input type='hidden' name='commentLevel' value='2'>"));
			$form
					.append($("<input type='hidden' name='commentRef' value='"+commentNo+"'>"));
			var $li1 = $("<li style='width:5%'>┗</li>");
			var $li2 = $("<li style='width:75%'></li>");
			$li2
					.append($("<input type='text' name='commentContent' class='form-control'> "));
			var $li3 = $("<li style='width:20%'></li>");
			$li3
					.append($("<button type='submit' class='btn btn-link btn-sm'>등록</button>"));
			$li3
					.append($("<button type='button' class='btn btn-link btn-sm' onclick='insertCancel(this)'>취소</button>"));
			$ul.append($li1).append($li2).append($li3);
			$form.append($ul);
			$(obj).parent().parent().after($form);

		}
		function insertCancel(obj) {
			$(obj).parents('form').prev().children().last().show();
			$(obj).parents('form').remove();
		}
		function deleteComment(commentNo, ref) {
			var con_test = confirm("삭제하시겠습니까?");
			if(con_test == true){				
			location.href = "/healthner/board/commentDelete.do?commentNo="
					+ commentNo + "&ref=" + ref;
			}else{
				
			}
		}
		function modifyComment(obj, commentNo, Ref) {
			$(obj).prev().hide();
			$(obj).html('수정완료');
			$(obj).attr('onclick',
					'modifyComplete(this,"' + commentNo + '","' + Ref + '")');
			$(obj).next().html('취소');
			$(obj).next().attr('onclick',
					'modifyCancel(this,"' + commentNo + '","' + Ref + '")');
			$(obj).parent().parent().find('input').show();
			$(obj).parent().parent().find('input').prev().hide();
		}
		function modifyCancel(obj, commentNo, Ref) {
			$(obj).prev().prev().show();
			$(obj).prev().html('수정');
			$(obj).prev().attr('onclick',
					'modifyComment(this,"' + commentNo + '","' + Ref + '")');
			$(obj).html('삭제');
			$(obj).attr('onclick',
					'deleteComment("' + commentNo + '","' + Ref + '")');
			$(obj).parent().parent().find('input').hide();
			$(obj).parent().parent().find('input').prev().show();
		}
		function modifyComplete(obj, commentNo, Ref) {
			var $form = $("<form action='/healthner/board/commentUpdate.do' method='post'></form>");
			$form
					.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
			$form.append($("<input type='text' name='Ref' value='"+Ref+"'>"));
			$form.append($(obj).parent().parent().find('input'));
			$('body').append($form);
			$form.submit();
		}

		$('#exampleModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var recipient = button.data('whatever') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-title').text('신고작성')
			/* modal.find('.modal-body input').val(recipient) */

		});

		$(document).ready(function() {
			$('input[name=rr]').click(function() {
				var sel_value = $('input[name=rr]:checked').val();
				console.log(sel_value);
				$("#rating").val(sel_value);
			});

		});

		/* jQuery(document).ready(function($) {
			$(".rr").on('click',function(e){
				
				var sel_value = $('input[name=rr]:checked').val();
				
				$("#rating").val(sel_value);
			}));
		} */

		function reportBoard(boardType, boardNo, boardWriter, memberNo) {
			var modal = $("#modal-content");
			modal.find("p").remove();
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='writeType' value='"+boardType+"'>");
			$("#report-ability-wrapper").append(
					"<input type='hidden' name='writeNo' value='"+boardNo+"'>");
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='reportedNo' value='"+boardWriter+"'>");
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='memberNo' value='"+memberNo+"'>");

		}

		function reportComment(commentType, commentNo, commentWriter, memberNo) {
			var modal = $("#modal-content");
			modal.find("p").remove();
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='writeType' value='"+commentType+"'>");
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='writeNo' value='"+commentNo+"'>");
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='reportedNo' value='"+commentWriter+"'>");
			$("#report-ability-wrapper")
					.append(
							"<input type='hidden' name='memberNo' value='"+memberNo+"'>");

		}
	</script>

</body>
</html>