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
	<!-- <script src="/resources/js/modal-alert.js"></script> -->
    <!-- 디폴트 커스텀 CSS -->
    <link rel="stylesheet" href="/resources/css/common/default.css" />
    <!--헤더 css-->
    <link rel="stylesheet" href="/resources/css/common/header.css" />
    <!--결제 모달 css-->
    <link rel="stylesheet" href="/resources/css/common/modal.css" />
    <!--date range picker css-->
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	<style>
		.categoryGroup ul li{
			font-size: 10px;
		}
		
		#payModalBasic{
			display: none;
		}
		

		/* 스크롤 탑 */
		.top-icon{
			/* width: 40px; */
			/* height: 40px; */
			/* margin: 80px auto; */
			position: fixed;
			z-index: 10;
			right: 52px;
			width: 58px;
			height: 58px;
			cursor: pointer;
			transition: opacity 0.5s ease 0s, bottom 0.5s ease 0s;
			opacity: 1;
			bottom: 15px;
		}

		body .top-icon.hide-icon{
			position: fixed;
			z-index: 10;
			right: 52px;
			bottom: -46px;
			width: 58px;
			height: 58px;
			opacity: 0;
			cursor: pointer;
			transition: opacity 0.5s ease 0s, bottom 0.5s ease 0s;
		}

		.top-icon>a>span{
			display: block;
			width: 100%;
			height: 100%;
			background: url(data:image/png;base64,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) 50% 50% / 58px 58px no-repeat;
		}

		.top-icon>a>span:hover{
			background: url(data:image/png;base64,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) 50% 50% / 58px 58px no-repeat;
		}
	</style>
