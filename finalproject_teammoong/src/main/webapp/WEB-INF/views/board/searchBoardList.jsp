<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 style="padding-top : 200px">여기여기붙어라 검색 결과</h1>
	<c:forEach items="${boardList }" var="i">
		${i.boardName }
		${i.boardNo }
	</c:forEach>
</body>
</html>