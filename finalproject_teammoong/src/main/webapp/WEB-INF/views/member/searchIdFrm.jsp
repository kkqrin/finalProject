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
				<input type="text" name="memberPhone" placeholder="핸드폰번호를 입력해주세요('-'없이 숫자만)">
				<a class="caution">핸드폰 번호를 확인해주세요</a>
				<div class="area-btn full">
				<button class="btn btn-sec size02 sendPhone">아이디 찾기</button>
				</div>
			</div>
			<div class="toEmail-view">
				<a>이름</a>
				<input type="text" name="memberName" placeholder="이름을 입력해주세요">
				<a>이메일</a>
				<input type="text" name="memberEmail" placeholder="가입시 등록한 이메일을 입력해주세요">
				<div class="area-btn full">
				<button class="btn btn-sec size02 sendPhone">아이디 찾기</button>
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
			}else if(index==1){
				$(".toEmail-view").css("display","block");
				$(".toPhone-view").css("display","none");
			}
		});
	
	
	
	
	
	
	
	
		$("[name='memberPhone']").keyup(function(){
			let replace = $(this).val().replace("-","");
			$(this).val(replace);
		});//핸드폰 하이픈 빼기

		$(".sendPhone").on("click",function(){
			const pwReg = /^0+\d{9,10}$/;
			const inputPhone = $("[name='memberPhone']").val();

			if(pwReg.test(inputPhone) || inputPhone==""){
				$("[name='memberPhone']").removeClass("error");
				$(".caution").css("display","none");
			}else{
				$("[name='memberPhone']").addClass("error");
				$(".caution").css("display","block");
			}

		}); //[인증번호 발송]버튼 눌렀을 때
	
		
		
		
		
		
		
	</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>