</head>
<body>
	<!-- top 아이콘-->
	<div class="top-icon">
		<a>
			<span></span>
		</a>
	</div>

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
							<a class="staffMsg">관리자 버전으로 접속중입니다.<span><a href="/myPage.do" class="staffMsg">[내정보]</a></span></a>
						</c:when>
						<c:when test="${sessionScope.m.memberStatus eq 2}">
							<a class="staffMsg">정지회원 상태입니다.</a>
						</c:when>
					</c:choose>
					<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
				</div><!-- header-info -->
				<div class="header-top">
	            	<div class="middle-left">
		                <a href="/" class="title">뭉쳐야산다</a>
	                </div>
	                <div class="middle-center">
						<form action="/searchBar.do" method="post">
							<div class="mainSearch">
								<div class="mainSelect">
									<div id="customSelectBox">
										<div>
											<span>뭉쳐야산다</span>
											<span class="material-symbols-outlined expand">
											expand_more
											</span>
										</div>
										<ul>
										<li>뭉쳐야산다<input type="hidden" name="" value="1"></li>
										<li>회원주최공구<input type="hidden" name="selectBox" value="2"></li>
										</ul>
									</div>
								</div>
								<input type="text" name="searchKeyword" class="mainSearch-input input-noborder" placeholder="상품을 검색해보세요">
								<button class="material-symbols-outlined searchBarBtn">search</button>
							</div>
							<input type="hidden" name="selectBox" value="">
						</form>
		            </div>
	                <div class="middle-right">
	                <c:choose>
	                <c:when test="${!empty sessionScope.m}">
		                <a class="alram-zone" href="/receiveDmList.do?reqPage=1">
		                	<span class="material-symbols-outlined" style="font-variation-settings:'FILL' 0;">notifications</span>
		                	<span class="alram-circle" id="dmCount"></span>
		                </a>
		                <a href="#"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">favorite</span></a>
		                <a href="/shoppingCart.do"><span class="material-symbols-outlined"  style="font-variation-settings:'FILL' 0">shopping_cart</span></a>
	            	</c:when>
	            	<c:otherwise>
	            		<a style="display: inline-block; width: 155px;"></a>
	            	</c:otherwise>
	            	</c:choose>
	            	</div>
            	</div><!-- header-top -->
            	
            	
            	<div class="header-bottom">
            		<div class="menu-product">
		                <div><a href="/bestProductList.do">인기상품</a></div>
		                <div><a href="/insertProductFrm.do">물품등록(예비버튼)</a></div>
		                <c:if test="${!empty sessionScope.m}">
		                	<div id="payModal"><a href="#">충전하기</a></div>
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
			                	<c:when test="${sessionScope.m.memberStatus eq 2}">
				                    <a href="/myPage.do">마이페이지</a>
				                    <a href="/logout.do">로그아웃</a>
			                	</c:when>
		                </c:choose>	
	    			</div><!-- menu-area -->
                
            	</div><!-- header-bottom -->
			</div>
            </section>

            
            <div id="payModalBasic" class="payModal">
            	<div class="payModal-content"  style="width: 80%;">
                	<div class="payModal-header">
                    	<h6>🍊 Moong 충전하기 🍊</h6>
                    </div>
                    <div class="payModal-body">
                    	<input type="radio" name="pointEa" id="point1" value="1000" class="notPointStyle">
                    	<label for="point1" class="notPointStyle">1,000</label>
                    	<input type="radio" name="pointEa" id="point2" value="5000" class="notPointStyle">
                    	<label for="point2" class="notPointStyle">5,000</label>
                    	<input type="radio" name="pointEa" id="point3" value="10000" class="notPointStyle">
                    	<label for="point3" class="notPointStyle">10,000</label>
                    	<input type="radio" name="pointEa" id="point4" value="30000" class="notPointStyle">
                    	<label for="point4" class="notPointStyle">30,000</label>
                    	<input type="radio" name="pointEa" id="point5" value="50000" class="notPointStyle">
                    	<label for="point5" class="notPointStyle">50,000</label>
                   	</div>
                   	<input type="hidden" id="email" value="${m.memberEmail }">
                   	<input type="hidden" id="memberName" value="${m.memberName }">
                   	<input type="hidden" id="memberPhone" value="${m.memberPhone }">
                   	<input type="hidden" id="memberNo" value="${m.memberNo }">
                    <div class="area-btn right">
                    	<button class="btn btn-pri size01" type="button" id="payBtn">충전하기</button>
                    </div>
                </div>
            </div>
        </div><!--header-content-->
    </div><!--header-wrap-->

	
	<script>
		$(".searchBarBtn").on("click",function(){

		});
	$(document).ready(function() {
	    // 모달 열기 버튼 클릭 이벤트
	    $("#payModal").on("click", function() {
	        $("#payModalBasic").modal();
	    });

	    // 충전하기 버튼 클릭 이벤트
	    $("#payBtn").on("click", function() {
	        // 여기에 충전 처리를 위한 로직을 작성하면 됩니다.
	        // 예를 들어, 선택된 라디오 버튼의 값을 가져와서 서버로 전송하는 등의 작업을 수행할 수 있습니다.

	        // 모달 닫기
	        $("#payModalBasic").modal("close");
	    });

	    // 모달 닫기 버튼 클릭 이벤트
	    $("#close").on("click", function() {
	        $("#payModalBasic").modal("close");
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

    <!-- top 아이콘 -->
    <script>
        $(".top-icon").on("click", function(){
            // $('html').scrollTop(0);
            $('html, body').animate({scrollTop: '0'}, 680);
        });

        $(".top-icon").addClass("hide-icon");
        $(window).scroll(function () {
            if($(document).scrollTop() >= 300){
                $(".top-icon").removeClass("hide-icon");
            }else{
                $(".top-icon").addClass("hide-icon");
            }
            
    });
    </script>
    
    <script>
    	$("#customSelectBox").children("div").click(function(){
    		$("#customSelectBox").children("ul").slideToggle();
    	});
    	$("#customSelectBox").find("li").each(function(i,e){
    		$(e).click(function(){
    			const val = $(e).children().val();
    			if(val==1){
    				$("#customSelectBox").find("span").eq(0).text("뭉쳐야산다");
    			}else if(val==2){
    				$("#customSelectBox").find("span").eq(0).text("회원주최공구");
    			}
    			$("#customSelectBox").children("ul").css("display","none");
    		})
    	});
    </script>
	
    <script src="/resources/js/header.js"></script>
	<script src="/resources/js/forDm.js"></script>
</body>
</html>