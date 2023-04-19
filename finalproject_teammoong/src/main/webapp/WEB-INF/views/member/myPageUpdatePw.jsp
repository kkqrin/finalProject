<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새로운 비밀번호 등록</title>
<link rel="stylesheet" href="/resources/css/member/searchId.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<div class="searchId-wrap">
			<div class="searchId-title"><h3>비밀번호 변경</h3></div>
			<div class="toPhone-view">
				<input type="hidden" name="memberId" value="${memberId }">
				<a>새로운 비밀번호</a>
				<input type="password" name="memberNewPw" placeholder="영문,숫자,특수문자(공백 제외)조합으로 8글자 이상">
				<a class="caution">영문,숫자,특수문자(공백 제외)조합으로 8글자 이상</a>
				<a style="display:block;margin-top:20px;">비밀번호 확인</a>
				<input type="password" name="memberNewPwRe" placeholder="비밀번호를 다시 한 번 입력해주세요">
				<a class="caution">비밀번호가 동일하지 않습니다</a>
				<div class="area-btn full">
				<button class="btn btn-pri size02 ChangePw">비밀번호 변경</button>
				</div>
			</div>
		</div>
	</div><!-- content-wrap -->

	<script>
		$(".ChangePw").on('click',function(){
			method();
		});
	
		$("[name='memberNewPw']").keyup(function(){
			const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~+@$!%*#?&])[A-Za-z\d~+@$!%*#?&]{8,}$/;
			const memberNewPw = $("[name='memberNewPw']").val();
			
			if(pwReg.test(memberNewPw) || memberNewPw==""){
				$("[name='memberNewPw']").removeClass("error");
				$(".caution").eq(0).css("display","none");
				$(".ChangePw").on('click',function(){
					method();
				});
			}else if(!pwReg.test(memberNewPw)){
				$("[name='memberNewPw']").addClass("error");
				$(".caution").eq(0).css("display","block");
				$(".ChangePw").off('click');
			}
		})//새 비밀번호 패스워드 정규표현식
	
	
		function method(){
			const memberId = $("[name='memberId']").val();
			
			const memberNewPw = $("[name='memberNewPw']").val();
			const memberNewPwRe = $("[name='memberNewPwRe']").val();
			
			if( memberNewPw=="" && memberNewPwRe =="" ){
				$("[name='memberNewPw']").focus();
			}else if( memberNewPw != memberNewPwRe ){
				$("[name='memberNewPwRe']").addClass("error");
				$("[name='memberNewPwRe']").focus();
				$(".caution").eq(1).css("display","block");
			}else if( memberNewPw == memberNewPwRe ){
				$("[name='memberNewPwRe']").removeClass("error");
				$(".caution").eq(1).css("display","none");
				$.ajax({
					url:"/updateNewPwMember.do",
					type:"post",
					data:{memberId:memberId, memberNewPw:memberNewPw},
					success:function(result){
						if(result=="ok"){
							location.href="/goToMsg.do"
						}
					}
				})//ajax
			}
		}//[비밀번호 변경]클릭했을 때
	
	</script>
	
</body>
</html>