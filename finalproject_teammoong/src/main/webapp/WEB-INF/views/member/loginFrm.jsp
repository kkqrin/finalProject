<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/loginFrm.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	
	
	<div class="content-wrap">
		<div class="memberLogin">
			<div class="login-title"><h3>로그인</h3></div>
			<div class="id-pw-input">
			
				<label for="id">아이디</label>
				<input class="input-basic" type="text" name="memberId" id="id" placeholder="아이디를 입력하세요">
				<label for="pw">비밀번호</label>
				<input class="input-basic" type="password" name="memberPw" id="pw" placeholder="비밀번호를 입력하세요">
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
	
	
	<div class="modal-ground">
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
	                  <a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
	              </div>
	          </div>
	    </div>
	</div><!-- 모달창 -->
	
	
	
	</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />

	<script>
		$("#login").on("click",function(){
			const inputId = $("[name=memberId]").val();
			const inputPw = $("[name=memberPw]").val();
			
			$.ajax({
				url: "/login.do",
				type: "post",
				data: {memberId : inputId, memberPw : inputPw},
				success : function(data){
					if(data=="ok"){
						location.href="/main.do";
					}else{
						$(".modal").css("display","flex");
						$(".modal-ground").css("display","flex");			
					}
				}//ajax success구문
			})//ajax
		})
		
		
		
		//모달 관련 기능
        $(function () {
            $('[data-modal]').click(function (event) {
                const modalId = $(this).data('modal');
                if ($(modalId).hasClass('modal-pri')) {
                    $($(this).data('modal')).modal({
                        fadeDuration: 100
                    });
                    return false;
                } else if ($(modalId).hasClass('modal-sec')) {
                    $($(this).data('modal')).modal({
                        escapeClose: false,
                        showClose: false,
                        fadeDuration: 100
                    });
                    return false;
                } else {
                    return false;
                }
            });
            
        });
	</script>
</body>
</html>
