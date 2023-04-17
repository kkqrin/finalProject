<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
.content-wrap .mypage-content {
    margin-top: 30px;
    padding-bottom: 130px;
}
.content-wrap .mypage-content .goods {
    padding: 12px 0;
    border-top: 1px solid #e3e3e3;
    border-bottom: 1px solid #e3e3e3;
}
.content-wrap .mypage-content .goods strong {
    display: inline-block;
    vertical-align: middle;
    font-size: 14px;
    line-height: 22px;
    color: #fecd26;
    margin-left: 10px;
    font-weight: 700;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 40%;
}
img, figure {
    margin: 0;
    padding: 0;
    max-width: 10%;
    height: auto;
    line-height: 0;
}
.content-wrap .mypage-content .info_goods h3 {
    font-size: 18px;
    line-height: 22px;
    color: #000;
    font-weight: 700;
}
.content-wrap .mypage-content .info_goods .ul_table {
    border-top: 2px solid #303334;

    margin-top: 8px;
    padding: 8px 0;
}
.content-wrap .mypage-content .info_goods .ul_table li strong {
    float: left;
    width: 50%;
    font-size: 14px;
    line-height: 35px;
    color: #404040;
}
.content-wrap .mypage-content .info_goods .ul_table li span {
    float: right;
    width: 50%;
    font-size: 14px;
    line-height: 35px;
    color: #404040;
    text-align: right;
}
.content-wrap .mypage-content .info_goods h3 {
    font-size: 18px;
    line-height: 22px;
    color: #000;
    font-weight: 700;
}
.form-control {
    padding: 11px 8px;
    border-radius: 2px;
    border: solid 1px #ced4da;
    background-color: #ffffff;
    font-size: 12px;
    font-weight: 300;
    font-stretch: normal;
    font-style: normal;
    line-height: normal;
    letter-spacing: normal;
    color: #5
}

.content-wrap .mypage-content .info_goods .ul_table li span.bold {
    font-weight: 900;
    color: #fecd26;
}

</style>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">	
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">입금 참여내역</div>
			<div class="mypage-content">
			       <div class="goods">
 			       	<a href="/boardView.do?boardNo=61"> 
			       		<span>
			       		<img src="/resources/img/product/orange.jpeg">
						</span>
						<span class="auto_confir_title">
							<strong>킨더조이</strong> 
						</span>
			       	</a> 
			       </div>
			       <div class="info_goods">
			       	<h3>입금처정보</h3>
			       	<span style="color:#ff0000;">* 설정한 기간 안에 입금을 하지 않으면 주문이 취소될 수 있습니다.</span>
			       	<div class="ul_table" style="margin-bottom:38px;">
			       		<ul>
			       			<li>
			       				<strong>입금금액</strong>
			       				<span>14,000원</span>
			       			</li>
			       			<li>
			       				<strong>입금은행</strong>
			       				<span>KB국민은행</span>
			       			</li>
			       			<li>
			       				<strong>입금계좌</strong>
			       				<span><a id="account-link" href="javascript:copy_account();" style="text-decoration:underline;">02060104144718</a></span>
			       			</li>
			       			<li>
			       				<strong>입금주</strong>
			       				<span>박*슬</span>
			       			</li>
						</ul>
			       </div>
			       <h3>기본정보</h3>
			       <div class="ul_table">
			       	<ul>
			       		<li>
			       			<strong>주문자명</strong>
			       			<span>이화정</span>
			       		</li>
			       		<li>
			       			<strong>주문자 연락처</strong>
			       			<span>01094702219</span>
			       		</li>
			       		<li>
			       			<strong>이메일</strong>
			       			<span>hwajung135@naver.com</span>
			       		</li>
			       	</ul>
			       </div>
				</div>
			<div class="info_goods">
				<h3>환불정보</h3>
					<div class="ul_table">
						<ul>
							<li>
								<strong>환불은행</strong>
								<span>
									<input class="form-control" type="text" id="refundBank" name="refundBank" value="우리은행" placeholder="환불은행">
								</span>
							</li>
							<li>
								<strong>환불계좌</strong>
								<span>
									<input class="form-control" type="text" id="refundAccount" name="refundAccount" value="1002848010968" placeholder="환불계좌">
								</span>
							</li>
							<li>
								<strong>환불예금주</strong>
								<span>
									<input class="form-control" type="text" id="refundName" name="refundName" value="이화정" placeholder="환불예금주">
								</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="info_goods">
					<h3>주문정보</h3>
					<div class="ul_table">
						<ul>
							<li>
								<strong>킨더(12,000원 / 1개)</strong>
								<span class="bold">1개</span>
							</li>
						</ul>
						<ul>
							<li>
								<strong>상품가격</strong>
								<span>12,000원</span>
							</li>
							<li>
								<strong>배송비</strong>
								<span>3,000원</span>
							</li>
							<li>
								<strong>총 주문금액</strong>
								<span class="bold">14,000원</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="info_goods">
					<h3>입금정보</h3>
					<div class="ul_table">
						<ul>
							<li>
								<strong>입금자명</strong>
								<span>이화정</span>
							</li>
							<li>
								<strong>입금액</strong>
								<span>14,000원</span>
							</li>
							<li>
								<strong>입금일</strong>
								<span>2023-04-13</span>
							</li>
						</ul>
					</div>
				</div>
				<div class="info_goods plus_text">
					<div class="tit_box">
						<h3>배송정보</h3>
						<div class="ul_table type02">
							<ul>
								<li>
									<strong>수령인</strong>
									<span class="delivery_1" style="display: block;">이화정</span>
								</li>
							</ul>
							<ul>
								<li>
									<strong>연락처</strong>
									<span class="delivery_1" style="display: block;">01094702229</span>
								</li>
								<li>
									<strong>배송지</strong>
									<span class="line delivery_1" style="display: block;">
									08350
									<br>
									서울 구로구 오리로
									<br>
									101동
									</span>
								</li>
							</ul>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	
<script>
$(document).ready(function() {
	  $('#account-link').click(function() {
	    const textToCopy = $(this).text();
	    copy_account(textToCopy);
	    alert('계좌번호가 복사되었습니다.');
	  });
	});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>