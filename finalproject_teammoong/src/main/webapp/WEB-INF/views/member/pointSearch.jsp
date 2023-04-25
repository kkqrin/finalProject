<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menu-bar{
		display:flex;
		
	}
	.menu-bar div{
		width: 50%;
		text-align: center;
		
		cursor: pointer;
	}
	.menu-bar div:hover{
		background-color: rgba(255, 255, 200, 0.5);
		font-size: 1.5em;
	}
	.point-view{
		line-height: 70px;
		text-align:center;
		font-size: 30px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
			<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
			<div class="mypage-right">
				<div class="mypage-right-title">쿠폰/적립금</div>
				<div class="mypage-content">
					<div class="main">
						<div class="menu-bar">
							<div id="coupon-bar">
								<h5>쿠폰</h5>
							</div>
							<div id="point-bar">
								<h5>적립금</h5>
							</div>
						</div>
						<div class="point-view">
							${sessionScope.m.memberName}님의 총 적립금은 <span id="totalPoint"></span> Moong 입니다.
						</div>
							<table>
								<tr>
									<th>포인트번호</th>
									<th style="width:40%;">포인트</th>
									<th>포인트 적립 / 사용일</th>
									<th>상태</th>
								</tr>
									<c:forEach items="${pointList}" var="point">
										<tr class="bg-p00">
											<td>${point.pointNo}</td>
											<td>
												<b>
												<c:choose>
													<c:when test="${point.pointStatus == 3}">
														- ${point.pointEa}
													</c:when>
													<c:when test="${point.pointStatus == 6}">
														- ${point.pointEa}
													</c:when>
													<c:otherwise>
														${point.pointEa}
													</c:otherwise>
												</c:choose>
												</b>
											</td>
											<td>${point.pointDate}</td>
											<td>
												<c:if test="${point.pointStatus == 0}">
													출석체크
												</c:if>
												<c:if test="${point.pointStatus == 1}">
													가입축하 뭉머니
												</c:if>
												<c:if test="${point.pointStatus == 2}">
													뭉머니 적립
												</c:if>
												<c:if test="${point.pointStatus == 3}">
													뭉머니 사용
												</c:if>
												<c:if test="${point.pointStatus == 4}">
													뭉머니 충전
												</c:if>
												<c:if test="${point.pointStatus == 5}">
													뭉머니 환불
												</c:if>
												<c:if test="${point.pointStatus == 6}">
													공동구매 결제
												</c:if>
											</td>
										</tr>
									</c:forEach>
							</table>
							<div class="pagination">
								${pageNavi }
							</div>
							<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
						</div>
					</div>
				</div>
			</div>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	$(document).ready(function(){
		const memberNo = $("[name=memberNo]").val();
		$.ajax({
			url:'/pointCheck.do',
			type: 'get',
			data:{memberNo:memberNo},
			success: function(data){
				console.log(data);
				$("#totalPoint").text(data);
			}
		});
	});
	$("#coupon-bar").on("click",function(){
		const memberNo = $("[name=memberNo]").val();
		$(".point-view").hide();
		$("#point-bar").css("color","#99999");
		$("#point-bar").css("border-bottom","none");
		$(".coupon-view").show();
		$("#coupon-bar").css("color","#3A3A3A");
		$("#coupon-bar").css("border-bottom","5px solid #f88000");
		location.href="/couponSearch.do?reqPage=1&memberNo="+memberNo;
	});
	
	$("#point-bar").on("click",function(){
		const memberNo = $("[name=memberNo]").val();
		$(".coupon-view").hide();
		$("#coupon-bar").css("color","#99999");
		$("#coupon-bar").css("border-bottom","none");
		$(".point-view").show();
		$("#point-bar").css("color","#3A3A3A");
		$("#point-bar").css("border-bottom","5px solid #f88000");
		location.href="/pointSearch.do?reqPage=1&memberNo="+memberNo;
	});
	$("#point-bar").css("color","#3A3A3A");
	$("#point-bar").css("border-bottom","5px solid #f88000");
</script>
</body>
</html>