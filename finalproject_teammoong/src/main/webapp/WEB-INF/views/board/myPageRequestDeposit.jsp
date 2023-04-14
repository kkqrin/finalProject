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
			<div class="mypage-right-title">입금 참여내역</div>
			<div class="mypage-content">
			       <div class="goods">
 			       	<a href="/boardView.do?boardNo=61<%--${b.boardNo}--%>"> 
			       		<span>
			       		<img src="/resources/img/product/orange.jpeg">
<%-- 			       			<c:forEach items="${b.fileList }" var="i"> --%>
<%-- 								<c:if test="${b.boardNo eq i.boardNo && oneFile eq 0}"> --%>
<%-- 									<img src="/resources/upload/board/${i.filepath}"> --%>
<!-- 									<c:set var="oneFile" value="1" /> -->
<!-- 								</c:if> -->
<!-- 							</c:forEach> -->
						</span>
						<span class="auto_confir_title">
							<strong>킨더조이<%-- ${b.boardName}--%></strong> 
						</span>
			       	</a> 
			       </div>
			       <div class="info_goods">
			       	<h3>입금처정보</h3>
			       	<span style="color:#ff0000;">* 설정한 기간 안에 입금을 하지 않으면 주문이 취소될 수 있습니다.</span>
			       	<div class="ul_table" style="margin-bottom:38px;">
			       		<ul>
			       			<li>
			       				<strong>입금금액</strong>
			       				<span>14,000원${bj.depositPrice}</span>
			       			</li>
			       		</ul>
			       </div>
			</div>
		</div>
		
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>