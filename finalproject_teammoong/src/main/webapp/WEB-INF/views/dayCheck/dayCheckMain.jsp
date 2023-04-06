<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .content-all{
  	padding-top: 30px; 
  }
  .main-content{
  	padding-top: 30px; 
  }
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

</head>
<body>
	<div class="content-wrap">
		<div class="content-all">
			<div id="calendar" class="calendar">
			
			</div>
		</div>
	</div>
	<script>
	$(document).ready(function() {
    	$('#calendar').fullCalendar({
        // 달력 설정
        	header: {
            	left: 'prev,next today',
            	center: 'title',
            	right: 'month,agendaWeek,agendaDay'
        	},
        	defaultDate: '2023-04-06',
        	navLinks: true, // 달력 날짜를 클릭하면 해당 날짜로 이동
        	editable: true, // 일정을 추가/수정/삭제할 수 있는 기능을 활성화
        	eventLimit: true, // 일정이 너무 많을 때 "더 보기" 버튼을 표시
        	events: [
            	// 일정 데이터
            	{
                	title: '출석체크 이벤트',
                	start: '2023-04-06T10:00:00',
                	end: '2023-04-06T12:00:00'
            	}
        	]
    	});
	});
	</script>		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>