<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content-wrap">
	<table class="guide-board">
		<tr>
			<th class="">글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="n">
			<tr>
			<c:if test="${n.noticeStatus == 1 }">
				<td><b>${n.noticeNo }</b></td>
				<td>
					<b><a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></b>
				</td>
				<td><b>${n.noticeWriter }</b></td>
				<td><b>${n.readCount }</b></td>
				<td><b>${n.noticeDate }</b></td>
			</c:if>
			<c:if test="${n.noticeStatus == 0 }">
				<td>${n.noticeNo }</td>
				<td>
					<a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
				</td>
				<td>${n.noticeWriter }</td>
				<td>${n.readCount }</td>
				<td>${n.noticeDate }</td>
			</c:if>
			</tr>
		</c:forEach>
	</table>
	<div class="pagination">${pageNavi }</div>
		<c:if test="${sessionScope.m.memberStatus == 0 }">
			<a href="/noticeWriteFrm.do">글쓰기</a>
		</c:if>
	</div>
</body>
</html>