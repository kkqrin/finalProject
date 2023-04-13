<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">회원 정보 수정</div>
			<div class="mypage-content">
				<form action="/UpdateMember.do" method="post">
				
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }"><br>
				아이디:<input type="text" name="memberId" value="${sessionScope.m.memberId }"><br>
				생일:<input type="text" name="memberBDay" value="${sessionScope.m.memberBday }"><br>
				이메일:<input type="text" name="memberEmail" value="${sessionScope.m.memberEmail }"><br>
				휴대폰:<input type="text" name="memberPhone" value="${sessionScope.m.memberPhone }"><br>
				계좌번호:
				<c:choose>
					<c:when test="${empty sessionScope.m.memberAccount }">
						<select name="memberBank" id="noneBank" class="select-custom">
							<option value="null" selected disabled hidden>은행을 선택하세요</option>
						</select>
					</c:when>
					<c:otherwise>
						<input type="hidden" id="memberBank" value="${sessionScope.m.memberBank }">
						<select name="memberBank" id="Bank" class="select-custom">
						</select>
					</c:otherwise>
				</c:choose>
				<input type="text" name="memberAccount" value="${sessionScope.m.memberAccount }"><br>
				주소:<input type="text" name="memberAddr" value="${sessionScope.m.memberAddr }"><br>
				
				<div class="area-btn right">
					<button class="btn btn-sec size02" type="submit">회원정보 수정</button>
				</div>
				</form>
			</div>
		</div>
		
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />


<script>
			$( function() {
				$( ".select-custom" ).selectmenu();
			});	

	
			const memberBank = ["NH농협은행","KB국민은행","신한은행","우리은행","하나은행","IBK기업은행","부산은행","경남은행",
				  "대구은행","우체국은행","새마을금고","SC제일은행","광주은행","수협","전북은행","신협은행","제주은행","케이뱅크","카카오뱅크",
				  "토스뱅크","카카오뱅크(미성년자)","토스뱅크(미성년자)","씨티은행","KDB산업"];	
			
			function ifNoneMakeBankList(){
				for(let i = 0; i < memberBank.length ; i++){
					let option = "<option value="+memberBank[i]+">"+memberBank[i]+"</option>";
					$("#noneBank").append(option);
				}
			}
			
			function MakeBankList(){
				const mb= $("#memberBank").val();
				for(let i = 0; i < memberBank.length ; i++){
					if(mb == memberBank[i]){
						let option = "<option value="+memberBank[i]+" selected>"+memberBank[i]+"</option>";
						$("#Bank").append(option);
					}else{
						let option = "<option value="+memberBank[i]+">"+memberBank[i]+"</option>";
						$("#Bank").append(option);
					}
				}
			}
			
			
			if($("[name='memberAccount']").val()==""){
				ifNoneMakeBankList();
			}else{
				MakeBankList();
			}
			
			
			
			
			



</script>
</body>
</html>