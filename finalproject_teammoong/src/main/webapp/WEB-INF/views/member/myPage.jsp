<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.modify-propic>.material-symbols-outlined.camera{
		font-variation-settings:
		'FILL' 1,
		'wght' 100,
		'GRAD' -25,
		'opsz' 20;
	}

	</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />



	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">회원 정보</div>
			<div class="mypage-content">
				
				<div class="member-info-top">
					<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
					<div class="info-align">
						<div class="propic">
							<c:choose>
								<c:when test="${sessionScope.m.memberPath eq 'moongs.png' }">
									<img src="/resources/upload/member/common/moongs.png">
								</c:when>
								<c:otherwise>
									<img src="/resources/upload/member/${sessionScope.m.memberPath }">
								</c:otherwise>
							</c:choose>
							<div class="modify-propic">
								<span class="material-symbols-outlined camera">
									photo_camera
								</span>
							</div>
						</div>
						<div class="name-zone">
							<p class="tag">현재 프로필</p>
							<h4>${sessionScope.m.memberName }</h4>
						</div>
						<div class="point-zone">
							<p class="tag">현재 포인트</p>
							<h4>5000P</h4>
						</div>
						<div>
							<button type="button" class="btn btn-pri size01" id="dayCheck">출석체크</button>
						</div>
					</div>
				</div><!--member-info-top-->
				
				<div class="fake_hr"></div>
				
				<div>

					
				</div>
				
				
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div><!-- mypage-wrap -->
	</div><!-- content-wrap -->
	


	<div class="area-btn left" style="display:none;">
		<button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
		<button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
	</div>
	
	<script>
	
		$("#dayCheck").on("click",function(){	
			const memberNo = $("input[name='memberNo']").val(); 
			
			$.ajax({
				url: "/dayCheck.do",
				type: 'get',
				data: { "memberNo": memberNo },
				success: function(data) {
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