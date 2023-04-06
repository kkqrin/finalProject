<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.6.0.js"></script>
<style>
  .content-all{
  	padding-top: 30px; 
  }
  .main-content{
  	padding-top: 30px; 
  }
</style>
</head>
<body>
	<div class="content-wrap">
		<div class="content-all">
			<h3>공지사항</h3>
			<p class="bold">뭉쳐야산다의 새로운 소식들과 정보를 한곳에서 확인하세요</p>
			<div class="main-content">
				<table class="tbl-box">
					<tr>
						<th style="width: 30%;">제목</th>
						<td>${n.noticeTitle }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${n.noticeWriter}</td>
					</tr>
					<tr>
						<th>작성일</th>
						<td>${n.noticeDate }</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<c:forEach items="${n.fileList}" var="f">
								<p>
									<a href="/noticeFileDown.do?fileNo=${f.fileNo }">${f.fileName}</a>
								</p>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<td colspan="2">${n.noticeContent }</td>
					</tr>
					<c:if test="${not empty sessionScope.m && sessionScope.m.memberId eq n.noticeWriter }">
						<tr>
							<th colspan="2">
								<div class="area-btn center">
									<a href="/noticeUpdateFrm.do?noticeNo=${n.noticeNo }" class="btn btn-sec size02"">수정</a>
									<a href="/noticeDelete.do?noticeNo=${n.noticeNo }" class="btn btn-black size02">삭제</a>
								</div>
							</th>
						</tr>
					</c:if>
				</table>
				<div class="area-btn right" style="padding-top:10px;">
					<a href="/noticeList.do?reqPage=1" class="btn btn-pri size02">목록</a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>