<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MY PAGE</title>
	<link rel="icon" href="/resources/images/favicon.png">
</head>
<body>
	<!-- 기존 해더 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<!-- 트레이너 전용  -->
	<c:if test="${sessionScope.member.memberLevel eq 2 or sessionScope.member.memberLevel eq 3 }">
		<jsp:include page="/WEB-INF/views/common/headerForTrainer.jsp"/>
	</c:if>
	<!-- 일반 회원 전용 -->
	<c:if test="${sessionScope.member.memberLevel eq 1 }">
		<jsp:include page="/WEB-INF/views/common/headerForMember.jsp"/>
	</c:if>
	<!-- 관리자 전용 -->
	<c:if test="${sessionScope.member.memberLevel eq 4 }">
		<script>
			location.href = "/adminMain.do";
		</script>
	</c:if>

	

	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>