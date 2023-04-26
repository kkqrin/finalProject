<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

.bankComponent .container .title img {
width: 21px;
height: 21px;
margin-right: 5px;
}
img{
vertical-align: middle;
}
.bankComponent .container {
width: 100%;
padding: 16px;
}
.complete_title1{
padding: 72px 0px 0px;
font-size: 20px;
font-weight: bold;
line-height: 1.2;
letter-spacing: normal;
text-align: left;
color: #999;
width: 413px;
margin: 0 auto;
}
.complete_title2{
padding: 18px 0px 18px;
font-size: 28px;
font-weight: bold;
line-height: 1.14;
letter-spacing: normal;
text-align: left;
color: #000;
width: 413px;
margin: 0 auto;
}
.bankComponent{
width: 413px;
background-color: #fff;
margin-bottom: 10px;
border-radius: 10px;
box-shadow: 0 0 10px 0 rgb(0 0 0 / 15%);
margin: 0 auto;
margin-top: 18px;
margin-bottom: 18px;
}
.bankComponent .container .title{
display: flex;
flex-direction: row;
flex-wrap: nowrap;
align-items: center;
font-size: 18px;
font-weight: bold;
font-stretch: normal;
font-style: normal;
line-height: normal;
letter-spacing: normal;
text-align: left;
color: #343943;
margin-bottom: 12px;
}
.bankComponent .container .con ul{
display: flex;
flex-direction: column;
}
.bankComponent .container .con ul li{
display: flex;
flex-direction: row;
flex-wrap: nowrap;
align-items: center;
margin-bottom: 12px;
}
.bankComponent .container .con ul li p{
width: 120px;
font-size: 15px;
font-weight: 500;
font-stretch: normal;
font-style: normal;
line-height: normal;
letter-spacing: normal;
text-align: left;
color: #242424;
margin-bottom: 0;
}
.bankComponent .container .con ul li div{
display: flex;
flex-direction: row;
flex-wrap: nowrap;
align-items: center;
}
.bankComponent .container .con ul li div .bank {
width: fit-content;
font-size: 15px;
font-weight: bold;
font-stretch: normal;
font-style: normal;
line-height: normal;
letter-spacing: normal;
text-align: left;
color: #242424;
margin-right: 9px;
white-space: nowrap;
}
.bankComponent .container .con ul li .depositor_name {
font-size: 15px;
font-weight: bold;
font-stretch: normal;
font-style: normal;
line-height: normal;
letter-spacing: normal;
text-align: left;
color: #242424;
}
.bankComponent .container .con ul li div .account {
width: fit-content;
font-size: 15px;
font-weight: bold;
font-stretch: normal;
font-style: normal;
line-height: normal;
letter-spacing: normal;
text-align: left;
color: rgba(36, 36, 36, 0.6);
border-bottom: 1px solid rgba(36, 36, 36, 0.6);
}
.request-btn1 {
    display: inline-block;
    cursor: pointer;
    width: 30%;
    height: 42px;
    font-family: Pretendard;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    color: #999;
    line-height: 42px;
}
.request-btn2 {
    display: inline-block;
    cursor: pointer;
    width: 70%;
    height: 42px;
    margin: 0 0 0 2px;
    padding: 10px 0px;
    border-radius: 10px;
    background-color: #ffb801;
    font-family: Pretendard;
    font-size: 14px;
    font-weight: bold;
    text-align: center;
    color: #fff;
}
.complete_row .info {
    font-family: Pretendard;
    font-size: 10px;
    font-weight: 500;
    line-height: 1.4;
    letter-spacing: normal;
    text-align: left;
    color: #b8b8b8;
    display: block;
    width: 100%;
}
</style>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="content-boardOrderAfter">
			<div class="complete_title1">
				여기여기 입금 제출 완료🎉
				<div class="complete_title2">
					 바로 입금을 진행해주세요
					<br>
					 주문이 취소될 수 있습니다.
				</div>
				<div class="bankComponent">
					<div class="container">
						<p class="title"><img src="https://d2i2w6ttft7yxi.cloudfront.net/formViewer/bank_icon.webp">
						입금처 정보
						</p>
						<div class="con">
							<ul>
								<li>
									<p>은행</p>
									<div>
										<p class="bank">${b.accountBank}</p>
									</div>
								</li>
								<li>
									<p>예금주</p>
									<div class="depositor_name">${b.accountName}</div>
								</li>
								<li>
									<p>입금 계좌</p>
									<div>
										<p class="account">${b.accountWriter}</p>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="complete_row" style="height:42px; display: flex; margin-top:20px;">
					<div class="request-btn1" onclick="location.href='/boardList.do?reqPage=1';">나중에 하기</div>
					<div class="request-btn2" onclick="location.href='/myPageRequestDeposit.do?baordNo=${b.boardNo}&joinNo=${bj.joinNo}';">입금했어요!</div>
				</div>
				<div class="complete_row" style="margin-top:20px;">
					<span class="info">. 시간 내 입금하지 않으면 주문이 취소될 수 있습니다.</span>
					<span class="info">. 뭉쳐야산다 회원인 경우 폼 참여 내역에서 입금처 정보를 확인하실 수 있습니다.</span>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>
</html>