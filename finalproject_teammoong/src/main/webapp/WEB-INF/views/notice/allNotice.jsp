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
 .main-content{
		padding-top: 30px; 
	}
	.search-box {
		padding-top: 20px;
		display: flex;
		align-items: center;
  		justify-content: center;
  	}
	.search-box select {
  		margin-right: 10px;
	}
	.search-box select{
  		height: 40px;
  		font-size: 18px;
  		padding: 0 10px;
  		border-radius: 5px;
  		border: 1px solid #ccc;
	}
	.search-box input[type="text"] {
  		margin-right: 10px;
  		width: 50%;
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
								<td><b>공지</b></td>
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
			<form action="/noticeList.do?reqPage=1" method="post">
				<div class="search-box">
					<select name="searchType">
						<option value="1">제목</option>
						<option value="2">내용</option>
					</select>
					<input type="text" name="keyword" id="searchText">        
                	<button class="btn btn-pri size01" type="submit" name="searchSubmitBtn">검색</button>
				</div>
            </form>
			<div class="">
				<c:if test="${sessionScope.m.memberStatus == 0 }">
					<div class="area-btn right">
						<a href="/noticeWriteFrm.do" class="btn btn-pri size03">글쓰기</a>
					</div>
				</c:if>
			</div>
		</div>
		<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}"> 
	</div>
	
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>