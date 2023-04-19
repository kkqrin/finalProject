<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/member/searchId.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<div class="searchId-wrap">
			<div class="searchId-title"><h3>아이디 찾기</h3></div>
			<div class="menu-bar">
				<div class="toPhone focus"><h6>핸드폰으로 찾기</h6></div>
				<div class="toEmail"><h6>이메일로 찾기</h6></div>
			</div>
			<div class="toPhone-view">
				<a>이름</a>
				<input type="text" name="memberName" placeholder="이름을 입력해주세요">
				<a>핸드폰 번호</a>
				<input type="text" name="memberPhone" placeholder="가입시 등록한 핸드폰번호를 입력해주세요('-'없이 숫자만)">
				<a class="caution">핸드폰 번호를 확인해주세요</a>
				<div class="area-btn full">
				<button class="btn btn-pri size02 sendPhone">아이디 찾기</button>
				</div>
				<div style="text-align:center;margin-top:10px;">
					<a href="/searchPwFrm.do" style="text-decoration:underline;cursor:pointer;">비밀번호 찾기</a>
				</div>
			</div>
			<div class="toEmail-view">
				<a>이름</a>
				<input type="text" name="memberName" placeholder="이름을 입력해주세요">
				<a>이메일</a>
				<input type="text" name="memberEmail" placeholder="가입시 등록한 이메일을 입력해주세요">
				<a class="caution">이메일 형식을 확인해주세요</a>
				<div class="area-btn full">
				<button class="btn btn-pri size02 sendEmail">아이디 찾기</button>
				</div>
				<div style="text-align:center;margin-top:10px;">
					<a href="/searchPwFrm.do" style="text-decoration:underline;cursor:pointer;">비밀번호 찾기</a>
				</div>
			</div>
		</div>
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
				$(".toPhone-view").find('input').val("");
			}else if(index==1){
				$(".toEmail-view").css("display","block");
				$(".toPhone-view").css("display","none");
				$("[name='memberEmail']").removeClass("error");
				$(".caution").css("display","none");
				$(".toEmail-view").find('input').val("");
			}
		});//메뉴 움직이기 기능
	
	
		$("[name='memberPhone']").keyup(function(){
			let replace = $(this).val().replace("-","");
			$(this).val(replace);
		});//핸드폰 하이픈 빼기

		$(".sendPhone").on("click",function(){
			const pwReg = /^0+\d{9,10}$/;
			const inputPhone = $("[name='memberPhone']").val();

			if(pwReg.test(inputPhone) && inputPhone!=""){
				$("[name='memberPhone']").removeClass("error");
				$(".caution").css("display","none");
				
				const memberName = $("[name='memberName']").val();
				
				$.ajax({
					url:"/selectMemberId.do",
					type:"post",
					data:{memberName:memberName, memberPhone:inputPhone},
					success: function(memberId){
						if(memberId=="none"){
							alert("일치하는 회원 정보가 없습니다");
						}else{
							$(".menu-bar").hide();
							$(".toPhone-view").children('input').hide();
							$(".toPhone-view").children('a').hide();
							$(".toPhone-view").children('div').children('button').hide();
							
							const h5 = $("<h5>").text("회원님의 아이디는 [ "+memberId+" ] 입니다");
							h5.css("text-align","center");
							$(".toPhone-view").prepend(h5);
							
							const loginBtn = $("<button>").text("로그인하기");
							loginBtn.attr("onclick","location.href='/loginFrm.do'");
							loginBtn.addClass("btn btn-pri size02");
							loginBtn.css("margin-top","30px");
							$(".toPhone-view").children('div').append(loginBtn);

							const a = $("<a>").text("비밀번호 찾기");
							a.attr("href","/searchPwFrm.do");
							a.css("display","block");
							a.css("text-align","center");
							a.css("margin-top","10px");
							a.css("text-decoration","underline");
							$(".toPhone-view").append(a);
						}
					}//success
				})//ajax
			}else if($("[name='memberName']").val()==""){
				$("[name='memberName']").focus();
			}else if(!pwReg.test(inputPhone) || inputPhone==""){
				$("[name='memberPhone']").addClass("error");
				$(".caution").css("display","block");
			}

		}); //[핸드폰으로 아이디 찾기]버튼 눌렀을 때
	
	
		$(".sendEmail").on("click",function(){
			const emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
			const inputEmail = $("[name='memberEmail']").val();
			
			if(emailReg.test(inputEmail) && inputEmail!=""){
				$("[name='memberEmail']").removeClass("error");
				$(".caution").css("display","none");
				
				const memberName = $("[name='memberName']").eq(1).val();
				
				$.ajax({
					url:"/selectMemberId.do",
					type:"post",
					data:{memberName:memberName, memberEmail:inputEmail},
					success: function(memberId){
						if(memberId=="none"){
							alert("일치하는 회원 정보가 없습니다");
						}else{
							$(".menu-bar").hide();
							$(".toEmail-view").children('input').hide();
							$(".toEmail-view").children('a').hide();
							$(".toEmail-view").children('div').children('button').hide();
							
							const h5 = $("<h5>").text("회원님의 아이디는 [ "+memberId+" ] 입니다");
							h5.css("text-align","center");
							$(".toEmail-view").prepend(h5);
							
							const loginBtn = $("<button>").text("로그인하기");
							loginBtn.attr("onclick","location.href='/loginFrm.do'");
							loginBtn.addClass("btn btn-sec size02");
							loginBtn.css("margin-top","30px");
							$(".toEmail-view").children('div').append(loginBtn);
							
							const a = $("<a>").text("비밀번호 찾기");
							a.attr("href","/searchPwFrm.do");
							a.css("display","block");
							a.css("text-align","center");
							a.css("margin-top","10px");
							a.css("text-decoration","underline");
							$(".toEmail-view").append(a);
						}
					}//success
				})//ajax
			}else if($("[name='memberName']").eq(1).val()==""){
				$("[name='memberName']").focus();
			}else if(!emailReg.test(inputEmail) || inputEmail==""){
				$("[name='memberEmail']").addClass("error");
				$(".caution").css("display","block");
			}
			
			
		}) //[이메일로 아이디 찾기]버튼 눌렀을 때
		
		
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>