<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
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
				<th>제목</th>
				<td>${n.noticeTitle }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${sessionScope.m.memberId }</td>
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
							<a href="/noticeFileDown.do">${f.fileName}</a>
						</p>
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td colspan="2">${n.noticeContent }</td>
			</tr>
		</table>
		<a href="/noticeList.do?reqPage=1">목록</a>
	</div>
</body>
</html>