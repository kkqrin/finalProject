<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
							<img src="/resources/upload/member/${sessionScope.m.memberPath }">
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
							<h4>${p.pointEa }</h4>
						</div>
						<div>
							<button type="button" class="btn btn-pri size01" id="dayCheck">출석체크</button>
						</div>
					</div>
				</div><!--member-info-top-->
				
				<div class="fake_hr"></div>
				
				<div class="member-info">
					<form action="/updateMember.do" method="post" enctype="multipart/form-data">
						<h5>정보 수정</h5>
						<div class="one-line">
							<div class="name-tag">아이디</div>
							<input id="notInput" type="text" name="memberId" value="${sessionScope.m.memberId }" readonly>
						</div>
						<div class="one-line">
							<div class="name-tag">본인인증</div>
							<div class="subDiv">
								<input type="text" name="memberPhone" value="${sessionScope.m.memberPhone }">
								<div>
								<a data-modal="#modalBasic">인증번호 변경하기</a>
								</div>
							</div>
							<div id="modalBasic" class="modal modal-sec">
								<div class="modal-content">
									<div class="modal-header" style="text-align: center;">
										<h5>핸드폰 번호 변경</h5>
									</div>
									<div class="modal-body" style="display: flex; flex-direction: column; align-items: end;">
										<input type="text" id="newMemberPhone" placeholder="숫자만 입력하세요('-'제외)" style="margin-bottom:3px;">
										<div style="display: flex;">
											<a style="line-height: 36px;margin-right: 10px;">인증번호가 전송되었습니다</a>
											<button class="btn btn-sec size01">인증번호 발송</button>
										</div>
										<input type="text" id="inputCerNum" placeholder="인증번호를 입력하세요" style="margin:3px 0;">
										<div style="display: flex;">
											<a style="line-height: 36px;margin-right: 10px;">인증 성공</a>
											<button class="btn btn-sec size01">인증하기</button>
										</div>
									</div>
									<div class="area-btn right">
										<a rel="modal:close" class="btn btn-ter size01 close">취소</a>
									</div>
								</div>
							</div><!--모달창-->
						</div><!--핸드폰 번호 영역-->
						<div class="one-line">
							<div class="name-tag">이메일</div>
							<div class="subDiv">
								<input type="text" name="memberEmail" value="${sessionScope.m.memberEmail }" placeholder="뭉쳐야산다 소식을 받을 수 있습니다">
								<a class="caution">형식을 확인해주세요</a>
							</div>
						</div>
						<div class="one-line">
							<div class="name-tag">주소</div>
							<div class="subDiv">
								<input type="text" name="memberZoneCode" value="${sessionScope.m.memberZoneCode }" placeholder="우편번호를 입력하지 않았습니다" readonly>
								<input type="text" name="memberAddr" value="${sessionScope.m.memberAddr }" placeholder="주소를 입력하지 않았습니다" readonly>
								<div>
								<a>주소 변경하기</a>
								</div>
							</div>
						</div>
						<div class="one-line">
							<div class="name-tag">은행</div>
							<div class="subDiv">
								<input type="hidden" id="memberBank" value="${sessionScope.m.memberBank}">
								<select class="select-custom" name="memberBank" style="border-width: 1px; border-radius: 4px; width: 360px; height: 38px; border-style: solid; border-color: var(--content-tertiary);">
									<option value="null" selected disabled hidden>은행을 선택하세요</option>
								</select>
								<input type="text" name="memberAccount" value="${sessionScope.m.memberAccount }" placeholder="계좌번호를 입력하세요('-'없이 숫자만)">
								<a class="caution">형식을 확인해주세요</a>
							</div>
						</div>
						<div class="one-line">
							<div class="name-tag">생일</div>
							<c:choose>
								<c:when test="${not empty sessionScope.m.memberBday }">
									<input id="notInput" type="text" name="memberBday" value="${sessionScope.m.memberBday }" readonly>
								</c:when>
								<c:otherwise>
									<div class="subDiv">
										<input type="text" name="memberBday" placeholder="생일을 입력하세요">
										<a class="caution">형식을 확인해주세요</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="one-line">
							<div class="name-tag">비밀번호 변경하기</div>
							<div class="subDiv" style="width: 360px;">
								<a style="text-align: left; line-height: 38px;">비밀번호 변경하기</a>
							</div>
						</div>
						<div class="area-btn center" style="margin-top: 30px;">
							<button class="btn btn-sec size02">정보 수정하기</button>
						</div>
					</form>
				</div><!-- member-info -->
				
				
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div><!-- mypage-wrap -->
	</div><!-- content-wrap -->
	

	




	<div class="area-btn left" style="display:none;">
		<button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
		<button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
	</div>
	
	<script>
		/*=======핸드폰 번호 인증===============*/
		$(".modal-body").children('#inputCerNum').css('display','none');
		$(".modal-body").children('div').eq(1).css('display','none');

		$(".modal-body").children().children('a').css('display','none');

		$(".modal-body").children('div').eq(0).children('button').on("click",function(){
			$(".modal-body").children().children('a').eq(0).css('display','block');
			$(".modal-body").children('#inputCerNum').fadeIn();
			$(".modal-body").children('div').eq(1).fadeIn();
		});//[인증번호 발송] 클릭 시


		


		/*=======모달 관련 기능==================================*/
		$(function () {
            $('[data-modal]').click(function (event) {
                    $($(this).data('modal')).modal({
						showClose: false,
                        fadeDuration: 100
                    });
                    return false;
            });
        });

		$(".close").on("click",function(){
			$(".modal-body").children('input').val("");
			$(".modal-body").children('#inputCerNum').css('display','none');
			$(".modal-body").children('div').eq(1).css('display','none');
			$(".modal-body").children().children('a').css('display','none');
		})

		
		
		
		
		$(".subDiv").children('div').children('a').eq(1).on("click",function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	console.log(data);
			        	$("[name='memberZoneCode']").val(data.zonecode);
			        	const addr = String(data.address);
			        	$("[name='memberAddr']").val(addr+" ");
			        	$("[name='memberAddr']").attr('readonly',false);
			        	$("[name='memberAddr']").focus();
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
			});//다음 지도 API	
		
		
		
		
	/*=======출석체크 관련================*/
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
                            location.href = '/myPage.do'
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

	

		$( function() {
				$( ".select-custom" ).selectmenu();
		});	

		const memberBank = ["NH농협은행","KB국민은행","신한은행","우리은행","하나은행","IBK기업은행","부산은행","경남은행",
								"대구은행","우체국은행","새마을금고","SC제일은행","광주은행","수협","전북은행","신협은행","제주은행","케이뱅크","카카오뱅크",
								"토스뱅크","카카오뱅크(미성년자)","토스뱅크(미성년자)","씨티은행","KDB산업"];	
		
		const selectMemberBank = $("#memberBank").val();
		function makeBankList(){
			let option="";
			for(let i = 0; i < memberBank.length ; i++){
				if(memberBank[i]==selectMemberBank){
				option = "<option value="+memberBank[i]+" selected>"+memberBank[i]+"</option>";
				}else{
				option = "<option value="+memberBank[i]+">"+memberBank[i]+"</option>";
				}
				$("[name='memberBank']").append(option);
			}
		}
		
		makeBankList();
		// 은행 selectBox 채우는 함수

	</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>