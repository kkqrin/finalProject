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
	.menu-bar h5{
		width: 50%;
		text-align: center;
		border-bottom: 5px solid #f88000;
		cursor: pointer;
	}
	.menu-bar h5:hover{
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
						<h5 id="coupon-bar">쿠폰</h5>
						<h5 id="point-bar">적립금</h5>
					</div>
					<div class="coupon-view">
						<table>
							<tr>
								<th>발급번호</th>
								<th style="width:50%;">쿠폰이름</th>
								<th>쿠폰수령일</th>
								<th>쿠폰만료일</th>
								<th>상태</th>
							<tr>
							<c:forEach items="${list}" var="ic">
								<tr class="bg-p00">
									<td>${ic.issueNo}</td>
									<td>
										<c:if test="${ic.couponNo == 1}">
											생일 축하 쿠폰
										</c:if>
									</td>
									<td>${ic.issueDate}</td>
									<td>${ic.endDate}</td>
									<td>
										<c:if test="${ic.couponStatus == 1}">
											발급 완료
										</c:if>
										<c:if test="${ic.couponStatus == 2}">
											기간 만료
										</c:if>
										<c:if test="${ic.couponStatus == 0}">
											사용 완료
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="point-view">
						<span>${sessionScope.m.memberName }님의 사용 가능한 총 적립금은</span>
						<span id="total-point"></span><span> P입니다.</span>
						<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
					</div>
				</div>
			</div>
		</div>
		</div>
	</div>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>
	$(document).ready(function(){
    	$("#coupon-bar").click();
    	const memberNo = $('input[name="memberNo"]').val();
    	console.log(memberNo);
    	$.ajax({
    		url: "/pointCheck.do",
    		type: 'get',
    		data:{"memberNo":memberNo},
    		success: function(data){
    			console.log(data);
    			$("#total-point").text(data);
    		}
    	});
	});
	$("#coupon-bar").on("click",function(){
		$(".point-view").hide();
		$("#point-bar").css("color","#99999");
		$("#point-bar").css("border-bottom","none");
		$(".coupon-view").show();
		$("#coupon-bar").css("color","#3A3A3A");
		$("#coupon-bar").css("border-bottom","5px solid #f88000");
	});
	$("#point-bar").on("click",function(){
		$(".coupon-view").hide();
		$("#coupon-bar").css("color","#99999");
		$("#coupon-bar").css("border-bottom","none");
		$(".point-view").show();
		$("#point-bar").css("color","#3A3A3A");
		$("#point-bar").css("border-bottom","5px solid #f88000");
	});
	
	
</script>
</body>
</html>