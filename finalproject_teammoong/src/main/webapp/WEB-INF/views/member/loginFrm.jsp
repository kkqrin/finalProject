<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/loginFrm.css" />
<style>
	#bDayModal {
  	  	position: fixed;
    	top: 0;
    	left: 0;
    	width: 100%;
    	height: 100%;
    	background-color: rgba(0, 0, 0, 0.5);
    	display: none;
  	}
  	.bDayModal-content {
    	position: absolute;
    	top: 50%;
    	left: 50%;
    	transform: translate(-50%, -50%);
    	background-color: #fff;
    	padding: 10px;
    	width: 440px;
    	text-align: center;
  	}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<div class="memberLogin">
			<div class="login-title"><h3>로그인</h3></div>
			<div class="id-pw-input">
			
				<label for="id">아이디</label>
				<input class="input-basic" type="text" name="memberId" id="id" placeholder="아이디를 입력하세요" required>
				<label for="pw">비밀번호</label>
				<input class="input-basic" type="password" name="memberPw" id="pw" placeholder="비밀번호를 입력하세요" required>
				<div class="area-btn full">
					<button type="submit" id="login" class="btn btn-pri size02">로그인</button>
				</div>
				
			</div>
			<div class="search-zone">
				<a href="/searchIdFrm.do">아이디 찾기</a>
				<a href="/searchPwFrm.do">비밀번호 찾기</a>
			</div>
			<p class="proposalMsg">아직 뭉쳐야 산다 회원이 아니신가요? <a href="/signUpFrm.do"> 회원가입하기</a></p>
		</div>
	
	
	<div class="modal-ground" id="loginFail">
		<div id="modalSec" class="modal modal-sec">
			<div class="modal-content">
				<div class="modal-header">
					<h5>로그인 실패</h5>
				</div>
				<div class="modal-body">
					<!--내용영역-->
					<h5></h5>
					<p>아이디 혹은 비밀번호가 다릅니다</p>
					<!--//내용영역-->
				</div>
				<div class="area-btn center full">
					<a class="btn btn-sec size01 close">닫기</a>
				</div>
			</div>
		</div>
	</div><!-- 모달창 -->
	
	
	
	</div>
	<!--팝업모달-->
	<div id="bDayModal" class="bDayModal">
  		<div class="bDayModal-dialog">
    		<div class="bDayModal-content">
      			<div class="bDayMpodal-header">
        			<h4 class="bDayModal-title"><span id="bName"></span>님의 생일을 축하합니다!!</h4>
				</div>
			    <div class="bDayModal-body">
        			<img src="/resources/img/common/bday-coupon.png">
        			<p>마이페이지에서 쿠폰함을 확인해보세요</p>
        			<p>※생일날 가입하신분들은 지급해드릴 수 없어요 힝ㅠㅠ</p>
        		</div>
      			<div class="area-btn right">
        			<button type="button" class="btn btn-border-pri size01" id="closeBtn">닫기</button>
      			</div>
    		</div>
  		</div>
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
	
		$(function(){
			$("[name]").keypress(function(e){
				if(e.keyCode == 13){
					login();
				}
			});
		});
	
		$(".close").on("click",function(){
			$(".modal-ground").css("display","none");
		})
		
		
		$("#login").on("click",function(){
			login();	
		})
		
		
		function login(){
			const inputId = $("[name=memberId]").val();
			const inputPw = $("[name=memberPw]").val();

			if(inputId==""){
				$("[name=memberId]").focus();
				return false;
			}else if(inputPw==""){
				$("[name=memberPw]").focus();
				return false;
			}
		
			
			$.ajax({
				url: "/login.do",
				type: "post",
				data: {memberId : inputId, memberPw : inputPw},
				success : function(data){
					if(data=="ok"){
						location.href="/main.do";
					}else if(data=="bDay"){
						$(".bDayModal").css("display","flex");
						const memberId = $("#id").val();
						$("#bName").text(memberId);
					}else{
						$(".modal").css("display","flex");
						$("#loginFail").css("display","flex");			
					}
				}//ajax success구문
			})//ajax
		};
	

		
		
		//모달 관련 기능
        $(function () {
            $('#loginFail').click(function (event) {
                $($(this).data('modal')).modal({
                    fadeDuration: 100
                });
                return false;
            }); 
        });
		
		
		$("#closeBtn").on("click",function(){
			location.href="/main.do";
			$(".bDayModal").css("display","none");
		});
	</script>
</body>
</html>
