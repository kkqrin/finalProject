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
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="n">
			<tr>
				<td>${n.noticeNo }</td>
				<td>
					<a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a>
				</td>
				<td>${n.noticeWriter }</td>
				<td>${n.readCount }</td>
				<td>${n.noticeDate }</td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="5">${pageNavi }</th>
		</tr>
	</table>
		<a href="/noticeWriteFrm.do">글쓰기</a>
	</div>
</body>
</html>