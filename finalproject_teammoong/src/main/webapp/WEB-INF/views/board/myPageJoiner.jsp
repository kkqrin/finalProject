<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="mypage-right-title" style="display: flex; justify-content: space-between;">
				작성한 게시글 제목
				<button class="btn btn-sec size01">게시물 보기</button>
			</div>
			<div class="mypage-content">
				<div style="border-bottom: 3px solid #3a3a3a; padding-bottom: 5px;">
					<input type="checkbox" id="allCheck" style="margin: 0;"><label for="allCheck">전체선택</label>
					<a href="#" style="font-weight: bold; padding: 0 3px; border: 1px solid #3a3a3a; border-radius: 5px;">쪽지보내기</a>
				</div>
			
			
			
			
				<table class="tbl-box" style="margin-top: 10px;">
					<tr>
						<th rowspan="3" style="width: 5%;"><input type="checkbox"></th>
						<th rowspan="3" style="width: 5%;">1</th>
						<th style="width: 20%;">주문자 정보</th>
						<td style="text-align: left;">
							<p>주문한 사람 : 김채원 (010-0101-0101)</p>
							<p>입금예정일 : 2020-01-01</p>	
							<p>환불계좌정보 : 1002648251021 우리은행 김홍미</p>
							<p>추가연락처 : sadfasfas@naver.com</p>			
						</td>
					</tr>
					<tr>
						<th>배송지 정보</th>
						<td style="text-align: left;">
							<p>배송주소 : (05132)인천어쩌구 어디시 어디시 상세주소 어디어디 어디어디</p>
							<p>수령인 : 홍윤채(010-6213-4321)</p>
						</td>
					</tr>	
					<tr>
						<th>주문 상품 정보</th>
						<td style="text-align: left;">
							<p>총 주문금액 : <strong>314,215</strong>원</p>
							<p>[주문 상세 정보]</p>
							<p>어떤 옵션 / 1개</p>
							<p>어떤 옵션 / 3개</p>		
						</td>
					</tr>
				</table>
				
				
			</div>
		
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>