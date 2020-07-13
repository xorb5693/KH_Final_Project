<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 물품 관리</title>
  	<link rel="icon" href="/resources/images/favicon.png">
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

        .table {
            table-layout: fixed;
        }
        
        .table tr {
            width: 16.6%;
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
        <h2 class="mb-4">Product Info</h2>
        <button onclick="location.href = '/healthner/admin/productModifyFrm.do?pno=${product.pno}'" class="btn btn-primary" style="float: right; width: 100px;">수정하기</button>
        <br><br>
        <table class="table">
            <tbody>
                <tr>
                    <td colspan="2" rowspan="3"><img src="/resources/upload/thumbnail/${product.thumbnail }" style="width: 100%"></td>
                    <td colspan="4"><h4>${product.pname}</h4></td>
				</tr>
                <tr>
                    <th scope="row">가격</th>
                    <td>${product.price}원</td>
                    <th scope="row">수량</th>
                    <td>${product.stock}개</td>
                </tr>
                <tr>
                    <th scope="row">카테고리</th>
                    <td colspan="3">
                        <c:if test="${product.category eq 1}">
                            국내 >
                        </c:if>
                        <c:if test="${product.category eq 2}">
                            해외 >
                        </c:if>
                        <c:if test="${product.category2 eq 1}">
                            운동기구 >
                        </c:if>
                        <c:if test="${product.category2 eq 2}">
                            보조식품 >
                        </c:if>
                        <c:if test="${product.category2 eq 3}">
                            의류 >
                        </c:if>
                        <c:if test="${product.category3 eq 1}">
                            공용
                        </c:if>
                        <c:if test="${product.category3 eq 2}">
                            남성
                        </c:if>
                        <c:if test="${product.category3 eq 3}">
                            여성
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="6" id="productContentArea">
                        ${product.pcontent}
                    </td>
                </tr>
            </tbody>
		</table>
	</div>

    <script>
        $(function() {
            var img = $("#productContentArea img");
            
            for (var i = 0; i < img.length; i++) {
                img.eq(i).attr("style", "width: 100%;");
            }
        });
    </script>
</body>    
</html>