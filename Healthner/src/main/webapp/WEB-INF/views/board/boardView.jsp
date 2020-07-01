<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.commentList{
		width:100%;
		clear: both;
		border : 1px solid #ccc;
		border-radius: 5px;
		overflow: hidden;
	}
	.commentList>li{
		float:left;
		color:black;
		list-style: none;
	}
</style>
</head>
<body>
	<div class="wraper">
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<section class="hero-wrap"
			style="background-image: url('/resources/images/bg_1.jpg');">
			<div class="overlay"></div>
			<div class="container">
				<div
					class="row no-gutters slider-text align-items-center justify-content-center">
					<div class="col-md-9 ftco-animate text-center pt-md-5 pt-5">
						<br>
						<br>
						<h1 class="mb-3 bread">Place title here</h1>
						<p class="breadcrumbs">
							<span class="mr-2"><a href="index.html">링크</a></span> <span>링크</span>
						</p>
					</div>
				</div>
			</div>
		</section>
	<div class="content">
		<table>
			<tr>
				<th>제목</th>
				<td>${b.boardTitle }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${b.boardWriter }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${b.boardDate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${b.boardContent }</td>
			</tr>
		</table>
		
		
		
		
		
		
		<a href="/boardModify.do?boardNo=${b.boardNo }">내용수정</a>
	<a href="/boardDelete.do?boardNo=${b.boardNo }">글삭제</a>
	<a href="#">신고하기</a>
	</div>
	<c:if test="${not empty sessionScope.member}">
	
	${sessionScope.member.memberNo }
	${b.boardNo }
	<!-- 댓글작성하기 -->
	<div class="comment-wrapper"> 
		<form action="/boardCommentInsert.do" method="post">
			<input type="hidden" name="commentWriter" value="${sessionScope.member.memberNo}">
			<input type="hidden" name="ref" value="${b.boardNo }">
			<input type="hidden" name="commentLevel" value="1">
			<input type="hidden" name="commentRef" value="0">
			<input type="hidden" name="boardNo" value="${b.boardNo }">
			<table>
				<tr>
					<td width="85%">
						<input type="text" class="form-control" name="commentContent">
					</td>
					<td width="15%">
						<button type="submit" class="btn btn-primary">등록</button>
					</td>
				</tr>
				
			</table>
		</form>
	</div>	
	<!-- 댓글 출력하기 -->
	<div class="comment-wrapper">
		<c:forEach items="${list }" var="nc">
			<c:if test="${nc.commentLevel eq 1 }">
				<ul class="commentList">
					<li style="width:10%;text-align:center">
						<span>${nc.commentWriter }</span>
					</li>
					<li style="width:60%;text-align:center">
						<span>${nc.commentContent }</span>
						<input type="text" class="form-control" name="commentContent" value="${nc.commentContent }" style="display:none">
					</li>
					<li style="width:10%;text-align:center">
						<span>${nc.commentDate }</span>
					</li>
					<li style="width:20%;text-align:center">
						<c:if test="${not empty sessionScope.member }">
							<a href="javascript:void(0)" onclick="insertComment(this,'${nc.commentNo}','${b.boardNo}','${sessionScope.member.memberNo}')">댓글달기</a>
							<c:if test="${sessionScope.member.memberNo == nc.commentWriter }">
								<a href="javascript:void(0)" onclick="modifyComment(this,'${nc.commentNo}','${nc.ref}')">수정</a>
								<a href="javascript:void(0)" onclick="deleteComment('${nc.commentNo}','${nc.ref}')">삭제</a>
							</c:if>
						</c:if>
					</li>
				</ul>
			</c:if>
			<c:forEach items="${list }" var="ncc">
				<c:if test="${ncc.commentLevel eq 2 && nc.commentNo eq ncc.commentRef}">
					<ul class="commentList">
					<li style="width:5%; text-align:center">
								<span>└─</span>
						<li style="width:10%;text-align:center">
							<span>${ncc.commentWriter }</span>
						</li>
						<li style="width:60%;text-align:center">
							<span>${ncc.commentContent }</span>
						<input type="text" class="form-control" name="commentContent" value="${ncc.commentContent }" style="display:none">
						</li>
						<li style="width:10%;text-align:center">
							<span>${ncc.commentDate }</span>
						</li>
						<li style="width:20%;text-align:center">
							<c:if test="${ not empty sessionScope.member && sessionScope.member.memberNo eq ncc.commentWriter}">
								<a href="javascript:void(0)"onclick="modifyComment(this,'${ncc.commentNo}','${ncc.ref}')">수정</a>
								<a href="javascript:void(0)"onclick="deleteComment('${ncc.commentNo}','${ncc.ref}')">삭제</a>
							</c:if>
						</li>
					</ul>
				</c:if>
			</c:forEach>
		
		</c:forEach>
	
	</div>
	</c:if>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	
	<script>
	function insertComment(obj,commentNo,boardNo,memberNo){
		$(obj).parent().hide();
		alert(boardNo);
		var $form = $("<form action='/boardCommentInsert.do' method='post'></form>");
		var $ul = $("<ul class='commentList'></ul>");
		$form.append($("<input type='hidden' name='commentWriter' value='"+memberNo+"'>"));
		$form.append($("<input type='hidden' name='boardNo' value='"+boardNo+"'>"));
		$form.append($("<input type='hidden' name='ref' value='"+boardNo+"'>"));
		$form.append($("<input type='hidden' name='commentLevel' value='2'>"));
		$form.append($("<input type='hidden' name='commentRef' value='"+commentNo+"'>"));
		var $li1 = $("<li style='width:5%'>┗</li>");
		var $li2 = $("<li style='width:75%'></li>");
		$li2.append($("<input type='text' name='commentContent' class='form-control'> "));
		var $li3 = $("<li style='width:20%'></li>");
		$li3.append($("<button type='submit' class='btn btn-link btn-sm'>등록</button>"));
		$li3.append($("<button type='button' class='btn btn-link btn-sm' onclick='insertCancel(this)'>취소</button>"));
		$ul.append($li1).append($li2).append($li3);
		$form.append($ul);
		$(obj).parent().parent().after($form);
		
	}
	function insertCancel(obj){
		$(obj).parents('form').prev().children().last().show();
		$(obj).parents('form').remove();
	}
	function deleteComment(commentNo,Ref){
		location.href="/commentDelete?commentNo="+commentNo+"&Ref="+Ref;
	}
	function modifyComment(obj,commentNo,Ref){
		$(obj).prev().hide();
		$(obj).html('수정완료');
		$(obj).attr('onclick','modifyComplete(this,"'+commentNo+'","'+Ref+'")');
		$(obj).next().html('취소');
		$(obj).next().attr('onclick','modifyCancel(this,"'+commentNo+'","'+Ref+'")');
		$(obj).parent().parent().find('input').show();
		$(obj).parent().parent().find('input').prev().hide();
	}
	function modifyCancel(obj,commentNo,Ref){
		$(obj).prev().prev().show();
		$(obj).prev().html('수정');
		$(obj).prev().attr('onclick','modifyComment(this,"'+commentNo+'","'+Ref+'")');
		$(obj).html('삭제');
		$(obj).attr('onclick','deleteComment("'+commentNo+'","'+Ref+'")');
		$(obj).parent().parent().find('input').hide();
		$(obj).parent().parent().find('input').prev().show();
	}
	function modifyComplete(obj,commentNo,Ref){
		var $form=$("<form action='/commentUpdate' method='post'></form>");
		$form.append($("<input type='text' name='commentNo' value='"+commentNo+"'>"));
		$form.append($("<input type='text' name='Ref' value='"+Ref+"'>"));
		$form.append($(obj).parent().parent().find('input'));
		$('body').append($form);
		$form.submit();
	}
	</script>

</body>
</html>