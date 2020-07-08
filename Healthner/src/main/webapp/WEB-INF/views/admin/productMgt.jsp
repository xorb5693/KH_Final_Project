<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 물품 관리</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
    </style>
</head>
    <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<body>
	<!-- 혜진_200624_메뉴바 삽입 -->
 	<jsp:include page="/WEB-INF/views/admin/menubar.jsp" />

    <!-- Page Content  -->
    <!--  태규_200708_페이지 제작  -->
    <div id="content" class="p-4 p-md-5 pt-5">
        <h2 class="mb-4">Product List</h2>
        <form action="#" method="get">
			<input type="hidden" name="readType" value="0">
			<button type="button" id="modal" style="width: 100px;"
				class="btn btn-primary ftco-animate fadeInUp ftco-animated"
				onclick="location.href='/productInsertFrm.do'">물품 등록</button>
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
						<th scope="col" style="width: 14.5%">작성자</th>
						<th scope="col" style="width: 14.5%">날짜</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</form>
		<div class="pageNavi">${pageNavi}</div>
	</div>

    <script>
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
    </script>
</body>    
</html>