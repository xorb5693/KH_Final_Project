<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Eat</title>
    <style>
        #modal {
            float: right;
        }
        .input-area>div {
            display: inline-block;
        }
        .menu-area {
            height: 350px;
            overflow: scroll;
            background: rgba(0, 0, 0, 0.05);
        }
        .menu-area>div {
            font-weight: bolder;
            color: black;
        }
        
        .menu-area>div:hover {
            background-color: #1a1717;
            color: white;
            cursor: pointer;
        }
        
        .menu-area>div>p {
            margin: 0;
        }
    </style>
<script src="/resources/datepicker/js/bootstrap-datepicker.js"></script>
<!--한국어  달력 쓰려면 추가 로드-->
<script src="/resources/datepicker/locales/bootstrap-datepicker.ko.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/common/headerForMember.jsp"/>
	<section class="ftco-section ftco-about">
		<div class="container">
            <div class="row justify-content-center mb-5 pb-3">
                <div class="col-md-7 heading-section ftco-animate text-center fadeInUp ftco-animated">
                    <span class="subheading">
                        <small>
                            <i class="left-bar"></i>
                            ${sessionScope.member.memberName}
                            <i class="right-bar"></i>
                        </small>
                    </span>
                    <h2 class="mb-1">
                        MY EAT
                    </h2>
                </div>
            </div>
            <button type="button" id="modal" class="btn btn-primary ftco-animate fadeInUp ftco-animated" data-toggle="modal" data-target="#myModal">
                Open modal
            </button>
            <br><br>
            <table class="table ftco-animate fadeInUp ftco-animated">
                <thead>
                    <tr>
                      <th scope="col">#</th>
                      <th scope="col">First</th>
                      <th scope="col">Last</th>
                      <th scope="col">Handle</th>
                    </tr>
                </thead>
            </table>
		</div>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <!-- The Modal -->
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

				<form action="/healthner/member/eatLogInsert.do" method="get">
                    <input type="hidden" name="memberNo" value="${sessionScope.member.memberNo}">
	                <!-- Modal Header -->
	                <div class="modal-header">
	                    <h4 class="modal-title">식단 입력</h4>
	                    <button type="button" class="close" data-dismiss="modal">&times;</button>
	                </div>
	
	                <!-- Modal body -->
	                <div class="modal-body">
						날짜
						<input type="text" id="datePicker" name="eatDate" class="form-control">
						시간
						<select class="form-control" name="eatTime">
						  <option value="아침">아침</option>
						  <option value="점심">점심</option>
						  <option value="저녁">저녁</option>
						</select>
						음식 이름
                        <div class="input-area">
                            <div style="width: 400px">
                                <input type="text" class="form-control" id="foodName" name="foodName" placeholder="음식 이름을 입력하세요" required>
                            </div>
                            <button type="button" id="search" class="btn btn-outline-primary">검색</button>
                        </div>
                       	 칼로리
                        <input type="number" name="kcal" class="form-control" placeholder="kcal" required>
                        <div class="menu-area">
                        </div>
	                </div>
	
	                <!-- Modal footer -->
	                <div class="modal-footer">
						<button type="submit" class="btn btn-primary">Write</button>
	                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	                </div>
				</form>
            </div>
        </div>
    </div>
    
    <script>
		$(function() {
	        var today = new Date();   
	
	        var year = today.getFullYear(); // 년도
	        var month = new String(today.getMonth() + 1);  // 월
	        var date = new String(today.getDate());  // 날짜
	        
	        if (month.length == 1) {
	            month = "0" + month;
	        }
	        
	        if (date.length == 1) {
	            date = "0" + date;
	        }
	
	        $("#datePicker").val(year + "-" + month + "-" + date);
	        
	        $('#datePicker').datepicker({
			    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
			    startDate: '-20d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
			    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
			    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
			    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
			    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
			    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
			    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
			    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
			    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
			    templates : {
			        leftArrow: '&laquo;',
			        rightArrow: '&raquo;'
			    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
			    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
			    title: "캘린더",	//캘린더 상단에 보여주는 타이틀
			    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
			    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
			    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
			    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
			    
			});//datepicker end
            
            //검색 버튼 클릭시 ajax로 데이터 가져오기
            $("#search").click(function() {
                $(".menu-area").html("");
                var keyword = $("#foodName").val();
                if (keyword != "") {
                    $.ajax({
                        url: "/healthner/member/menuList.do",
                        data: {keyword: keyword},
                        type: "get",
                        success: function(data) {
                            for (var i = 0; i < data.length; i++) {
                                var div = $("<div onclick='selectMenu(this)'></div>");
                                var p1 = $("<p value=\"" + data[i]["foodName"] +  "\">음식 이름 : " + data[i]["foodName"] + "</p>");
                                var p2 = $("<p value=\"" + data[i]["kcal"] + "\">칼로리 : " + data[i]["kcal"] + "</p>");
                                div.append(p1);
                                div.append(p2);
                                $(".menu-area").append(div);
                            }
                        }
                    });
                }
            });
	    });
            
        function selectMenu(div) {
//            console.log(div);
            var foodName = $(div).find("p").eq(0).attr("value");
            var kcal = $(div).find("p").eq(1).attr("value");
            
            $("input[name=foodName]").val(foodName);
            $("input[name=kcal]").val(kcal);
        };
	</script>
</body>
</html>