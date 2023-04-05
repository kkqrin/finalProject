<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/member/signUpFrm.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
				<div class="banner">
					<h4>회원가입</h4>
					<h2>흩어지면 비싸다, 뭉쳐야 산다.</h2>
				</div>
	<div class="content-wrap">

		

		<div class="signUp-form">
			<div class="signUp-title">
				<p class="notice"><span>*</span>필수입력사항</p>
			</div><!--signUp-title-->


			<form action="/join.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td><label for="id"><span>*</span>아이디</label></td>
						<td colspan="3"><input type="text" name="memberId" id="id" placeholder="아이디를 입력해주세요"></td>
						<td><button type="button" id="idChk" class="btn btn-sec size02">중복확인</button></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution idChk" colspan="3"><a>6자 이상 16자 이하의 영문, 영문+숫자</a></td>
					</tr>
					<tr>
						<td><label for="pw"><span>*</span>비밀번호</label></td>
						<td colspan="3"><input type="password" name="memberPw" id="pw" placeholder="비밀번호를 입력해주세요"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>영문/숫자/특수문자(공백 제외) 중 2개 이상 조합, 10글자 이상</a></td>
					</tr>
					<tr>
						<td><label for="pwRe"><span>*</span>비밀번호확인</label></td>
						<td colspan="3"><input type="password" id="pwRe" placeholder="비밀번호를 한번 더 입력해주세요"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>동일한 비밀번호를 입력해주세요</a></td>
					</tr>
					<tr>
						<td><label for="name"><span>*</span>이름</label></td>
						<td colspan="3"><input type="text" name="memberName" id="name" placeholder="이름을 입력해주세요"></td>
					</tr>
					<tr>
						<td><label for="email"><span>*</span>이메일</label></td>
						<td colspan="3"><input type="text" name="memberEmail" id="email" placeholder="예시) moongsan@google.com"></td>
						<td><button type="button" id="emailChk" class="btn btn-sec size02">중복확인</button></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>이메일 양식이 올바르지 않습니다</a></td>
					</tr>
					<tr class="emailChk" style="display: none;">
						<td></td>
						<td colspan="3"><input type="text" id="emailChk" placeholder="입력한 이메일로 전송된 인증번호를 입력해주세요"></td>
						<td><button type="button" id="cerNumChk" class="btn btn-sec size02">인증번호 확인</button></td>	
					</tr>
					<tr>
						<td><label for="phone"><span>*</span>휴대폰</label></td>
						<td colspan="3"><input type="text" name="memberEmail" id="phone"></td>
						<td><button type="button" id="phoneChk" class="btn btn-sec size02">인증번호 발송</button></td>	
					</tr>
					<tr class="cerNumChk" style="display: none;">
						<td></td>
						<td colspan="3"><input type="text" id="cerNum" placeholder="인증번호를 입력해주세요"></td>
						<td><button type="button" id="cerNumChk" class="btn btn-sec size02">인증번호 확인</button></td>	
					</tr>
					<tr class="caution-tr cerNumChk">
						<td></td>
						<td class="caution phoneCaution" colspan="3"><a>인증번호가 오지 않는다면, 통신사 스팸 서비스 혹은 휴대폰 번호 차단 여부를 확인해주세요</a></td>
					</tr>
					<tr>
						<td class="addr"><label for="addr"><span>*</span>주소</label></td>
						<td colspan="3"><input type="text" name="memberAddr"  placeholder="기본배송지로 등록됩니다"></td>
						<td><button type="button" id="addr" class="btn btn-sec size02">우편번호 조회</button></td>	
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" id="cerNum" placeholder="우편번호 조회 버튼을 눌러 값을 입력해주세요" readonly></td>
					</tr>
					<tr>
						<td><span style="color: red; font-size: 20px;">*</span>성별</td>
						<td>
							<input type="radio" name="memberGender" id="m" value="1">
							<label for="m">남자</label>
						</td>
						<td id="no">
							<input type="radio" name="memberGender" id="f" value="2">
							<label for="f">여자</label>
						</td>
						<td>
							<input type="radio" name="memberGender" id="n" value="3">
							<label for="n">선택안함</label>
						</td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>더 나은 상품 제공을 위한 통계 용도로만 사용됩니다</a></td>
					</tr>
					<tr>
						<td><label for="id">계좌번호</label></td>
						<td colspan="3">
							<select class="select-custom" name="memberAccount">
								<option value="" selected disabled hidden>은행을 선택하세요</option>
								<option value="우리은행">우리은행</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" id="cerNum" placeholder="계좌번호를 입력하세요"></td>
					</tr>
					<tr>
						<td><label for="id">생년월일</label></td>
							<input type="hidden" name="memberBDay">
						<td id="no"><div class="bday-input"><input type="text" id="year" class="input-noborder">년</div></td>
						<td id="no">
							<select id="month" class="select-custom">
								<c:forEach var="i" begin="1" end="12" step="1">
									<option value="${i }">${i }월</option>
								</c:forEach>
							</select>
						</td>
						<td id="no"><div class="bday-input"><input type="text" id="day" class="input-noborder">일</div></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>생일 쿠폰이 발급됩니다! (최초 등록 후 수정 불가)</a></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>제대로된 날짜를 입력하세요</a></td>
					</tr>
					<tr>
						<td><label for="id">프로필사진</label></td>
						<td colspan="3">
							<div class="proPic">안녕</div>
							<div class="proPic-info">
								사진 업로드에 대한 설명
								<input type="file" name="memberPath">
							</div>
						</td>
					</tr>
			</form>
		</div><!--signUp-form-->





	</div><!--content-wrap-->





	<script>
			$("#emailChk").on("click",function(){
				$(".emailChk").show(200);
			})
	
	
			$("#phoneChk").on("click",function(){
				$(".cerNumChk").show(200);
			})

			$( function() {
				$( ".select-custom" ).selectmenu();
			});
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>