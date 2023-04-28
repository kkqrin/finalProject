<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지를 로드할 수 없습니다</title>
</head>


<!-- 디폴트 커스텀 CSS -->
<link rel="stylesheet" href="/resources/css/common/default.css" />



<style>
body{
	margin:0;
	background-color: rgba(250,220,225,0.3);
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
}
.errorBox{
	position:relative;
	z-index: 100;
}
.backGround{
	position: relative;
	width: 100vw;
	display: flex;
	justify-content: center;
	z-index: 10;
}
.backGround>a{
	font-family: 'Indie Flower', cursive;
	position: absolute;
	font-size:200px;
	color:#fff;
	opacity: 0.8;
}
.errorBox h1,h3{
	text-align:center;
	color:rgb(255,122,60);
	margin:0;
	font-size: 100px;
	font-family: 'Grandstander', cursive;
}
.errorBox h3{
	font-size: 36px;
}
.errorBox>h1>span{
	display:inline-block;
	width:76px;
	height:100px;
	background: url(/resources/img/common/errorOrange.png);
	background-size: cover;
	background-position: center;
}
.errorBox h5{
	text-align:center;
	color:rgb(255,122,60);
	font-size: 24px;
}
.center{
	margin-top : 50px;
}
.logo{
	margin-top: 50px;
	font-family: 'Dongle', sans-serif;
    font-size: 42px !important;
}
</style>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Grandstander&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">
<body>
	<div class="ground">
		<div class="backGround">
			<a>Internal Server Error</a>
		</div>
		<div class="errorBox">
			<h1>ERR<span></span>R</h1>
			<h3>Whoops, that page is gone.</h3>
			<h5>죄송합니다. 원하시는 페이지를 찾을 수 없습니다</h5>
			<div class="area-btn center">
			<button class="btn btn-sec size03" onclick="history.back()">뒤로가기</button>
			</div>
			<h5 class="logo">뭉쳐야산다</h5>
		</div>
	</div>
</body>

</html>