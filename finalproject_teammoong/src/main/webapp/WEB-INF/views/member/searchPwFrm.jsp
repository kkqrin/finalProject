<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchId.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<div class="searchId-wrap">
			<div class="searchId-title"><h3>비밀번호 찾기</h3></div>
			<div class="menu-bar">
				<div class="toPhone focus"><h6>핸드폰으로 찾기</h6></div>
				<div class="toEmail"><h6>이메일로 찾기</h6></div>
			</div>
			<div class="toPhone-view">
				<a>아이디</a>
				<input type="text" name="memberId" placeholder="아이디를 입력해주세요">
				<a>핸드폰 번호</a>
				<input type="text" name="memberPhone" placeholder="가입시 등록한 핸드폰번호를 입력해주세요('-'없이 숫자만)">
				<a class="caution">핸드폰 번호를 확인해주세요</a>
				<div class="area-btn full">
				<button type="button" class="btn btn-pri size02 sendPhone">인증번호 발송</button>
				</div>
				<div style="text-align:center;margin-top:10px;">
					<a href="/searchIdFrm.do" style="text-decoration:underline;cursor:pointer;">아이디 찾기</a>
				</div>
			</div>
			<div class="toEmail-view">
				<a>아이디</a>
				<input type="text" name="memberId" placeholder="아이디를 입력해주세요">
				<a>이메일</a>
				<input type="text" name="memberEmail" placeholder="가입시 등록한 이메일을 입력해주세요">
				<a class="caution">이메일 형식을 확인해주세요</a>
				<div class="area-btn full">
				<button class="btn btn-pri size02 sendEmail">인증번호 발송</button>
				</div>
				<div style="text-align:center;margin-top:10px;">
					<a href="/searchIdFrm.do" style="text-decoration:underline;cursor:pointer;">아이디 찾기</a>
				</div>
			</div>
		</div>
		<form action="/updateNewPwMemberFrm.do" type="post">
			<input type="hidden" name="hideMemberId" value="">
			<button class="submitBtn"></button>
		</form>
	</div><!-- content-wrap -->
	
	
	<script>
		$(".menu-bar>div").on("click",function(){
			$(".menu-bar>div").removeClass("focus");
			$(this).addClass("focus");
			 
			const index = $(".menu-bar>div").index(this); 
			if(index==0){
				$(".toPhone-view").css("display","block");
				$(".toEmail-view").css("display","none");
				$("[name='memberPhone']").removeClass("error");
				$(".caution").css("display","none");
				
				$(".toPhone-view").find('a').eq(1).text('핸드폰 번호')
				$(".toPhone-view").find('input').eq(1).attr('placeholder',"가입시 등록한 핸드폰번호를 입력해주세요('-'없이 숫자만)");
				
				$(".sendPhone").show();
				$(".cerNumChk").hide();
				
				$(".toPhone-view").find('input').val("");
				$("[name='memberId']").attr('readonly',false);
				
			}else if(index==1){
				$(".toEmail-view").css("display","block");
				$(".toPhone-view").css("display","none");
				$("[name='memberEmail']").removeClass("error");
				$(".caution").css("display","none");
				
				$(".toEmail-view").find('a').eq(1).text('이메일')
				$(".toEmail-view").find('input').eq(1).attr('placeholder',"가입시 등록한 이메일을 입력해주세요");
				$(".toEmail-view").find('input').eq(1).attr('name','memberEmail');
				
				$(".sendPhone").show();
				$(".cerNumChk").hide();
				
				$(".toEmail-view").find('input').val("");
				$("[name='memberId']").attr('readonly',false);
			}
		});//메뉴 움직이기 기능
		
		
		$(".sendPhone").on("click",function(){
			const pwReg = /^0+\d{9,10}$/;
			const inputPhone = $("[name='memberPhone']").val();

			if(pwReg.test(inputPhone) && inputPhone!=""){
				$("[name='memberPhone']").removeClass("error");
				$(".caution").css("display","none");
				
				const memberId = $("[name='memberId']").val();
				
				$.ajax({
					url:"/selectMemberId.do",
					type:"post",
					data:{memberId:memberId, memberPhone:inputPhone},
					success: function(result){
						if(result=="none"){
							alert("일치하는 회원 정보가 없습니다");
						}else{
							$("[name='memberId']").attr('readonly',true);
							
							$(".toPhone-view").find('a').eq(1).text('인증번호 입력')
							$(".toPhone-view").find('input').eq(1).attr('placeholder','인증번호를 입력해주세요');
							$(".toPhone-view").find('input').eq(1).val("");
							$(".toPhone-view").find('input').eq(1).focus();
								
							const a = $("<a>").html(inputPhone+"으로 인증번호를 전송했습니다");
							a.addClass("caution");
							a.css("display","block");
							$(".toPhone-view").find('input').eq(1).before(a);
							
							
							$(".toPhone-view").find('button').hide();
							const cerNumChk = $("<button>").text("인증번호 확인");
							cerNumChk.addClass("btn btn-ter size02 cerNumChk");
							cerNumChk.css("margin-top","30px");
							$(".toPhone-view").find('.area-btn').append(cerNumChk);
						}
					}//success
				})//ajax
			}else if($("[name='memberId']").val()==""){
				$("[name='memberId']").focus();
			}else if(!pwReg.test(inputPhone) || inputPhone==""){
				$("[name='memberPhone']").addClass("error");
				$(".caution").css("display","block");
			}

		}); //[핸드폰으로 비밀번호 찾기]
		
		
		
		
		$(".sendEmail").on("click",function(){
			const emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			const inputEmail = $("[name='memberEmail']").val();
			
			if(emailReg.test(inputEmail) && inputEmail!=""){
				$("[name='memberEmail']").removeClass("error");
				$(".caution").css("display","none");
				
				const memberId = $("[name='memberId']").eq(1).val();
				
				$.ajax({
					url:"/selectMemberId.do",
					type:"post",
					data:{memberId:memberId, memberEmail:inputEmail},
					success: function(memberId){//★일치하는 회원정보가 있는지
						if(memberId=="none"){
							alert("일치하는 회원 정보가 없습니다");
						}else{
							alert("인증번호를 전송합니다. 잠시만 기다려주세요!");	
							$("[name='memberId']").eq(1).attr('readonly',true);
							$.ajax({
								url:"/sendEmailMember.do",
								data:{memberEmail:inputEmail},
								success: function(code){//★메일 인증번호 쏴줌
									$(".toEmail-view").find('a').eq(1).text('인증번호 입력')
									$(".toEmail-view").find('input').eq(1).attr('placeholder','인증번호를 입력해주세요');
									$(".toEmail-view").find('input').eq(1).val("");
									$(".toEmail-view").find('input').eq(1).attr('name','inputCode');
									$(".toEmail-view").find('input').eq(1).focus();
									
									let replace = $("[name='inputCode']").val().replace(" ","");
									$("[name='inputCode']").val(replace);
									const a = $("<a>").html(inputEmail+"으로 인증번호를 전송했습니다");
									a.addClass("caution");
									a.css("display","block");
									$(".toEmail-view").find('input').eq(1).before(a);
									
									
									$(".toEmail-view").find('button').hide();
									const cerNumChk = $("<button>").text("인증번호 확인");
									cerNumChk.addClass("btn btn-ter size02 cerNumChk");
									cerNumChk.css("margin-top","30px");
									$(".toEmail-view").find('.area-btn').append(cerNumChk);
									
									
									$(".cerNumChk").on("click",function(){
										if(code == $("[name='inputCode']").val()){//★인증성공
											console.log("멤버 아이디는:"+memberId)
											/* 
											const form = $("<form>");
											form.attr('action','/updateNewPwMemberFrm.do');
											form.attr('method','post');
											const hideInput = $("<input>");
											hideInput.attr('type','hidden');
											hideInput.attr('name','hideMemberId');
											hideInput.val(memberId);
											const submitBtn = $("<button>");
											
											form.append(hideInput);
											form.append(submitBtn);
											console.log(hideInput)
											alert(hideInput)
											$(".toEmail-view").append(form); 
											*/
											$("[name='hideMemberId']").val(memberId);
											$(".submitBtn").click();
											
										}else{//★인증실패
											alert("인증번호가 틀립니다");
											location.reload(true);
										}
									})//메일 발송 후 [인증번호 확인]버튼 누를 때
									
									
								}//두번째 ajax success
								
							})//두번째 ajax
							
						}//else(회원정보 있을 때)
					}//첫번째 ajax success
				})//ajax
			}else if($("[name='memberName']").eq(1).val()==""){
				$("[name='memberName']").focus();
			}else if(!emailReg.test(inputEmail) || inputEmail==""){
				$("[name='memberEmail']").addClass("error");
				$(".caution").css("display","block");
			}
			
			
		}) //[이메일로 비밀번호 찾기]
		
		
		
		
	
	</script>
	
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>