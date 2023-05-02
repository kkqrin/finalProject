<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 슬릭 슬라이더 제이쿼리 -->
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
<!-- 상품 css -->
<link rel="stylesheet" href="/resources/css/product/product.css"/>
<!-- 슬릭 슬라이더 -->
<link rel="stylesheet" href="/resources/slick/slick-theme.css"/>
<link rel="stylesheet" href="/resources/slick/slick.css"/>
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!-- 슬라이더 화살표 아이콘 arrow -->
<script src="https://kit.fontawesome.com/285f888d1c.js" crossorigin="anonymous"></script>

<style>
    .material-symbols-outlined.star-rate{
        /* 구글 아이콘 (별점) */
        font-variation-settings:
        'FILL' 1
    }
    .slick-prev:before, .slick-next:before {
        /* 슬릭 슬라이더 아이콘 */
        color: #565656;
        font-family: 'Font Awesome 5 Free';
        font-weight: 900;
    }
    .slick-next:before{
        content: '\f054' !important;
    }
    .slick-prev:before{
        content: '\f053' !important;
    }
    .popular-product-wrap>.slick-prev.slick-disabled,
    .popular-product-wrap>.slick-next.slick-disabled
    {
        /* 슬릭 슬라이더 첫,마지막페이지 이전,다음 아이콘 숨김 */
        /* opacity: .25; */
        opacity: 0;
        cursor: default;
    }
    .content-wrap .board-wrap-header{
     	margin-top: 200px;
    }
    
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />

    
    
    
    
    
    
    
    <div class="content-wrap">
    <c:if test="${not empty sessionScope.m}">
           <div class="area-btn right" style="padding-top : 25px;">
              <button class="btn btn-sec size02"  data-modal="#modalBasic" style="color: #3a3a3a">여기여기붙어봐<span class="material-symbols-outlined" style="color: #3a3a3a; font-size: 24px; padding-bottom: 3px;">recommend</span></button>
         </div>
       </c:if>
    
    <!-- 카테고리 구분 -->
    <input type="hidden" id="sCategoryNo" value="${sCategory }">
    
    <div class="category-wrap">
    	<h3 style="color: var(--primary);">여기여기붙어라</h3>
    	<h5 class="current-category-name"></h5>
    	<ul class="subcategory-name-list">
    		<li><a href="/boardList.do" class="all-category">전체보기</a></li>
    		<c:forEach items="${categoryList }" var="c">
    		<li><a href="/boardList.do?categoryNo=${c.categoryNo }" class="sub-category">${c.categoryName }</a></li>
    		</c:forEach>
    	</ul>
    </div>
    
    
    <div class="board-wrap">
    	<!-- 전체 상품 wrap -->
    	<c:forEach items="${boardList }" var="b" varStatus="status">
    		<div class="posting-item" style="width: 300px;">
    			<div class="posting-img" style="width: 180px; height: 220px;">
    				<a href="/boardView.do?boardNo=${b.boardNo }">
    					<img src="/resources/upload/board/${b.thumbnail}" />
    				</a>
    			</div>
    			<div class="posting-content">
    				<p class="posting-title">
    					<a href="/boardView.do?boardNo=${b.boardNo }">
    						${b.boardName }
    					</a>
    				</p>
  					<div class="posting-detail">
						<div class="posting-info">
							<div>
								<span class="posting-info-box" style="background-color: var(--primary);"><a href="/boardYourPage.do?boardWriter=${b.boardWriter }">${b.boardWriter }</a> </span>
							</div>
							<div>
								<span class="posting-info-box">택배비포함 (3000원)</span>
							</div>
						</div>
					</div>
    			</div>
    		</div>
    	
    	</c:forEach>
    	<div class="pagination">
			${pageNavi }
			</div>
    </div>
    
    
    
    
    
    
    
    
       
    
    <!-- modal-basic -->
                <div id="modalBasic" class="modal modal-pri">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h6>판매자 준수사항</h6>
                        </div>
                        <div class="modal-body" style="font-size: 12px; margin-left: 2px; margin-bottom: 2px;">
                            <!--내용영역-->
                            <h6>판매자님, 약속해 주세요!</h6>
                            <p>1 배송이 지연된다면 구매자에게 꼭 안내를 해야해요. </p>
                            <p>2 구매자와의 연락 수단은 쪽지를 필수로 사용해 주세요. </p>
                            <p>3 구매자의 개인정보는 마케팅 등의 다른 목적으로 사용 할 수 없어요. </p>
                            <p>4 개인정보는 배송/반품/환불 또는 고객 상담이 완료되는 즉시 삭제해 주세요. </p>
                            <div style="padding: 20px 0 ; background-color: #f8f8f8;">
                            <h6 style="text-align: center;">위 사항을 성실히 이행하지 않을시,</h6>
                            <h6 style="text-align: center;">관련법에 의거하여 법적인 조치를 받을 수 있음을 인지하였습니다. </h6>
                            </div>
                            <!--//내용영역-->
                        </div>
                        <div class="area-btn right">
                            <button class="btn btn-pri size01" type="button" onclick="location.href='/boardWriteFrm.do'" style="margin: 0 auto;">동의 합니다.</button>
                        </div>
                    </div>
                </div>
    
    

		










   </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />   


    <!-- 상품 js -->
    <script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <script src="/resources/js/product.js"></script>
    <script>
    
    // 액티브 카테고리
    $(document).ready(function(){
        // class="active-category-name"

        const categoryNo = Number($("#sCategoryNo").val());

        console.log(categoryNo);

        if(categoryNo == 0){
            $(".all-category").addClass("active-category-name");
        }else{
            $(".all-category").removeClass("active-category-name");
            $(".sub-category").eq(categoryNo-1).addClass("active-category-name");

            $(".current-category-name").text($(".active-category-name").text());
        }
    });	

    
    
    
  //모달 관련 기능
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
    </script>
</body>
</html>