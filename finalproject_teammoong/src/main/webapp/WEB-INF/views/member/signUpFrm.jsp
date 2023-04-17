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
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"><a>한글 2-10자(공백없이)</a></td>
					</tr>
					<tr>
						<td><label for="phone"><span>*</span>휴대폰</label></td>
						<td colspan="3"><input type="text" name="memberPhone" id="phone" placeholder="숫자만 입력해주세요"></td>
						<td><button type="button" id="phoneChk" class="btn btn-sec size02">인증번호 발송</button></td>	
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr class="cerNumChk" style="display: none;">
						<td></td>
						<td colspan="3"><input type="text" id="cerNum" placeholder="인증번호를 입력해주세요"></td>
						<td><button type="button" id="cerNumChk" class="btn btn-ter size02">인증번호 확인</button></td>	
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td class="addr"><label for="addr"><span>*</span>주소</label><input type="hidden" name="memberAddr"></td>
						<td colspan="3"><input type="text" name="memberZoneCode"  placeholder="우편번호 조회 버튼을 눌러주세요" readonly required></td>
						<td><button type="button" id="addr" class="btn btn-sec size02">우편번호 조회</button></td>	
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" name="address"  placeholder="기본배송지로 등록됩니다" readonly required></td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" name="detailAddr" placeholder="상세주소를 입력해주세요" required></td>
					</tr>
					<tr>
						<td><span style="color: red; font-size: 20px;">*</span>성별</td>
						<td>
							<input type="radio" name="memberGender" id="m" value=1>
							<label for="m">남자</label>
						</td>
						<td id="no">
							<input type="radio" name="memberGender" id="f" value=2>
							<label for="f">여자</label>
						</td>
						<td>
							<input type="radio" name="memberGender" id="n" value=3>
							<label for="n">선택안함</label>
						</td>
					</tr>
					<tr class="caution-tr gender">
						<td></td>
						<td class="caution" colspan="3"><a>더 나은 상품 제공을 위한 통계 용도로만 사용됩니다</a></td>
					</tr>
					<tr>
						<td><label for="account">계좌번호</label></td>
						<td colspan="3">
							<select class="select-custom" name="memberBank">
								<option value="null" selected disabled hidden>은행을 선택하세요</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td colspan="3"><input type="text" name="memberAccount" placeholder="계좌번호를 입력하세요('-'없이)" id="account"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td><label for="email">이메일</label></td>
						<td colspan="3"><input type="text" name="memberEmail" id="email" placeholder="예시) moongsan@google.com"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td><label for="name">생년월일</label></td>
						<td colspan="3"><input type="text" id="datepick" name="memberBday" placeholder="생일을 입력해주세요"></td>
					</tr>
					<tr class="caution-tr gender">
						<td></td>
						<td class="caution" colspan="3"><a>생일 쿠폰이 발급됩니다! (최초 등록 후 수정 불가)</a></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td>프로필사진</td>
						<td class="proPic-zone" colspan="3" id="no">
							<div class="proPic-left">
								<div class="proPic">
									<img id="preview" src="/resources/upload/member/moongs.png">
								</div>
							</div>
							<div class="proPic-right">
								<label class="fileUpload" for="fileUpload">
									프로필 사진 업로드
								</label>
								<label class="deletePic" onclick="readURL(0);" style="display: none;">
									사진 삭제하기
								</label>
								<input type="file" name="memberPropic" id="fileUpload" accept=".gif, .jpg, .jpeg, .png" onchange="readURL(this);" style="display: none;">
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
								<input type="checkbox" id="agree1" class="agree">
								<label for="agree1">이용약관 동의(필수)</label><a>약관보기></a>
							</li>
							<li>
								<input type="checkbox" name="memberAgree" id="agree2" value=1 class="agree">
								<label for="agree2">마케팅 활용동의(선택)</label><a>약관보기></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="area-btn center">
				<input type="submit" value="회원가입" class="btn btn-sec size02" style="width: 156.83px;height: 38px;border:none; cursor: pointer;">
				</div>	
			</form>
		</div><!--signUp-form-->





	</div><!--content-wrap-->


