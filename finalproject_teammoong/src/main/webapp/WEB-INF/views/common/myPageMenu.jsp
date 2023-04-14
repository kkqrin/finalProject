<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/resources/css/member/myPage.css" />
</head>
<body>

	<div class="mypage-title"><h3>마이페이지</h3></div>
			
			<div class="mypage-menu">
				<div class="one-menu">
					<a class="one-menu-title">나의 정보</a>
					<a href="/myPage.do">회원 정보</a>
					<a href="#">구매 내역/후기 작성</a>
					<a href="#">장바구니</a>
					<a href="#">찜한 상품</a>
					<a href="#">쿠폰/적립금</a>
					<a href="/myPageMemberDelete.do">회원 탈퇴</a>
				</div><!--one-menu-->
				<div class="one-menu">
					<a class="one-menu-title">여기여기붙어라</a>
					<a href="#">내가 주최한 공구</a>
					<a href="#">참가중인 공구</a>
				</div><!--one-menu-->
				<div class="one-menu">
					<a class="one-menu-title">쪽지함</a>
					<a href="/myPageDmWriteFrm.do">쪽지 보내기</a>
					<a href="/myPageDmReceive.do">받은 쪽지함(<span>0</span>)</a>
					<a href="/myPageDmSend.do">보낸 쪽지함</a>
				</div><!--one-menu-->
			</div><!--mypage-menu-->
			
</body>
</html>