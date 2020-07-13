<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>에러 메세지</title>
<link rel="icon" href="/resources/images/favicon.png">
</head>
<body>
	<script>
		alert('${msg}');
		location.href='${loc}';
	</script>
</body>
</html>