<!-- <tr> -->
<!-- 	<td><label for="email"><span>*</span>이메일</label></td> -->
<!-- 	<td colspan="3"><input type="text" name="memberEmail" id="email" placeholder="예시) moongsan@google.com"></td> -->
<!-- 	<td><button type="button" id="emailCerSend" class="btn btn-sec size02">이메일 인증</button></td>	 -->
<!-- </tr> -->
<!-- <tr class="caution-tr"> -->
<!-- 	<td></td> -->
<!-- 	<td class="caution" colspan="3"></td> -->
<!-- </tr> -->
<!-- <tr class="emailChk" style="display: none;"> -->
<!-- 	<td></td> -->
<!-- 	<td colspan="3"><input type="text" id="cerNum" placeholder="인증번호를 입력해주세요"></td> -->
<!-- 	<td><button type="button" id="emailChk" class="btn btn-ter size02">인증번호 확인</button></td>	 -->
<!-- </tr> -->
<!-- <tr class="caution-tr"> -->
<!-- 	<td></td> -->
<!-- 	<td class="caution" colspan="3"></td> -->
<!-- </tr> -->



	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>





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
			
		
			
			let result = [false, false, false, false, false, true, false ,true, true]; //정규표현식 검사
						//0아이디, 1비밀번호, 2비밀번호 확인, 3이름확인, 4휴대폰형식, 5휴대폰인증코드, 6주소확인, 7계좌번호형식, 8이메일형식
			
			
			
			$("[name='memberId']").keyup(function(){
				//영문 혹은 영문+숫자, 8자 이상 16자 이하
				const idReg = /^[a-z0-9]{8,16}$/;
				const inputId = $(this).val();
				if(idReg.test(inputId)){
					$(this).removeClass("error");
					$(".caution-tr").eq(0).css("display","none");
					$(".caution").eq(0).children().css("color","#3a3a3a");
			        result[0] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(0).css("display","table-row");
					$(".caution").eq(0).children().css("color","var(--secondary)");
					$(".caution").eq(0).html("<a>영문 혹은 영문+숫자, 6자 이상 16자 이하</a>");
					result[0] = false;
				}
				if(inputId==""){
					$(this).removeClass("error");
					$(".caution-tr").eq(0).css("display","none");
			    	result[0] = false;
				}
			})//아이디 정규표현식

			$("[name='memberId']").on("change",function(){
				const inputId = $(this).val();
				$.ajax({
					url: "/idDoubleCheck.do",
					type: "get",
					data: {memberId : inputId},
					success : function(result){
						if(result=="dup"){
							$(this).addClass("error");
							$(".caution-tr").eq(0).css("display","table-row");
							$(".caution").eq(0).children().css("color","var(--secondary)");
							$(".caution").eq(0).html("<a>중복된 아이디입니다.</a>");
							result[0] = false;
						}else{
							$(this).removeClass("error");
							$(".caution-tr").eq(0).css("display","table-row");
							$(".caution").eq(0).html("<a>사용 가능한 아이디 입니다.</a>");
							$(".caution").eq(0).children().css("color","var(--secondary)");
					        result[0] = true;
						}
					}//ajax success구문
				})//ajax
			})
			
			
			
			
			
			
			
			$("[name='memberPw']").keyup(function(){
				//영문,숫자,특수문자(공백 제외)조합으로 8글자 이상
				const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[~+@$!%*#?&])[A-Za-z\d~+@$!%*#?&]{8,}$/;
				const inputPw = $(this).val();
				if(pwReg.test(inputPw)){
					$(this).removeClass("error");
					$(".caution").eq(1).html("<a>사용가능한 비밀번호입니다</a>");
					$(".caution").eq(1).children().css("color","#3a3a3a");
			       
			        result[1] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(1).css("display","table-row");
					$(".caution").eq(1).children().css("color","var(--secondary)");
					$(".caution").eq(1).html("<a>영문,숫자,특수문자(공백 제외)조합으로 8글자 이상</a>");
					result[1] = false;
				}
				if(inputPw==""){
					$(this).removeClass("error");
					$(".caution-tr").eq(1).css("display","none");
			    	result[1] = false;
				}
			})//비밀번호 정규표현식
			
			$("#pwRe").keyup(function(){
				const inputPw = $("[name='memberPw']").val();
			    const inputPwRe = $(this).val();
			    
			    if(inputPw!=inputPwRe){
			    	$(this).addClass("error");
					$(".caution-tr").eq(2).css("display","table-row");
					$(".caution").eq(2).children().css("color","var(--secondary)");
					$(".caution").eq(2).html("<a>비밀번호가 일치하지 않습니다</a>");
					result[2] = false;
			    }else{
			    	$(this).removeClass("error");
			    	$(".caution").eq(2).html("<a>비밀번호가 일치합니다</a>");
			    	$(".caution").eq(2).children().css("color","#3a3a3a");
			        result[2] = true;
			    }
			    if(inputPwRe==""){
			    	$(this).removeClass("error");
			    	$(".caution-tr").eq(2).css("display","none");
			    	result[2] = false;
			    }
			})//비밀번호 확인 처리

			
			$("[name='memberName']").keyup(function(){
				const nameReg = /^[ㄱ-ㅎ가-힣]{2,10}$/;
				const inputName = $(this).val();
				
				if(nameReg.test(inputName)){
					$(this).removeClass("error");
					$(".caution-tr").eq(3).css("display","none");
					result[3] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(3).css("display","table-row");
					result[3] = false;
				}
				if(inputName==""){
					$(this).removeClass("error");
					$(".caution-tr").eq(3).css("display","none");
			    	result[3] = false;
				}
				
			});//이름 정규표현식
			
			
			$("[name='memberPhone']").keyup(function(){
				//핸드폰 정규표현식
				const pwReg = /^\d{3}-\d{3,4}-\d{4}$/;
				const pwReg2 = /^0+\d{9,10}$/;
				const inputPhone = $(this).val();

				if(pwReg.test(inputPhone) || pwReg2.test(inputPhone) || inputPhone==""){
					$(this).removeClass("error");
					$(".caution-tr").eq(4).css("display","none");
					result[4] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(4).css("display","table-row");
					$(".caution").eq(4).children().css("color","var(--secondary)");
					$(".caution").eq(4).html("<a>형식에 맞지 않는 번호입니다</a>");
					result[4] = false;
				}
			})//핸드폰 형식 검사
			
			
			let cerCode=""; //★핸드폰 인증코드!!!
			$("#phoneChk").on("click",function(){
				let replace;
				if(result[4]){
					replace = $("[name='memberPhone']").val().replaceAll("-","");
					$("[name='memberPhone']").val(replace);
					$(".cerNumChk").slideDown(200);
					$(".caution-tr").eq(4).css("display","table-row");
					$(".caution").eq(4).html("<a>발송된 인증번호를 확인해주세요.</a>");
				}
				
				$.ajax({
					url: "/memberPhoneCheck.do",
					type: "post",
					data: {memberPhone : replace},
					success : function(code){
						cerCode = code;
					}//ajax success구문
				})//ajax
			})//폰에서 하이픈 빼는거 + 문자메시지 보내기 + 코드 받기
			
			$("#cerNumChk").on("click",function(){
				let inputCode = $("#cerNum").val();
				
				if(inputCode==""){
					alert("인증번호를 입력해주세요");
				}else{
					if(cerCode == inputCode){
						$(this).addClass("error");
						$(".caution-tr").eq(5).css("display","table-row");
						$(".caution").eq(5).html("<a>인증번호가 일치합니다.</a>");
						$(".caution").eq(5).children().css("color","#1877f2");
						
						$("[name='memberPhone']").attr("readonly",true);
						$("#cerNum").attr("readonly",true);
						
						$("#cerNumChk").removeClass("btn-sec");
						$("#cerNumChk").addClass("btn-ter");
						$("#cerNumChk").remove;
						$("#cerNumChk").text("인증완료");
						$("#cerNumChk").css("cursor","default");
						$("#cerNumChk").attr("disabled",true);
						
						$("#phoneChk").css("display","none");
						
						result[5]=true;
					}else{
						$(this).addClass("error");
						$(".caution-tr").eq(5).css("display","table-row");
						$(".caution").eq(5).children().css("color","red");
						$(".caution").eq(5).html("<a>인증번호가 다릅니다</a>");
						result[5] = false;
						
						$(".caution-tr").eq(4).css("display","none");
						
						$("[name='memberPhone']").attr("readonly",false);
						$("#cerNum").attr("readonly",false);
						
						$("#phoneChk").removeClass("btn-sec");
						$("#phoneChk").addClass("btn-dkgray");
						$("#phoneChk").remove;
						$("#phoneChk").text("인증번호 재전송");
					}
				}//if. inputCode가 null인지 검사
			})//인증번호 검사
			
			
			$("#addr").on("click",function(){
				new daum.Postcode({
			        oncomplete: function(data) {
			        	$("[name='memberZoneCode']").val(data.zonecode);
			        	const addr = String(data.address);
			        	$("[name='address']").val(addr);
			            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
			            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
			        }
			    }).open();
			});//다음 지도 API
			
			
			$("[name='detailAddr']").keyup(function(){
				let address = $("[name='address']").val();
				let detailAddr = $(this).val();
				if(address!="" && detailAddr!=""){
					address += " "+detailAddr;
					$("[name='memberAddr']").val(address); //합친 주소 값넣기
					result[6]=true;
				}else{
					result[6]=false;
				}
			});//주소 입력 확인
			

			
			$("[name='memberAccount']").keyup(function(){
				const inputAccount = $("[name='memberAccount']").val();
				const AcountReg = /^[0-9]+$/;
				
				const inputAccount2 = $(this).val().replaceAll("-","");
				$(this).val(inputAccount2);
				
				if(AcountReg.test(inputAccount)){
			        $(this).removeClass("error");
			        $(".caution-tr").eq(7).css("display","none");
			        result[7] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(7).css("display","table-row");
					$(".caution").eq(7).children().css("color","var(--secondary)");
					$(".caution").eq(7).html("<a>숫자를 입력해주세요</a>");
					result[7] = false;
				}
				if(inputAccount==""){
					$(this).removeClass("error");
					$(".caution-tr").eq(7).css("display","none");
					result[7] = true;
				}
			});//계좌번호 정규표현식
			
			
			$("[name='memberEmail']").keyup(function(){
				//이메일 정규표현식
				const emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				const inputEmail = $(this).val();
				if(emailReg.test(inputEmail) || inputEmail==""){
					$(this).removeClass("error");
					$(".caution-tr").eq(8).css("display","none");
					result[8] = true;
				}else{
					$(this).addClass("error");
					$(".caution-tr").eq(8).css("display","table-row");
					$(".caution").eq(8).children().css("color","var(--secondary)");
					$(".caution").eq(8).html("<a>이메일 양식을 다시 한 번 확인해주세요</a>");
					result[8] = false;
				}
			})//이메일 정규표현식
			
			
// 			$("#emailCerSend").on("click",function(){
// 				if(result[3]){
// 					$(".caution").eq(3).html("<a>이메일로 인증번호를 전송했습니다.</a>");
// 					$(".emailChk").css("display","table-row");
// 				}
// 			})//이메일 인증번호 보내기
			
			

			
			const allCheck = document.querySelector("#allcheck")
			const agreeArr = document.querySelectorAll(".agree");
			
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
			
			
			
			$("[type='submit']").on("click",function(){
				
				if($("[name='memberGender']:checked").length==0){
				   $("[name='memberGender']").eq(2).prop('checked',true);
				}; //성별입력확인받고 입력 안했으면 3으로 값

				if($("[name='memberAgree']").prop('checked')==false){
					$("[name='memberAgree']").val(0);
				}else{
					$("[name='memberAgree']").val(1);
				}//만약 마케팅 동의 체크를 안해도 값으로 undefined가 넘어가지 않게
				
				let resultChk = true;
				$.each(result,function(index,item){
					if(!item){
						resultChk = false;
					}
				});//모든 정규표현식을 통과해야 함
				
				let agree1 = $("#agree1").prop('checked');
				if(!resultChk){
					alert("누락된 항목이 없는지 다시 한 번 확인해주세요");
					event.preventDefault();
				}else if(!agree1){
					alert("필수 이용약관에 동의해주세요");
					event.preventDefault();
				}//필수 이용약관에 체크해야 함
	
			});

/*==================================================================================*/			
			
			$( function() {
				$( ".select-custom" ).selectmenu();
			});	
	

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
					document.getElementsByName('memberPath')[0].value=null;
					$(".deletePic").hide();	
					$(".fileUpload").show();
				}
			}
			//파일 이미지

			
/*=========데이트픽커========================================================*/			
			
			$( function() {
			    $( "#datepick" ).datepicker({
			    	  changeMonth: true, // 월을 바꿀수 있는 셀렉트 박스를 표시한다.
			    	  changeYear: true, // 년을 바꿀 수 있는 셀렉트 박스를 표시한다.
			    	  minDate: '-90y', // 현재날짜로부터 100년이전까지 년을 표시한다.
			    	  yearRange: 'c-90:c', // 년도 선택 셀렉트박스를 현재 년도에서 이전, 이후로 얼마의 범위를 표시할것인가.
			    	  dateFormat: "yymmdd", // 텍스트 필드에 입력되는 날짜 형식.
			    	  showAnim: "slideDown", //애니메이션을 적용한다.
			    	  showMonthAfterYear: true , // 월, 년순의 셀렉트 박스를 년,월 순으로 바꿔준다. 
			    	  dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], // 요일의 한글 형식.
			    	  monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 월의 한글 형식.
			    });
			} );
			
	</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>