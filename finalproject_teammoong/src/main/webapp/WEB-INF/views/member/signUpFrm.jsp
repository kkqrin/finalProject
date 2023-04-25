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
						<td colspan="3"><input type="password" autoComplete="off" name="memberPw" id="pw" placeholder="비밀번호를 입력해주세요"></td>
					</tr>
					<tr class="caution-tr">
						<td></td>
						<td class="caution" colspan="3"></td>
					</tr>
					<tr>
						<td><label for="pwRe"><span>*</span>비밀번호확인</label></td>
						<td colspan="3"><input type="password" autoComplete="off" id="pwRe" placeholder="비밀번호를 한번 더 입력해주세요"></td>
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
								<label for="agree1">이용약관 동의(필수)</label><a id="terms1" style="cursor: pointer;">약관보기></a>
							</li>
							<li>
								<input type="checkbox" name="memberAgree" id="agree2" value=1 class="agree">
								<label for="agree2">마케팅 활용동의(선택)</label><a id="terms2" style="cursor: pointer;">약관보기></a>
							</li>
						</ul>
					</div>
				</div>
				<div class="area-btn center">
				<input type="submit" value="회원가입" class="btn btn-sec size02" style="width: 156.83px;height: 38px;border:none; cursor: pointer;">
				</div>	
			</form>
		</div><!--signUp-form-->

		<!-- 알림 모달 -->
		<div id="alertModal" class="modal modal-sec">
				<div class="modal-content">
					<div class="modal-header" style="padding: 40px; height: auto;">
						<h6 id="alertTitle" style="text-align: center;"></h6>
					</div>
					<div class="area-btn center">
						<a rel="modal:close" class="btn btn-sec size01" style="cursor: pointer;">확인</a>
					</div>
				</div>
		</div><!--모달창-->

	<jsp:include page="/WEB-INF/views/member/terms1.jsp" />
	<jsp:include page="/WEB-INF/views/member/terms2.jsp" />
	</div><!--content-wrap-->


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<script src="/resources/js/signUp.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>