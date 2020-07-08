<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="UTF-8">
<!doctype html>
<html lang="en">
  <head>
  	<title>관리자 페이지 - 물품 수정</title>
  	<link rel="icon" href="/resources/images/favicon.png">
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
        <h2 class="mb-4">Product Modify</h2>
        <form action="/productModify.do" method="post" enctype="multipart/form-data">
            <input type="hidden" name="pno" value="${product.pno}">
            <input type="hidden" name="thumbnail" value="${product.thumbnail}">
            <input type="hidden" name="type" value="not">
			<table class="table">
                <tbody>
				    <tr>
                        <th scope="row">이름</th>
                        <td colspan="5"><input class="form-control" type="text" name="pname" value="${product.pname}" required></td>
				    </tr>
                    <tr>
                        <th scope="row">가격</th>
                        <td colspan="2"><input class="form-control" type="number" min="0" name="price" value="${product.price}" required></td>
                        <th scope="row">수량</th>
                        <td colspan="2"><input class="form-control" type="number" min="0" name="stock" value="${product.stock}" required></td>
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
                        <td colspan="2" align="center">
                            <img id="thumbnailImg" src="/resources/upload/thumbnail/${product.thumbnail }" style="width: 100%">
                            <br>
                            <button type="button" class="btn btn-primary btn-sm" onclick="thumbnailModify(this)">수정하기</button>
                            <input class="form-control-file" type="file" id="file" name="file" accept="image/*" style="display: none" onchange="checkFile(this)">
                            <button type="button" class="btn btn-primary btn-sm" onclick="thumbnailModifyCancel(this)" style="display: none">수정취소</button>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <textarea id="ck4" name="pcontent" rows="20" required>${product.pcontent}</textarea>
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
                            <button type="submit" class="btn btn-primary btn-block" onclick="return check()">수 정</button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary btn-block" onclick="location.href='/productRead.do?pno=${product.pno}'">취 소</button>
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
        
        function checkFile(obj) {
            
            var filename = $(obj).val();
            var filetype = filename.substr(filename.lastIndexOf(".") + 1).toLowerCase();
            
            if (filetype != "jpg" && filetype != "png" && filetype != "jpeg" && filetype != "gif" && filetype != "bmp") {
                alert(".jpg, .png, .jpeg, .gif, .bmp중 하나를 올려주세요.");
                $(obj).val("");
            }
        }
        
        $(function() {
            var cat1 = $("select[name=category]>option");
            var cat2 = $("select[name=category2]>option");
            var cat3 = $("select[name=category3]>option");
            
            for (var i = 0; i < cat1.length; i++) {
                if (cat1.eq(i).val() == ${product.category}) {
                    cat1.eq(i).prop("selected", true);
                    break;
                }
            }
            
            for (var i = 0; i < cat2.length; i++) {
                if (cat2.eq(i).val() == ${product.category2}) {
                    cat2.eq(i).prop("selected", true);
                    break;
                }
            }
            
            for (var i = 0; i < cat3.length; i++) {
                if (cat3.eq(i).val() == ${product.category3}) {
                    cat3.eq(i).prop("selected", true);
                    break;
                }
            }
        });
        
        function thumbnailModify(obj) {
            $(obj).parent().children().toggle();
            $("input[name=type]").val("change");
            $("#file").prop("required", true);
        }
        
        function thumbnailModifyCancel(obj) {
            $(obj).parent().children().toggle();
            $("input[name=type]").val("not");
            $("#file").prop("required", false);
        }
    </script>
</body>    
</html>