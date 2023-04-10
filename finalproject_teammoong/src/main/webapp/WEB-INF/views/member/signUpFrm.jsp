<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="/resources/css/member/signUpFrm.css" />
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="banner">
		
		<div>
			<div>
				<h4>회원가입</h4>
				<h2>흩어지면 비싸다, 뭉쳐야 싸게 산다.</h2>
			</div>
		</div>
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
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td><label for="pw"><span>*</span>비밀번호</label></td>
						<td colspan="3"><input type="password" name="memberPw" id="pw" placeholder="비밀번호를 입력해주세요"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
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
						<td><label for="phone"><span>*</span>휴대폰</label></td>
						<td colspan="3"><input type="text" name="memberPhone" id="phone"></td>
						<td><button type="button" id="phoneChk" class="btn btn-sec size02">인증번호 발송</button></td>	
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr class="cerNumChk" style="display: none;">
						<td></td>
						<td colspan="3"><input type="text" id="cerNum" placeholder="인증번호를 입력해주세요"></td>
						<td><button type="button" id="cerNumChk" class="btn btn-sec size02">인증번호 확인</button></td>	
					</tr>
					<tr>
						<td class="addr"><label for="addr"><span>*</span>주소</label></td>
						<td colspan="3"><input type="text" name="memberAddr"  placeholder="기본배송지로 등록됩니다" readonly></td>
						<td><button type="button" id="addr" class="btn btn-sec size02">우편번호 조회</button></td>	
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" id="addrDetail" placeholder="우편번호 조회 버튼을 눌러 값을 입력해주세요" readonly></td>
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
					<tr class="caution-tr gender">
						<td></td>
						<td class="caution" colspan="3"><a>더 나은 상품 제공을 위한 통계 용도로만 사용됩니다</a></td>
					</tr>
					<tr>
						<td><label for="email">본인확인 이메일</label></td>
						<td colspan="3"><input type="text" name="memberEmail" id="email" placeholder="예시) moongsan@google.com"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td><label for="id">계좌번호</label></td>
						<td colspan="3">
							<select class="select-custom" name="memberBank">
								<option value="null" selected disabled hidden>은행을 선택하세요</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" name="memberAccount" placeholder="계좌번호를 입력하세요('-'없이)"></td>
					</tr>
					<tr>
						<td><label for="id">생년월일</label></td>
							<input type="hidden" name="memberBDay" value="">
						<td id="no"><div class="bday-input"><input type="text" id="birth-year" class="input-noborder">년</div></td>
						<td id="no">
							<select id="birth-month" class="select-custom">
								<c:forEach var="i" begin="1" end="12" step="1">
									<c:if test="${i<10}">
										<option value="0${i }">0${i }월</option>
									</c:if>
									<c:if test="${10<=i}">
										<option value="${i }">${i }월</option>
									</c:if>
							
								</c:forEach>	
							</select>
						</td>
						<td id="no"><div class="bday-input"><input type="text" id="birth-day" class="input-noborder">일</div></td>
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
						<td class="proPic-zone" colspan="3" id="no">
							<div class="proPic-left">
								<div class="proPic">
									<img id="preview" src="/resources/upload/member/common/moongs.png">
								</div>
							</div>
							<div class="proPic-right">
								<label class="fileUpload" for="fileUpload">
									프로필 사진 업로드
								</label>
								<label class="deletePic" onclick="readURL(0);" style="display: none;">
									사진 삭제하기
								</label>
								<input type="file" name="memberPath" id="fileUpload" accept=".gif, .jpg, .jpeg, .png" onchange="readURL(this);" style="display: none;">
								<p>
									64x64 사이즈에 최적화되어 있습니다.
								</p>
								<p class="uploadNotice">
									(000KB미만만 가능, .jpg,.png,.gif만 가능)
								</p>
								<p class="uploadNotice o">
									미설정 시 뭉산의 기본 아이콘이 제공됩니다
								</p>
							</div>
						</td>
					</tr>
				</table>
				<div class="terms">
					<div><span style="color: red; font-size: 20px;">*</span>이용약관동의</div>
					<div class="check">
						<ul>
							<li>
								<input type="checkbox" name="allcheck" id="allcheck">
								<label for="allCheck">전체 동의합니다</label>
							</li>
							<li>
								<input type="checkbox" name="agree" id="agree1">
								<label for="agree1">이용약관 동의(필수)</label><a>약관보기></a>
							</li>
							<li>
								<input type="checkbox" name="agree" id="agree2">
								<label for="agree2">마케팅 활용동의(선택)</label><a>약관보기></a>
								
							</li>
							<li>
								<input type="checkbox" name="agree" id="agree3">
								<label for="agree3">본인은 만 14세 이상입니다.(필수)</label>
							</li>
						</ul>
					</div>
				</div>
				<div class="area-btn center">
				<button class="btn btn-pri size02" type="button" id="submit">가입하기</button>
				</div>	
			</form>
		</div><!--signUp-form-->





	</div><!--content-wrap-->





	<script>
	
			const memberBank = ["NH농협은행","KB국민은행","신한은행","우리은행","하나은행","IBK기업은행","부산은행","경남은행",
								  "대구은행","우체국은행","새마을금고","SC제일은행","광주은행","수협","전북은행","신협은행","제주은행","케이뱅크","카카오뱅크",
								  "토스뱅크","카카오뱅크(미성년자)","토스뱅크(미성년자)","씨티은행","KDB산업"];	
		
			function makeBankList(){
				for(let i = 0; i < memberBank.length ; i++){
					let option = "<option value="+memberBank[i]+">"+memberBank[i]+"</option>";
					$("[name='memberBank']").append(option);
				}
			}
			
			makeBankList();
			// 은행 selectBox 채우는 함수
			
			
			
			const result = [false, false, false, false, false, false]; //정규표현식 검사
			//0아이디,1비밀번호,2비밀번호 확인,3핸드폰양식,4본인확인 이메일,5생년월일
			
			$("[name='memberId']").keyup(function(){
				//영문 혹은 영문+숫자, 8자 이상 16자 이하
				const idReg = /^[a-z0-9]{8,16}$/;
				const inputId = $(this).val();
				if(idReg.test(inputId)){
					$(".caution").eq(0).html("<a>사용 가능한 아이디 입니다.</a>");
					$(".caution").eq(0).children().css("color","#3a3a3a");
			        $(this).removeClass("error");
			        result[0] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(0).css("display","table-row");
					$(".caution").eq(0).children().css("color","var(--secondary)");
					$(".caution").eq(0).html("<a>영문 혹은 영문+숫자, 6자 이상 16자 이하</a>");
					result[0] = false;
				}
			})//아이디 정규표현식

			
			$("[name='memberPw']").keyup(function(){
				//영문,숫자,특수문자(공백 제외)조합으로 8글자 이상
				const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
				const inputPw = $(this).val();
				if(pwReg.test(inputPw)){
					$(".caution").eq(1).html("<a>사용가능한 비밀번호입니다</a>");
					$(".caution").eq(1).children().css("color","#3a3a3a");
			        $(this).removeClass("error");
			        result[1] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(1).css("display","table-row");
					$(".caution").eq(1).children().css("color","var(--secondary)");
					$(".caution").eq(1).html("<a>영문,숫자,특수문자(공백 제외)조합으로 8글자 이상</a>");
					result[1] = false;
				}
			})//비밀번호 정규표현식
			
			$("#pwRe").keyup(function(){
				const inputPw = $("[name='memberPw']").val();
			    const inputPwRe = $(this).val();
			    
			    if(inputPw==inputPwRe){
			    	$(".caution").eq(2).html("<a>비밀번호가 일치합니다</a>");
			    	$(".caution").eq(2).children().css("color","#3a3a3a");
			        $(this).removeClass("error");
			        result[2] = true;
			        
			    }else{
			    	$(this).addClass("error");
					$(".caution-tr").eq(2).css("display","table-row");
					$(".caution").eq(2).children().css("color","var(--secondary)");
					$(".caution").eq(2).html("<a>비밀번호가 일치하지 않습니다</a>");
					result[2] = false;
			    }
			})//비밀번호 확인 처리

			
			$("[name='memberPhone']").keyup(function(){
				//핸드폰 정규표현식
				const pwReg = /^\d{3}-\d{3,4}-\d{4}$/;
				const pwReg2 = /^0+\d{9,10}$/;
				const inputPw = $(this).val();
				if(pwReg.test(inputPw) || pwReg2.test(inputPw)){
					$(this).removeClass("error");
					$(".caution-tr").eq(3).css("display","none");
					result[3] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(3).css("display","table-row");
					$(".caution").eq(3).children().css("color","var(--secondary)");
					$(".caution").eq(3).html("<a>형식에 맞지 않는 번호입니다</a>");
					result[3] = false;
				}
			})//핸드폰 형식 검사
			

			$("#phoneChk").on("click",function(){
				if(result[3]){
					const result = $("[name='memberPhone']").val().replaceAll("-","");
					$("#phone").val(result);
					$(".cerNumChk").slideDown(200);
				}
			})
			
			
			
			
			
			
			
			
			$("[name='memberEmail']").keyup(function(){
				//이메일 정규표현식
				const pwReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				const inputPw = $(this).val();
				if(pwReg.test(inputPw)){
					$(".caution").eq(5).html("<a>비밀번호 찾기 시 사용되는 이메일입니다.</a>");
					$(".caution").eq(5).children().css("color","#3a3a3a");
			        $(this).removeClass("error");
			        result[4] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(5).css("display","table-row");
					$(".caution").eq(5).children().css("color","var(--secondary)");
					$(".caution").eq(5).html("<a>이메일 양식을 다시 한 번 확인해주세요</a>");
					result[4] = false;
				}
				if(inputPw==""){
					$(".caution-tr").eq(5).css("display","none");
					result[4] = true;
				}
			})//이메일 정규표현식
			
			
			$("#addr").on("click",function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	$("[name='memberAddr']").val(data.address);
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
				if($("[name='memberAddr']").val()==!""){
					alert("gd");
				}
			});
			
			
			
			
			
			
			
			
			$("[name='memberAccount']").on("change",function(){
				const result = $(this).val().replaceAll("-","");
				$(this).val(result);
			});//계좌번호 정규표현식(하는중)
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			const allCheck = document.querySelector("#allcheck")
			const agreeArr = document.querySelectorAll("[name=agree]");
			
			allCheck.addEventListener("change",function(){  
			    agreeArr.forEach(function(agree){
			        agree.checked=true;
			    })
			})//전체약관체크
			agreeArr.forEach(function(agree){
			    agree.addEventListener("click",function(){
			        if(agree.checked==false){
			            allCheck.checked=false;
			        }
			    })
			})//하나라도 선택 풀리면 전체 동의도 풀림
			
			
			
			
			
			
			
			
			
			$("#submit").on("click",function(){
				
				const year = $("#birth-year").val();
				const month = $("#birth-month").val();
				let day;
				if($("#birth-day").val()<10){
					day = "0"+$("#birth-day").val();
				}else{
					day = $("#birth-day").val()
				}
				$("[name='memberBDay']").val(year+month+day); //생일 yyyymmdd형식으로 만들기
				
				
				
				
				
				$("<form>").submit();
				
			})
			
			
			
			
			$( function() {
				$( ".select-custom" ).selectmenu();
			});	
	
			$("#emailChk").on("click",function(){
				$(".emailChk").slideDown(200);
			})
	

			//버튼 누르면 인증번호 창 뜨게
			
			
			
			
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function(e) {
						//이미지를 다 읽어온 이후
						document.getElementById('preview').src = e.target.result;
						$(".fileUpload").hide();
						$(".deletePic").show();
					};
					reader.readAsDataURL(input.files[0]);
				} else {
					document.getElementById('preview').src = "/resources/upload/member/common/moongs.png";
					$(".deletePic").hide();	
					$(".fileUpload").show();
				}
			}
			//파일 이미지

			

	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>