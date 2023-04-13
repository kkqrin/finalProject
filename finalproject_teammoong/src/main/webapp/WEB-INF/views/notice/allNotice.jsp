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
  	 
  }
  .main-content{
  	padding-top: 30px; 
  }
</style>
</head>
<body>
	<div class="content-wrap">
		<div class="content-all">
			<h3>공지사항</h3>
			<p class="bold">뭉쳐야산다의 새로운 소식들과 정보를 한곳에서 확인하세요</p>
					<button type="button" class="btn btn-pri size03" id="dayCheck">출석체크</button>
			<div class="main-content">
				<table class="guide-board">
					<tr>
						<th>글번호</th>
						<th class="th-width-explain">제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list }" var="n">
						<tr class="bg-p03">
							<c:if test="${n.noticeStatus == 1 }">
								<td><b>공지</b></td>
								<td>
									<b><a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></b>
								</td>
								<td><b>${n.noticeWriter }</b></td>
								<td><b>${n.readCount }</b></td>
								<td><b>${n.noticeDate }</b></td>
							</c:if>
						</tr>
						<tr>
							<c:if test="${n.noticeStatus == 0 }">
								<td>${n.noticeNo }</td>
								<td>
									<a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
								</td>
								<td>${n.noticeWriter }</td>
								<td>${n.readCount }</td>
								<td>${n.noticeDate }</td>
							</c:if>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="pagination">
			${pageNavi }
			</div>
			<div class="">
				<c:if test="${sessionScope.m.memberStatus == 0 }">
					<div class="area-btn right">
						<a href="/noticeWriteFrm.do" class="btn btn-pri size03">글쓰기</a>
					</div>
				</c:if>
			</div>
		</div>
		<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}"> 
		<div class="area-btn left" style="display:none;">
                <button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
				<button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
                <button class="btn btn-border-ter size01" type="button" id="alert03">경고</button>
                <button class="btn btn-border-black size01" type="button" id="alert04">정보</button>
        </div>
	</div>
	<script>
		$("#dayCheck").on("click",function(){	
			const memberNo = $("input[name='memberNo']").val(); 
			  $.ajax({
			    url: "/dayCheck.do",
			    type: 'get',
			    data: { "memberNo": memberNo },
			    success: function(data) {
			      console.log(data);
			      if(data == "success"){
			        $("#alert01").click();
			      } else {
			        $("#alert02").click();
			      }
			    },
			    error: function() {
			      console.error("에러");
			    }
			  });
			});

        $(function () {
            $("#alert01").on("click", function () {
                jQueryAlert('success',"출석체크 완료. 50포인트 적립!");
            });
            $("#alert02").on("click", function () {
                jQueryAlert('error',"오늘 출석 체크는 이미 완료되었습니다.");
            });
            $("#alert03").on("click", function () {
                jQueryAlert('warning',"경고내용경고내용경고내용경고내용");
            });
            $("#alert04").on("click", function () {
                jQueryAlert('info',"정보내용정보내용정보내용정보내용");
            });

            function jQueryAlert(type, msg) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    case 'success':
                    messageBox = $.parseHTML('<div class="alert__success"></div>');
                    break;
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error"></div>');
                    break;
                    case 'warning':
                    messageBox = $.parseHTML('<div class="alert__warning"></div>');
                    break;
                    case 'info':
                    messageBox = $.parseHTML('<div class="alert__info"></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");
                            location.href = '/noticeList.do?reqPage=1';
                        }
                    },
                    show: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    },
                    hide: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    }
                });
            };
        
        });
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>