<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸 쪽지함</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">보낸 쪽지함</div>
			<div class="mypage-content">
				<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
				<table>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 55%;">쪽지</th>
						<th>받은사람</th>
						<th>보낸날짜</th>
					</tr>
					<c:forEach items="${list }" var="dm">
						<tr>
							<td>${dm.rnum }</td>
							<td onclick="dmView(${dm.dmNo})">
								<div style="width: 478px; height: 20px; overflow: hidden;cursor: pointer;white-space: nowrap;text-overflow: ellipsis;">
									${dm.dmContent }
								</div>
							</td>
							<td>${dm.dmReceiverName }</td>
							<td>${dm.dmDate }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="pagination">
					${pageNavi }
				</div>
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div>
		
		
		
			<!-- 쪽지상세보기 모달 -->
		<div id="dmViewer" class="modal modal-sec">
				<div class="modal-content">
					<div class="modal-header" style="height: auto;">
						<h6 id="viewReceiver"></h6>
						<a id="viewDate"></a>
					</div>
					<div class="modal-body" style="display: flex; flex-direction: column;">
						<div id="viewContent"></div>
					</div>
					<div class="area-btn right" style="padding-bottom: 0;">
						<a rel="modal:close" class="btn btn-sec size01" style="cursor: pointer;">닫기</a>
					</div>
				</div>
		</div><!--모달창-->
		
		
	</div>
	
	<script src="/resources/js/myPageDm.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>