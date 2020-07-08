<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 물품 등록</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
		<link rel="stylesheet" href="/admin/css/style.css">
    <link rel="stylesheet" href="resources/ckeditor/contents.css">
    <script type="text/javascript" src="resources/ckeditor/ckeditor.js" charset="utf-8"></script>
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
        <h2 class="mb-4">Product Insert</h2>
        <form action="/productInsert.do" method="post" enctype="multipart/form-data">
			<table class="table">
                <tbody>
				    <tr>
                        <th scope="row">이름</th>
                        <td colspan="5"><input class="form-control" type="text" name="pname" required></td>
				    </tr>
                    <tr>
                        <th scope="row">가격</th>
                        <td colspan="2"><input class="form-control" type="number" min="0" name="price" required></td>
                        <th scope="row">수량</th>
                        <td colspan="2"><input class="form-control" type="number" min="0" name="stock" required></td>
                    </tr>
                    <tr>
                        <th scope="row">카테고리 1</th>
                        <td>
                            <select class="form-control" name="category">
                                <option value="1">국내</option>
                                <option value="2">해외</option>
                            </select>
                        </td>
                        <th scope="row">카테고리 2</th>
                        <td>
                            <select class="form-control" name="category2">
                                <option value="1">운동기구</option>
                                <option value="2">보조식품</option>
                                <option value="3">의류</option>
                            </select>
                        </td>
                        <th scope="row">카테고리 3</th>
                        <td>
                            <select class="form-control" name="category3">
                                <option value="1">공용</option>
                                <option value="2">남성</option>
                                <option value="3">여성</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th scope="row" colspan="3">내용</th>
                        <th scope="row">섬네일</th>
                        <td colspan="2"><input class="form-control-file" type="file" id="file" name="file" required></td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <textarea id="ck4" name="pcontent" rows="20" required></textarea>
                            <script>
                                CKEDITOR.replace('ck4', {
                                    filebrowserUploadUrl : '/healthner/notice/imageUpload.do',
                                    height: '310px'
                                });
                            </script>
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr align="center">
                        <td></td>
                        <td></td>
                        <td>
                            <button type="submit" class="btn btn-primary btn-block" onclick="return check()">등 록</button>
                        </td>
                        <td>
                            <button type="submit" class="btn btn-primary btn-block" onclick="location.href = '/productMgt.do'">취 소</button>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
			</table>
        </form>
	</div>

    <script>
        function check() {
            
            var messageLength = CKEDITOR.instances['ck4'].getData().replace(/<[^>]*>/gi, '').length;
            if( !messageLength ) {
                alert("제품의 상세 정보를 입력하세요");
                return false;
            }            
        }
    </script>
</body>    
</html>