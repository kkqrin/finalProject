<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- 결제 -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- jquery -->
    <script src="/resources/js/jquery-3.6.0.js"></script>
	<!-- 구글 아이콘 -->
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!--font Notosans // 폰트 본고딕 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <!--font Black Dongle // 타이틀 폰트-->
	<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@700&display=swap" rel="stylesheet">

    <!--jquery ui .js-->
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
    <!--jquery modal-->
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css">
    <!--모달 and 알럿-->
<!--     <script src="/resources/js/modal-alert.js"></script> -->
    <!-- 디폴트 커스텀 CSS -->
    <link rel="stylesheet" href="/resources/css/common/default.css" />
    <!--헤더 css-->
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <!--date range picker css-->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<style>
		.categoryGroup ul li{
			font-size: 10px;
		}
		.modal-body{
			display:flex;
		}
		.modal-body input{
			width: 20%;
		}
	</style>
</head>
<body>
	<div class="header-wrap">
        <div class="header-content">
        
            
		
			<section>
			<div class="header-left">
				<div class="menu-category">
					<div class="reorder-box">
						<span class="material-symbols-outlined reorder">reorder</span>
						카테고리
					</div>
					<div class="category-content">
						<div class="main-category">
							<!--ajax로 카테고리가 생성될 영역-->
						</div>
					</div><!-- category-content -->
              	</div><!-- menu-category -->
			</div><!-- header-left -->
			
			
			<div class="header-right">
				<div class="header-info">
					<c:choose>
						<c:when test="${sessionScope.m.memberStatus eq 1}">
							<a class="helloMsg">${sessionScope.m.memberName }님 환영합니다!</a>
						</c:when>
						<c:when test="${sessionScope.m.memberStatus eq 0}">
							<a class="staffMsg">관리자 버전으로 접속중입니다.</a>
						</c:when>
					</c:choose>
				</div><!-- header-info -->
				<div class="header-top">
	            	<div class="middle-left">
		                <a href="/" class="title">뭉쳐야산다</a>
	                </div>
	                <div class="middle-center">
						<form action="/searchBar.do" method="post">
							<div class="mainSearch">
								<input type="text" name="searchKeyword" class="mainSearch-input input-noborder" placeholder="상품을 검색해보세요">
								<button class="material-symbols-outlined">search</button>
							</div>
						</form>
		            </div>
	                <div class="middle-right">
		                <a href="#"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">notifications</span></a>
		                <a href="#"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">favorite</span></a>
		                <a href="/shoppingCart.do"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">shopping_cart</span></a>
	            	</div>
            	</div><!-- header-top -->
            	
            	
            	<div class="header-bottom">
            		<div class="menu-product">
		                <div><a href="#">인기상품</a></div>
		                <div><a href="/insertProductFrm.do">물품등록(예비버튼)</a></div>
		                <c:if test="${!empty sessionScope.m}">
		                	<div data-modal="#modalBasic"><a href="#">충전하기</a></div>
		                </c:if>
		                <div><a href="#">오늘의상품</a></div>
		                <div class="together">
		                	<a href="/boardList.do?reqPage=1">
		               		 여기여기붙어라
		               		 <span class="material-symbols-outlined recommend">recommend</span>
		               		</a>
		                </div>
	                </div>
	              	<div class="menu-area">
								<a href="/noticeList.do?reqPage=1&searchType=0">공지사항</a>
		            	<c:choose>
		            			<c:when test="${empty sessionScope.m}">
				                    <a href="/signUpFrm.do">회원가입</a>
				                    <a href="/loginFrm.do">로그인</a>
			                	</c:when>
			                	<c:when test="${sessionScope.m.memberStatus eq 1}">
				                    <a href="/myPage.do">마이페이지</a>
				                    <a href="/logout.do">로그아웃</a>
			                	</c:when>
			               		<c:when test="${sessionScope.m.memberStatus eq 0}">
				                    <a href="/admin.do">관리자페이지</a>
				                    <a href="/logout.do">로그아웃</a>
			                	</c:when>
		                </c:choose>	
	    			</div><!-- menu-area -->
                
            	</div><!-- header-bottom -->
			</div>
            </section>

            
            <div id="modalBasic" class="modal modal-sec">
            	<div class="modal-content">
                	<div class="modal-header">
                    	<h6>Moong 충전하기</h6>
                    </div>
                    <div class="modal-body">
                    	<input type="radio" name="pointEa" id="point1" value="1000">
                    	<label for="point1">1,000</label>
                    	<input type="radio" name="pointEa" id="point2"value="5000">
                    	<label for="point2">5,000</label>
                    	<input type="radio" name="pointEa" id="point3"value="10000">
                    	<label for="point3">10,000</label>
                    	<input type="radio" name="pointEa" id="point4"value="30000">
                    	<label for="point4">30,000</label>
                    	<input type="radio" name="pointEa" id="point5"value="50000">
                    	<label for="point5">50,000</label>
                   	</div>
                   	<input type="hidden" id="email" value="${m.memberEmail }">
                   	<input type="hidden" id="memberName" value="${m.memberName }">
                   	<input type="hidden" id="memberPhone" value="${m.memberPhone }">
                   	<input type="hidden" id="memberNo" value="${m.memberNo }">
                    <div class="area-btn right">
                    	<button class="btn btn-pri size01" type="button" id="payBtn">충전하기</button>
                        <a href="" rel="modal:close" class="btn btn-sec size01" id="close">닫기</a>
                    </div>
                </div>
            </div>
        </div><!--header-content-->
    </div><!--header-wrap-->

	
	<script>
		$(function () {
	        $('[data-modal]').click(function (event) {
	            const modalId = $(this).data('modal');
	            if ($(modalId).hasClass('modal-pri')) {
	                $($(this).data('modal')).modal({
	                    fadeDuration: 100
	                });
	                return false;
	            } else if ($(modalId).hasClass('modal-sec')) {
	                $($(this).data('modal')).modal({
	                    escapeClose: false,
	                    showClose: false,
	                    fadeDuration: 100
	                });
	                return false;
	            } else {
	                return false;
	            }
	        });
	    });
		
		$("#payBtn").on("click",function(){
			const price = $("input[name=pointEa]:checked").val();
			const d = new Date();
			
			const memberMail = $("#email").val();
			const memberName = $("#memberName").val();
			const memberPhone = $("#memberPhone").val();
			const memberNo = $("#memberNo").val();
			
			
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			
			IMP.init("imp35435215");
			IMP.request_pay({
				pg : "html5_inicis",
				pay_method : "card",
				merchant_uid: "상품번호_"+date,//상점에서 관리하는 주문번호
				name: "뭉쳐야산다",//결제이름
				amount : price,
				buyer_email: memberMail,
				buyer_name: memberName,
				buyer_tel: memberPhone
			},function(rsp){
				if(rsp.success){
					alert("결제성공");
					$("#close").click();
					location.href="/insertPoint.do?memberNo="+memberNo+"&pointEa="+price;
				}else{
					alert("결제실패");
				}
			});
		});
	</script>

	
    <script src="/resources/js/header.js"></script>

</body>
</html>