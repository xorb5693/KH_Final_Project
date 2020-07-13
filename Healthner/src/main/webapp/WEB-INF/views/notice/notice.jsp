<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Creative - Start Bootstrap Theme</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="/resources/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
        <!-- Third party plugin CSS-->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="/resources/css/styles.css" rel="stylesheet" />


<title>notice</title>
<link rel="icon" href="/resources/images/favicon.png">
</head>
<style>
.content {
	padding-right: 200px;
	padding-left: 200px;
}

.tt>div>a {
	color: black;
}

.tt>div:hover {
	background-color: #EEEEEE;
}

.tt>div {
	width: 200px;
	height: 200px;
	text-align: center;
	line-height: 200px;
}
</style>
<body>

	<div class='wrapper'>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<jsp:include page="/WEB-INF/views/common/headerForBlog.jsp" />
		<%-- <div class="container">
			<div class="content">
				<br>
				<div class="row tt">
					<div class="col-md-4">
						<c:if test="${sessionScope.member.memberLevel eq 4 }">
							<a href="/healthner/notice/noticeWriteFrm.do">공지사항 글쓰기</a>
						</c:if>
					</div>
					<div class="col-md-4">
						<c:if test="${sessionScope.member.memberLevel eq 1 }">
							<a href="/healthner/notice/boardWriteFrm.do">자유게시판 글쓰기</a>
						</c:if>
					</div>
					<div class="col-md-4">
						<c:if test="${sessionScope.member.memberLevel eq 3 }">
							<a href="/healthner/notice/boardWriteFrm.do">트레이너게시판 글쓰기</a>
						</c:if>
					</div>
				</div>
				<br>
				<hr>
				<br>
				<div class="row tt">
					<div class="col-md-4">
						<a href="/healthner/notice/noticeList.do?reqPage=1">공지사항 목록보기</a>
					</div>
					<div class="col-md-4">
						<c:if test="${sessionScope.member.memberLevel eq 1 }">
							<a href="/healthner/board/boardList.do?reqPage=1">자유게시판 목록보기</a>
						</c:if>
					</div>
					<div class="col-md-4">
						<c:if test="${sessionScope.member.memberLevel eq 3 }">
							<a href="/healthner/board/boardList.do?reqPage=1">트레이너게시판
								목록보기</a>
						</c:if>
					</div>
				</div>
				<br>
			</div>
		</div> --%>
		<section class="page-section" id="services">
            <div class="container">
                <h2 class="text-center mt-0">At Your Service</h2>
                <hr class="divider my-4" />
                <div class="row">
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="mt-5">
                            <i class="fas fa-4x fa-gem text-primary mb-4"></i>
                            <h3 class="h4 mb-2">Notice List</h3>
                            <p class="text-muted mb-0">공지사항에서 새로운 이벤트 혹은<br> 새소식을 확인하세요!!</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="mt-5">
                            <i class="fas fa-4x fa-heart text-primary mb-4"></i>
                            <h3 class="h4 mb-2">Board List</h3>
                            <p class="text-muted mb-0">회원분들만 접근 하실 수 있는 <br>소통공간 입니다.</p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 text-center">
                        <div class="mt-5">
                            <i class="fas fa-4x fa-globe text-primary mb-4"></i>
                            <h3 class="h4 mb-2">TBoard List</h3>
                            <p class="text-muted mb-0">트레이너분들만 접근 하실 수 있는<br> 소통공간 입니다.</p>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>
		<div class="wrapper">
			<!-- Portfolio-->
	        <div id="portfolio">
	            <div class="container-fluid p-0">
	                <div class="row no-gutters">
	                    <div class="col-lg-4 col-sm-6">
	                        <a class="portfolio-box" href="/healthner/notice/noticeList.do?reqPage=1">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/1.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Notice List</div>
	                            </div>
	                        </a>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
	                    	<c:if test="${sessionScope.member.memberLevel eq 1 }">
	                        <a class="portfolio-box" href="/healthner/board/boardList.do?reqPage=1">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/2.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Board List</div>
	                            </div>
	                        </a>
	                        </c:if>
	                        <c:if test="${sessionScope.member.memberLevel ne 1 }">
	                        <a class="portfolio-box" href="#">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/2.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Board List</div>
	                            </div>
	                        </a>
	                        </c:if>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
	                    	<c:if test="${sessionScope.member.memberLevel eq 3 }">
	                        <a class="portfolio-box" href="/healthner/board/boardList.do?reqPage=1">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/3.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">TBoard List</div>
	                            </div>
	                        </a>
	                        </c:if>
	                        <c:if test="${sessionScope.member.memberLevel ne 3 }">
	                        <a class="portfolio-box" href="#">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/3.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">TBoard List</div>
	                            </div>
	                        </a>
	                        </c:if>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
	                    	<c:if test="${sessionScope.member.memberLevel eq 4 }">
	                        <a class="portfolio-box" href="/healthner/notice/noticeWriteFrm.do">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/4.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Notice Write</div>
	                            </div>
	                        </a>
	                        </c:if>
	                        <c:if test="${sessionScope.member.memberLevel ne 4 }">
	                        <a class="portfolio-box" href="#">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/4.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Notice Write</div>
	                            </div>
	                        </a>
	                        </c:if>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
	                    	 <c:if test="${sessionScope.member.memberLevel eq 1 }">
	                        <a class="portfolio-box" href="/healthner/notice/boardWriteFrm.do">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/5.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Board Write</div>
	                            </div>
	                        </a>
	                        </c:if>
	                        <c:if test="${sessionScope.member.memberLevel ne 1 }">
	                        <a class="portfolio-box" href="#">
	                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/5.jpg" alt="">
	                            <div class="portfolio-box-caption">
	                                <div class="project-category text-white-50">Category</div>
	                                <div class="project-name">Board Write</div>
	                            </div>
	                        </a>
	                        </c:if>
	                    </div>
	                    <div class="col-lg-4 col-sm-6">
		                    <c:if test="${sessionScope.member.memberLevel eq 3 }">
		                        <a class="portfolio-box" href="/healthner/notice/boardWriteFrm.do">
		                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/6.jpg" alt="">
		                            <div class="portfolio-box-caption p-3">
		                                <div class="project-category text-white-50">Category</div>
		                                <div class="project-name">TBoard Write</div>
		                            </div>
		                        </a>
		                    </c:if>
		                     <c:if test="${sessionScope.member.memberLevel ne 3 }">
		                    	 <a class="portfolio-box" href="#">
		                            <img class="img-fluid" src="/resources/img/portfolio/thumbnails/6.jpg" alt="">
		                            <div class="portfolio-box-caption p-3">
		                                <div class="project-category text-white-50">Category</div>
		                                <div class="project-name">TBoard Write</div>
		                            </div>
		                        </a>
		                     </c:if>
	                    </div>
	                </div>
	            </div>
	        </div>
		
		
		</div>
		<section class="page-section" id="contact">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-8 text-center">
                        <h2 class="mt-0">Let's Get In Touch!</h2>
                        <hr class="divider my-4" />
                        <p class="text-muted mb-5">Ready to start your next project with us? Give us a call or send us an email and we will get back to you as soon as possible!</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
                        <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
                        <div>010-9774-0857</div>
                    </div>
                    <div class="col-lg-4 mr-auto text-center">
                        <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
                        <!-- Make sure to change the email address in BOTH the anchor text and the link target below!-->
                        <a class="d-block" href="mailto:contact@yourwebsite.com">lillipp400@gmail.com</a>
                    </div>
                </div>
            </div>
        </section>
		
		
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
 <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>

</html>