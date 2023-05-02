<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<div class="mypage-right-title">참가중인 공구</div>
			<div class="mypage-content">
			<div class="table_box" style="margin-top: 10px;">
				<table>
					<colgroup class="pc">
						<col width="10%">
						<col width="30%">
						<col width="30%">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">No</th>
							<th scope="row">상품</th>
							<th scope="row">제목</th>
							<th scope="row">입금날짜</th>
							<th scope="row">입금금액</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${list }" var="b">
						<tr>
							<td>
								<a href="/myPageRequestDeposit.do?joinNo=${b.joinNo }">${b.boardNo }</a>
							</td>
							<td><a href="/myPageRequestDeposit.do?joinNo=${b.joinNo }"><img src="/resources/upload/board/${b.thumbnail }" style="width:100px; height:100px"></a></td>
							<td>
								<a href="/myPageRequestDeposit.do?joinNo=${b.joinNo }">${b.boardName }</a>
							</td>
							<td>${b.payerDate }</td>
							<td><fmt:formatNumber value= "${b.depositPrice }"  pattern="#,###"/>원</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		</div>
	</div>
	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>
