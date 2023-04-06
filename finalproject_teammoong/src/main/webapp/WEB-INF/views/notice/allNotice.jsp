<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<table class="guide-board">
					<tr>
						<th>글번호</th>
						<th class="th-width-explain">제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<c:forEach items="${list }" var="n">
						<tr class="bg-p03">
							<c:if test="${n.noticeStatus == 1 }">
								<td><b>${n.noticeNo }</b></td>
								<td>
									<b><a href="/noticeView.do?noticeNo=${n.noticeNo}">${n.noticeTitle}</a></b>
								</td>
								<td><b>${n.noticeWriter }</b></td>
								<td><b>${n.readCount }</b></td>
								<td><b>${n.noticeDate }</b></td>
							</c:if>
						</tr>
						<tr>
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
			</div>
			<div class="pagination">
			${pageNavi }
			</div>
			<div class="">
				<c:if test="${sessionScope.m.memberStatus == 0 }">
					<div class="area-btn right">
						<a href="/noticeWriteFrm.do" class="btn btn-pri size03">글쓰기</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>