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
<style>
.form-title p {
    color: #fec123;
    font-size: 18px;
    font-weight: bold;
    font-stretch: normal;
    font-style: normal;
    line-height: normal;
    letter-spacing: normal;
    text-align: left;
    margin-right: 2px;
}

</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<div class="content-wrap">
			<div class="form-title">
				<div>
					<p style="text-align: center;">여기여기붙어라 [ ${sk} ]에 대한 검색 결과</p>
					<c:forEach items="${boardList }" var="i">
						<div class="my-content">
						<ul class="grid"
							style="display: flex; margin-top: 26px; flex-wrap: wrap; justify-content: flex-start;">
							<li class="card"
								style="width: 250px; height: 326px; box-shadow: 0 1px 10px 0 rgb(0 0 0/ 5%); border-radius: 6px; background-color: #fff; margin-right: 1%; margin-bottom: 1%; list-style: none; margin: 30px;">
								<div class="card-thumbnail" style="text-align: center;">
									<a class="thumbnail cen"
										href="/boardView.do?boardNo=${i.boardNo }"
										style="height: 180px; overflow: hidden; border-radius: 5px; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"><img
										src="/resources/upload/board/${i.thumbnail}"
										style="width: 200px; height: 200px;"></a>
								</div>
								<div class="card-info">
									<div class="title"
										style="font-size: 30px; line-height: 25px; padding-top: 25px; padding-bottom: 10px;"><a href="/boardView.do?boardNo=${i.boardNo }">${i.boardName }</a></div>
									<div class="data" style="margin-left: 15px;">
										<img
											src="//d2i2w6ttft7yxi.cloudfront.net/site_img/seller/images/icon/icon_calendar.png">${i.boardDate }</div>
								</div>
							</li>
						</ul>
					</div>
				</c:forEach>
				</div>
			</div>
		</div>	
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>