<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.inner{
max-width: 1240px;
margin: auto;
}
.cover_img{
width: 1280px;
height: 120px;
background-color: #f2f2f2;
opacity: 0.6;
background-position: center;
background-size: 100% 100%;
margin: auto;
border-radius: 20px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="content-wrap">
	<div class="content-board-wrap">
		<div class="cover_img">
			<div class="inner">
			
			</div>
		</div>
		<div class="inner">
			<div class="top" style="position: relative; display: flext; justify-content: flex-end; padding: 22px 0 14px;">
				<div class="img_con cen" style="width: 130px; height: 130px; background-color: #fff; border-radius: 100%; position: absolute; left: 0; bottom: 0; padding: 10px;">
					<img src="/resources/upload/member/${m.memberPath }" style="width: 100%; height: 100%; border-radius: 50%;">
				</div>
				<div>
					<div class="btn-con">
						<button type="button" class="btn btn-border-ter size02" style=" margin-left:1100px; border-color: var(--secondary); color: var(--secondary); background-color: #fff; width: 134px; height: 48px; border-radius: 38px;" onclick="location.href='/dmReply.do?receiver=${m.memberId }'">쪽지</button>
					</div>
				</div>
			</div>
			<div class="bottom">
				<div class="memberId" style="position: relative; display: flex; align-items: center; margin: 2px 0 10px;">
					<span style="margin-left: 10px; font-size: 18px; font-weight: bold; text-align: left; color: #272727;">${m.memberId }</span>
				</div>
			</div>	
		</div>
			<div class= "sum" style="display: flex;">
				<c:forEach items="${list }" var="b">
					<div class="my-content">
						<ul class="grid"
							style="display: flex; margin-top: 26px; flex-wrap: wrap; justify-content: flex-start;">
							<li class="card"
								style="width: 250px; height: 326px; box-shadow: 0 1px 10px 0 rgb(0 0 0/ 5%); border-radius: 6px; background-color: #fff; margin-right: 1%; margin-bottom: 1%; list-style: none; margin: 30px;">
								<div class="card-thumbnail" style="text-align: center;">
									<a class="thumbnail cen"
										href="/boardView.do?boardNo=${b.boardNo }"
										style="height: 180px; overflow: hidden; border-radius: 5px; border-bottom-left-radius: 0; border-bottom-right-radius: 0;"><img
										src="/resources/upload/board/${b.thumbnail}"
										style="width: 200px; height: 200px;"></a>
								</div>
								<div class="card-info">
									<div class="title" style="font-size: 40px;">${b.boardName }</div>
									<div class="data" style="margin-left: 15px;">
										<img
											src="//d2i2w6ttft7yxi.cloudfront.net/site_img/seller/images/icon/icon_calendar.png">${b.boardDate }</div>
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