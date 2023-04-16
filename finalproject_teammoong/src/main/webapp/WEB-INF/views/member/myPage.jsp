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
				<form action="/updateMember.do" method="post" enctype="multipart/form-data">
				
				<div class="member-info-top">
					<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
					<div class="info-align">
						<div class="propic">
							<img src="/resources/upload/member/${sessionScope.m.memberPath }">
							<div class="modify-propic">
								<label for="fileUpload" class="fileUpload">
								<span class="material-symbols-outlined camera" style="cursor: pointer;">
									photo_camera
								</span>
								</label>
								<input type="file" name="memberPropic" id="fileUpload" accept=".gif, .jpg, .jpeg, .png" onchange="readURL(this);" style="display: none;">
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
						<h5>정보 수정</h5>
						<div class="one-line">
							<div class="name-tag">아이디</div>
							<input class="notInput" type="text" name="memberId" value="${sessionScope.m.memberId }" readonly>
						</div>
						<div class="one-line">
							<div class="name-tag">본인인증</div>
							<div class="subDiv">
								<input type="text" name="memberPhone" value="${sessionScope.m.memberPhone }" readonly>
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
											<a style="line-height: 36px;margin-right: 10px;"></a>
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
									<input class="notInput" id="bdayView" type="text" value="${sessionScope.m.memberBday }" readonly>
								</c:when>
								<c:otherwise>
									<div class="subDiv">
										<input type="text" name="memberBday" placeholder="생일을 입력하세요">
										<a class="caution">형식을 확인해주세요</a>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="area-btn center" style="margin: 10px 0 30px 0;">
							<button id="submit" class="btn btn-sec size02">정보 수정하기</button>
						</div>
					
					<div class="fake_hr"></div>
					
					<div class="one-line changePw">
							<div class="name-tag">비밀번호 변경하기</div>
							<div class="subDiv" style="width: 360px;">
								<a data-modal="#modelChangePw" style="text-align: left; line-height: 38px;">비밀번호 변경하기</a>
							</div>
					</div>
							<div id="modelChangePw" class="modal modal-sec">
									<div class="modal-content">
										<div class="modal-header" style="text-align: center;">
											<h5>비밀번호 변경</h5>
										</div>
										<div class="modal-body" style="display: flex; flex-direction: column;">
											
											
											<div class="name-tag">현재 비밀번호</div>
											<input type="password" name="memberPw" placeholder="현재 비밀번호를 입력하세요">
											<div class="name-tag">새로운 비밀번호</div>
											<input type="password" id="memberNewPw" placeholder="새로운 비밀번호를 입력하세요">
											<a class="caution">영문,숫자,특수문자(공백 제외)조합으로 8글자 이상</a>
											<div class="name-tag">새로운 비밀번호 확인</div>
											<input type="password" id="memberNewPwRe" placeholder="새로운 비밀번호를 다시 한 번 입력하세요">
											<a class="caution">값이 동일하지 않습니다</a>
											
											
										</div>
										<div class="area-btn right">
											<button id="pwSubmit" class="btn btn-sec size01" style="width: 85%;">변경하기</button>
											<a rel="modal:close" class="btn btn-ter size01 close2" style="width: 15%; text-align: center;">취소</a>
										</div>
									</div>
							</div><!--모달창-->
				</div><!-- member-info -->
				
				</form>
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div><!-- mypage-wrap -->
	</div><!-- content-wrap -->
	

	




	<div class="area-btn left" style="display:none;">
		<button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
		<button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
	</div>
	
	<script>
		
	
	
	 	let result = [true, true];
	 	//0이메일 형식 검사 1계좌번호 형식 검사
	 	
	 	$("#submit").on("click",function(){
	 		if(!result[0]||!result[1]){
	 			event.preventDefault();
	 		}
	 	})
	
	
		/*=======핸드폰 번호 인증===============*/
		let regCheck = false;
		
		$(".modal-body").children('#inputCerNum').css('display','none');
		$(".modal-body").children('div').eq(1).css('display','none');

		$(".modal-body").children().children('a').css('display','none');

		$(".modal-body").children('div').eq(0).children('button').on("click",function(){
			if(regCheck){
				$(".modal-body").children().children('a').eq(0).text('인증번호가 전송되었습니다');
				$(".modal-body").children().children('a').eq(0).css('display','block');
				$(".modal-body").children('#inputCerNum').val('');
				$(".modal-body").children('#inputCerNum').fadeIn();
				$(".modal-body").children('div').eq(1).fadeIn();
			}else{
				return false;
			}
		});//[인증번호 발송] 클릭 시

		
		$("#newMemberPhone").on("change",function(){
			//핸드폰 정규표현식
			const pwReg = /^\d{3}-\d{3,4}-\d{4}$/;
			const pwReg2 = /^0+\d{9,10}$/;
			const inputPhone = $(this).val();

			if(pwReg.test(inputPhone) || pwReg2.test(inputPhone) || inputPhone==""){
				$(this).removeClass("error");
				$(".modal-body").children().children('a').eq(0).text('');
				$(".modal-body").children().children('a').eq(0).css('display','none');
				let replace = $(this).val().replaceAll("-","");
				$(this).val(replace);
				regCheck = true;
			}else{
				$(this).addClass("error");
				$(".modal-body").children().children('a').eq(0).text('핸드폰 형식을 확인해주세요');
				$(".modal-body").children().children('a').eq(0).css('display','block');
				$(".modal-body").children('#inputCerNum').fadeOut();
				$(".modal-body").children('div').eq(1).fadeOut();
				regCheck = false;
			}
		})//핸드폰 형식 검사
				
				
		let cerCode=""; //★핸드폰 인증코드!!!
		$(".modal-body").children('div').eq(0).children('button').on("click",function(){
			const memberPhone = $("#newMemberPhone").val();
			console.log(memberPhone);
// 			$.ajax({
// 				url: "/memberPhoneCheck.do",
// 				type: "post",
// 				data: {memberPhone : replace},
// 				success : function(code){
// 					cerCode = code;
// 				}//ajax success구문
// 			})//ajax
		})//문자메시지 보내기 + 코드 받기
		

		


	/*=======핸드폰 모달 관련 기능==================================*/
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
			$(".modal-body").children('input').removeClass("error");
		});

		
			
	/*====이메일 관련===========================================*/
			
			$("[name='memberEmail']").on("change",function(){
				//이메일 정규표현식
				const emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				const inputEmail = $(this).val();
				if(emailReg.test(inputEmail) || inputEmail==""){
					$(this).removeClass("error");
					$(".caution").eq(0).fadeOut();
					result[0] = true;
				}else{
					$(this).addClass("error");
					$(".caution").eq(0).fadeIn();
					result[0] = false;
				}
			})//이메일 정규표현식	
		
			
			
			
	/*====주소 관련===========================================*/	
		$(".subDiv").children('div').children('a').eq(1).on("click",function(){
				new daum.Postcode({
			        oncomplete: function(data) {
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
		
	
	/*====계좌 관련==========================================*/	
		$("[name='memberAccount']").keyup(function(){
			const inputAccount = $("[name='memberAccount']").val();
			const AcountReg = /^[0-9]+$/;
			
			const inputAccount2 = $(this).val().replaceAll("-","");
			$(this).val(inputAccount2);
			
			if(AcountReg.test(inputAccount) || inputAccount==""){
		        $(this).removeClass("error");
		        $(".caution").eq(1).css("display","none");
		        result[1] = true;
			}else{
				$(this).addClass("error");
				$(".caution").eq(1).css("display","block");
				result[1] = false;
			}
		});//계좌번호 정규표현식	
			
		
	/*====생일 관련==========================================*/		
		
		
		
		
			
	/*====비밀번호 수정 관련==========================================*/			
		
		$(function () {
            $('[data-modal]').click(function (event) {
                    $($(this).data('modal')).modal({
						showClose: false,
                        fadeDuration: 100
                    });
                    return false;
            });
        });//모달창
        
        $(".close2").on("click",function(){
			$(".modal-body").children('input').val("");
			$(".modal-body").children('input').removeClass("error");
			$(".modal-body").children('a').css('display','none');
		})//모달창 [취소]버튼

		
		$("#pwSubmit").on("click",function(){
			const memberId = $('[name=memberId]').val();
			const memberPw = $('[name=memberPw]').val();
			const memberNewPw = $("#memberNewPw").val();
			
			if(memberPw!="" && $("#memberNewPw").val()!="" && $("#memberNewPw").val() == $("#memberNewPwRe").val()){
				$(".modal-body").children('a').eq(1).hide();
				$.ajax({
					url : "/updateNewPwMember.do",
					type : "post",
					data : {memberId:memberId, memberPw:memberPw, memberNewPw:memberNewPw},
					success: function(result){
						if(result == "ok"){
							alert("비밀번호가 성공적으로 변경되었습니다");
							$(".close2").click();
						}else{
							alert("입력하신 [현재 비밀번호]가 틀립니다. 다시 한 번 확인해주세요.");
						}
					}//ajax success문
				});
			}else if(memberPw==""){
				$('[name=memberPw]').focus();
			}else if($("#memberNewPw").val()=="" && $("#memberNewPwRe").val()==""){
				$(".modal-body").children('a').eq(1).hide();
				$("#memberNewPw").focus();
			}else{
				$(".modal-body").children('a').eq(1).show();
			}
		})//[변경하기] 버튼
		
		
		
		
		
		
		
		
		
	/*=======출석체크 관련================*/
		$("#dayCheck").on("click",function(){
			let memberNo = $('[name=memberNo]').val();
			$.ajax({
				url: "/dayCheck.do",
				type: "get",
				data: {memberNo : memberNo},
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

		
		
		
		
		
		/*=======기타 등등================*/

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
		
		
		
		function readURL(input) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(".propic").children('img').attr('src',e.target.result);
			};
			reader.readAsDataURL(input.files[0]);
			alert("[정보 수정하기]버튼을 눌러주셔야 새로운 이미지가 반영됩니다!");
		}
		//파일 이미지


	</script>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>