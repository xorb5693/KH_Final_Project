<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Attendance</title>
<style>
    .icon-check-circle:hover {
        color: green;
    }
    
    [data-tooltip-text]:hover {
	   position: relative;
    }
    
    [data-tooltip-text]:hover:after {
        content: attr(data-tooltip-text);

        position: absolute;
        bottom: 100%;
        left: 0;

        background-color: rgba(0, 0, 0, 0.8);
        color: #FFFFFF;
        font-size: 12px;
        padding: 10px;
        width: 60px;
        text-align: center;

        z-index: 9999;
    }
</style>
</head>
<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForMember.jsp"/>
    <section class="ftco-section ftco-about">
		<div class="container">
            <span class="icon-check-circle" data-tooltip-text="단위:분" style="float: right"></span>
            <!--  그래프  -->
            <canvas id="myChart"></canvas>
            <br><br>
            <div class="row">
                <div class="col-md-6 ftco-animate fadeInUp ftco-animated">
<!--
                    <div class="block-7">
                        <div class="text-center">
                            <span class="price">
                                <span class="number">출석일</span>
                                <h3 class="heading-2 mb-4">${data.lastAttd}</h3>
                            </span>
                        </div>
                    </div>
-->
                    <div class="text pt-4 pt-md-0">
                        <div class="heading-section mb-4">
                            <h3 class="mb-1">
                                마지막                         
                                <span>출석일</span>
                            </h3>
                        </div>
                        <p>${data.lastAttd}</p>
                    </div>
<!--
                    <div class="text pt-4 pt-md-0">
                        <div class="heading-section mb-4">
                            <h2 class="mb-1">
                                마지막                         
                                <span>출석일</span>
                            </h2>
                        </div>
                        <p>${data.lastAttd}</p>
                    </div>
-->
                </div>
                <div class="col-md-6 ftco-animate fadeInUp ftco-animated">
<!--
                    <div class="block-7">
                        <div class="text-center">
                            <span class="price">
                                <span class="number">운동시간</span>
                                <h3 class="heading-2 mb-4">${data.lastTime}분</h3>
                            </span>
                        </div>
                    </div>
-->
                    <div class="text pt-4 pt-md-0">
                        <div class="heading-section mb-4">
                            <h3 class="mb-1">
                                마지막                         
                                <span>운동시간</span>
                            </h3>
                        </div>
                        <p>${data.lastTime}분</p>
                    </div>
<!--
                    <div class="text pt-4 pt-md-0">
                        <div class="heading-section mb-4">
                            <h2 class="mb-1">
                                마지막                         
                                <span>운동시간</span>
                            </h2>
                        </div>
                        <p>${data.lastTime}분</p>
                    </div>
-->
                </div>
            </div>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
        $(function() {
            const colors = ['#c3e6cb', '#566270', '#791E94'];
            var chBar = document.getElementById("myChart"); 
            var chartData = { 
                labels: [${data.labels}], 
                datasets: [
                {
                    label: '평균 운동 시간 ',
                    data: [${data.avgData}], 
                    backgroundColor: colors[1] 
                }, 
                { 
                    label: '내 운동시간 ',
                    data: [${data.myData}], 
                    backgroundColor: colors[2] 
                }]
            }; 
            var myChart = new Chart(chBar, { 
                // 차트 종류를 선택 
                type: 'bar', 
                
                // 차트를 그릴 데이터
                data: chartData, 
                // 옵션 
                options: { legend: { display: false } } 
            });

        });
    </script>
</body>
</html>