<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 슬릭 슬라이더 제이쿼리 -->
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
	<!-- 슬릭 슬라이더 -->
	<link rel="stylesheet" href="/resources/slick/slick-theme.css"/>
	<link rel="stylesheet" href="/resources/slick/slick.css"/>
	<!-- 슬라이더 화살표 아이콘 arrow -->
	<script src="https://kit.fontawesome.com/285f888d1c.js" crossorigin="anonymous"></script>
    <!--productView.css-->
    <link rel="stylesheet" href="/resources/css/product/productView.css">
    <script src="/resources/js/jquery-3.6.0.js"></script>
</head>
<style>
    .slick-prev:before, .slick-next:before {
    /* 슬릭 슬라이더 아이콘 */
    color: #565656;
    font-family: 'Font Awesome 5 Free';
    font-weight: 900;
    }
    .slick-prev{
        left: 10px;
        z-index: 100;
    }
    .slick-next {
        right: 10px;
    }
    .slick-next:before{
        content: '\f054' !important;
    }
    .slick-prev:before{
        content: '\f053' !important;
    }
    .slick-prev.slick-disabled:before,
    .slick-next.slick-disabled:before
    {
        /* 슬릭 슬라이더 첫,마지막페이지 이전,다음 아이콘 숨김 */
        /* opacity: .25; */
        opacity: 0;
        cursor: default;
    }
    /* .material-symbols-outlined {
    font-variation-settings:
    'FILL' 0,
    'wght' 400,
    'GRAD' 0,
    'opsz' 48
    } */
    .test {
    color: #f88000;
    font-variation-settings:
    'FILL' 1,
    'wght' 400,
    'GRAD' 0,
    'opsz' 48
    }
    .material-symbols-outlined:hover {
    color: #f88000;
    font-variation-settings:
    'FILL' 1,
    'wght' 400,
    'GRAD' 0,
    'opsz' 48
    }
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />



    

	<div class="content-wrap">

	<c:if test="${not empty sessionScope.m }">
			<!-- <form action="/orderSheet.do" method="post">
				<input type="hidden" name="productNo">
				<input type="hidden" name="optionNo">
				<button>주문하기</button>
                <input type="hidden" id="option-list-null" value="${optionList}">
			</form> -->
		<button type="button" id="put-in-cart-btn">장바구니 담기</button>
	</c:if>
    
        <div class="top-info-box">
            <div class="img-box"style="width: 500px;">
            <c:forEach items="${p.fileList }" var="i">
                <img src="/resources/upload/product/${i.filepath }" style="border-radius: 20px;">
            </c:forEach>
            </div>
            <div class="first-info-box">
                <div class="product-name"><a>${p.productName }</a></div>
                <div class="price-box-top">
                <div class="price-box1">
                    <div class="product-discount">
                        <a>${p.productDiscount}%</a>
                    </div>
                </div>
                    <div class="flex-price-box">
                    <div class="price-box2">
                        <div class="no-discount-price">
                            <a style="text-decoration: line-through;">${p.productPrice}</a>
                            <span>원</span>
                        </div>
                        <div class="real-price"><span class="product-price"></span><span class="product-price-currency"> 원</span></div>
                    </div>
                    <div class="icon-box">
                        <div class="like-icon">
                            <a name="like">
                                <!-- <c:if test="${productNo eq boardNo}"> -->
                                <span class="material-symbols-outlined">favorite</span>
                                <!-- </c:if> -->
                            </a>
                        </div>
                        <div class="share-icon">
                            <a href="#">
                                <span class="material-symbols-outlined">share</span>
                            </a>
                        </div>
                    </div>
                </div>
                </div>
                <div class="flex-wrap">
                    <div class="flex-box">
                        <div class="info-title-box">
                            <a class="info-title">택배배송</a>
                        </div>
                        <div class="info-content ic1">
                            <ul>
                                <li class="delivery-info">무료배송<span>(뭉쳐야산다 모든제품 무료배송)</span></li>
                                <li>공동구매 완료되면 배송시작</li>
                            </ul>
                        </div>
                    </div>

                    <div class="flex-box">
                        <div class="info-title-box">
                            <a class="info-title">배송기간</a>
                        </div>
                        <div class="info-content">
                            <ul>
                                <li>1일내 도착 확률 ------------- <span class="delivery-percent">88%</span></li>
                                <li>3일내 도착 확률 ------------- <span class="delivery-percent">91%</span></li>
                                <li>5일내 도착 확률 ------------- <span class="delivery-percent">95%</span></li>
                            </ul>
                        </div>
                    </div>
                    
                    <div class="flex-box">
                        <div class="info-title-box">
                            <a class="info-title">적립금액</a>
                        </div>
                        <div>
                            <ul class="info-content">
                                <li>1일내 도착 확률 : 88%</li>
                                <li>3일내 도착 확률 : 91%</li>
                                <li>5일내 도착 확률 : 97%</li>
                            </ul>
                        </div>
                    </div>

                    <div class="flex-box option-list-box">
                        <div class="info-title-box">
                            <a class="info-title">옵션</a>
                        </div>
                        <div>
                            <ul class="info-content">
                                <li><select class="select-custom product-option">
                                    <option value="0" selected>상품 옵션을 선택해주세요</option>
                                    <c:forEach items="${optionList }" var="po">
	                                    <option value="${po.optionInfoNo }">${po.optionDetailName } ( +<fmt:formatNumber value="${po.optionPrice }"/>원 )</option>
                                    </c:forEach>
                                </select></li>
                            </ul>
                        </div>
                    </div>
                    <div class="flex-btn">
                        <div class="one-btn">
                            <form action="/orderSheet.do" method="post">
                                <input type="hidden" name="productNo">
                                <input type="hidden" name="optionNo">
                                <button class="btn btn-white size02">혼자구매하기</button>
                                <input type="hidden" id="option-list-null" value="${optionList}">
                            </form>
                        </div>
                        <div class="moong-btn">
                            <form action="/moongsanOrder.do" method="post">
                                <input type="hidden" name="productNo">
                                <input type="hidden" name="optionNo">
                                <button class="btn btn-pri size02">뭉쳐야산다</button>
                                <input type="hidden" id="option-list-null" value="${optionList}">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="gonggu-board-logo"><h3>뭉쳐야 산다!</h3></div>
        <div class="gonggu-board">
            <div class="all-flex-wrap">
                <div class="left-flex-wrap">
                    <div class="user-img"><img src="/resources/upload/member/${sessionScope.m.memberPath}" style="width: 50px; height: 50px;"></div>
                    <div class="user-id">${sessionScope.m.memberId}</div>
                    <div class="gonggu-number">(1/2)</div>
                </div>
                <div class="right-flex-wrap">
                    <div class="right-flex-info">
                        <div class="number-info">1명 남음</div>
                        <div class="time-limit" id="timer"></div>
                    </div>
                    <button type="button" class="btn btn-pri size01" id="orderBtn">주문참여</button>
                </div>
            </div>
        </div>
        <div class="quick-scroll-bar">
            <table>
        <tr>
            <td><a href="#" class="product-info-btn">상품설명</a></td>
            <td><a href="#" class="product-view-btn">상세정보</a></td>
            <td><a href="#" class="product-review-btn">리뷰보기</a></td>
            <td><a href="#" class="product-inquiry-btn">문의하기</a></td>
        </tr>
    </table>
</div>  
        <div class="gonggu-content-wrap">
            <div class="gonggu-content-title">
            </div>
            <div class="inquiry-box">
                <table class="inquiry-table">
                    <tr>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>답변상태</th>
                    </tr>
                    <c:forEach items="${iqList }" var="iq">
                        <tr> 
                            <!-- 관리자 답글 조회시 필요한 문의사항 번호 추출용 -->
                            <input type="hidden" value="${iq.inquiryNo}">
                            <td class="inquiry-content-btn">${iq.inquiryTitle }</td>
                            <td>${iq.inquiryWriter }</td>
                            <td>${iq.inquiryDate }</td>
                            <c:if test="${iq.inquiryStatus eq  0}">
                                <td>답변대기</td>
                    </c:if>
                        <c:if test="${iq.inquiryStatus eq  1}">
                            <td>답변완료</td>
                        </c:if>
                    </tr>
                    <tr class="inquiry-content" style="border: none;">
                        <td colspan="4" value="${iq.inquiryWriter}" style="text-align: left; border: none;">${iq.inquiryContent}</td>
                    </tr>
                    <tr class="admin-content" style="border: none;">
                        
                    </tr>
                    <tr class="udBtn" style="border: none;">
                        <td colspan="4" style="border: none;">
                            <div class="btn-flex-wrap">
                                <!-- 문의사항 update에 사용할 inquiryNo를 위한 input -->
                                <input type="hidden" id="inquiryNo" value="${iq.inquiryNo}">
                                <!-- 문의사항 각 게시글의 첫번째 수정버튼 -->
                                <c:choose>
                                    <c:when test="${sessionScope.m.memberId eq iq.inquiryWriter}">
	                                	<button class="btn btn-pri size01 updateBtn" data-modal="#modalBasic">수정</button>
	                                </c:when>
	                                <c:when test="${sessionScope.m.memberStatus eq 0}">
	                                	<button class="btn btn-pri size01 adminModal" data-modal="#adminModal">답글</button>
	                                </c:when>
                                </c:choose>
                                <!-- 문의사항 각 게시글의 첫번째 삭제버튼 -->
                                <button class="btn btn-white size01" id="delBtn" data-modal="#modalDelete">삭제</button>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <div class="insertInquiry">
                <!-- 문의하기 작성 버튼 -->
                <button type="button" id="insertInquiry" class="btn btn-pri size01" data-modal="#modalBasic2">문의하기</button>
            </div>
        </div>
    </div>
    
<!-- <div class="quick-scroll-bar">
        <ul>
        <li><a href="#" class="product-info-btn">상품설명</a></li>
        <li><a href="#" class="product-view-btn">상세정보</a></li>
        <li><a href="#" class="product-review-btn">리뷰보기</a></li>
        <li><a href="#" class="product-inquiry-btn">문의하기</a></li>
        </ul>
        </div>
        <div class="quick-scroll-content">
        <div class="product-info-box" style="height: 500px;">상품정보</div>
        <div class="product-info-view" style="height: 500px;">상세정보</div>
        <div class="product-review" style="height: 500px;">리뷰보기</div>
        <div class="product-inquiry" style="height: 500px;">문의하기</div>
    </div> -->
        <!--구매버튼 시작-->
        <!-- <div class="fix-button-box">
            <div class="gonggu-window">
                <div class="window-close-btn">X</div>
                    <div class="flex-box">
                        <div class="info-title-box">
                            <a class="info-title">옵션</a>
                        </div>
                        <div>
                            <ul class="info-content">
                                <li><select class="select-custom product-option">
                                    <option value="0" selected>상품 옵션을 선택해주세요</option>
                                    <c:forEach items="${optionList }" var="po">
	                                    <option value="${po.optionInfoNo }">${po.optionDetailName } ( +<fmt:formatNumber value="${po.optionPrice }"/>원 )</option>
                                    </c:forEach>
                                </select></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="button-box">
                    <button type="button" class="button buy-one-btn">혼자구매</button>
                    <button type="button" class="button gonggu-buy-btn">공동구매</button>
                </div>
            </div> -->
        </div>
     <!--구매버튼-->
     <!-- 문의사항 삭제 모달 시작 -->
     <div id="modalDelete" class="modal modal-pri">
        <div class="modal-content">
            <div class="modal-header">
                <h6>문의사항 삭제</h6>
            </div>
            <div class="modal-body">
                <!--내용영역-->
                <h5>문의사항을 삭제하시겠습니까?</h5>
                <p class="inquiry-modal-sub-info">⁕ 삭제된 문의사항은 저장되지 않으며 복구 할 수 없습니다.</p>
                <!--//내용영역-->
            </div>
            <div class="area-btn center">
                <button class="btn btn-pri size01 deleteButton" type="button">삭제</button>
                <a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
            </div>
        </div>
    </div>
    <!-- 문의사항 삭제 모달 끌 -->
    <!-- 문의사항 답글 모달 시작 -->
    <div id="adminModal" class="modal modal-pri">
        <div class="modal-content">
            <div class="modal-header">
                <h6>문의사항 답글</h6>
            </div>
            <div class="modal-body">
                <!--내용영역-->
                <h5>[<span class="userId"></span>]님의 문의내용</h5>
                <textarea name="userContent" readonly></textarea>
                <h5>답글내용 입력</h5>
                <textarea name="adminContent"></textarea>
                <input type="hidden" class="adminInquiryNo" value="">
            </div>
            <div class="area-btn right">
                <button class="btn btn-pri size01 adminInsert" type="button" id="adminInsert">답글</button>
                <a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
            </div>
        </div>
    </div>
    <!-- 문의사항 답글 모달 끌 -->
    <!-- 문의사항 수정 모달 시작 -->
    <div id="modalBasic" class="modal modal-pri">
        <div class="modal-content">
            <div class="modal-header">
                <h6>문의사항 수정</h6>
            </div>
            <div class="modal-body">
                <!--내용영역-->
                <h5>수정할 내용을 입력해 주세요.</h5>
                <textarea name="inquiryContent"></textarea>
                <input type="hidden" class="testNumber" valur="">
            </div>
            <div class="area-btn right">
                <button class="btn btn-pri size01 updateDoneBtn" type="button" id="modalUpdateBtn">수정완료</button>
                <a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
            </div>
        </div>
    </div>
    <!-- 문의사항 수정 모달 끌 -->
    <!-- 문의사항 작성 모달 시작 -->
    <div id="modalBasic2" class="modal modal-pri">
        <div class="modal-content">
            <div class="modal-header">
                <h6>문의사항 작성</h6>
            </div>
            <div class="modal-body">
                <!--내용영역-->
                <h5>문의사항을 작성해 주세요</h5>
                <p class="inquiry-modal-sub-info">⁕ 문의사항 수정은 답변대기 상태에서만 가능합니다.</p>
                <br>
                <h6>제목</h6>
                <input type="text" name="inquiryTitle">
                <h6>문의 내용</h6>
                <textarea name="inquiryContent1" style="height: 200px;"></textarea>
            </div>
            <div class="area-btn right">
                <button class="btn btn-pri size01 modalInsertBtn" type="button" id="modalInsertBtn">작성하기</button>
                <a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
            </div>
        </div>
    </div>
    <!-- 문의사항 작성 모달 끝 -->
<input type="hidden" id="productPrice" value="${p.productPrice}">
<input type="hidden" id="productDiscount" value="${p.productDiscount}">
<input type="hidden" id="loginMember" value="${sessionScope.m.memberNo}">
<input type="hidden" id="loginMemberId" value="${sessionScope.m.memberId}">
<input type="hidden" id="productNo" value="${p.productNo}">
<input type="hidden" id="likeNo" value="${l.likeNo}">
<input type="hidden" id="productContent" value="${p.productContent}">







<jsp:include page="/WEB-INF/views/common/footer.jsp" />


    
    
</body>
    	<!-- 슬릭 슬라이더 js -->
	<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <script>
        ///////////////////////////////////////////////////////////////////////////////////////////
        $("#orderBtn").on("click",function(){
      // 현재 시간 가져오기
      var currentTime = new Date();
      // 12시간 후 시간 계산
      var endTime = new Date(currentTime.getTime() + 12 * 60 * 60 * 1000);
      
      // 타이머 업데이트 함수
      function updateTimer() {
        var now = new Date();
        var diff = endTime - now; // 남은 시간 계산
        var hours = Math.floor(diff / (60 * 60 * 1000)); // 시간
        var minutes = Math.floor((diff % (60 * 60 * 1000)) / (60 * 1000)); // 분
        var seconds = Math.floor((diff % (60 * 1000)) / 1000); // 초
        
        // 타이머 텍스트 업데이트
        $('#timer').text((hours < 10 ? '0' : '') + hours + ':' +
                        (minutes < 10 ? '0' : '') + minutes + ':' +
                        (seconds < 10 ? '0' : '') + seconds);
                        
        // 타이머가 종료되면 타이머 정지
        if (diff <= 0) {
          clearInterval(timerInterval);
          $('#timer').text('00:00:00');
        }
      }
      
      // 1초마다 타이머 업데이트
      var timerInterval = setInterval(updateTimer, 1000);
    });
    



        ///////////////////////////////////////////////////////////////////////////////////////////
        $(".gonggu-window").hide();
        $(".gonggu-buy-btn").on("click",function(){
            if($(".gonggu-window").css("display") == "none"){
                $(".gonggu-window").show();
            } else {
                $(".gonggu-window").hide();
            }
            // $.ajax({
            //     url : "/selectOptionGroup.do",
            //     type : "POST",
            //     dataType : "JSON",
            //     data : {productNo : $("#productNo").val()},
            //     success : function(data){
            //         console.log(data);
            //     }
            // });
        });
        $(".window-close-btn").on("click",function(){
            $(".gonggu-window").hide();
        });

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////
        window.onload = function(){
            // 찜하기 DB조회후 로그인한 회원과 같으면 색칠해주는 ajax
            if($("#loginMember").val() != ''){
                $.ajax({
                    url : "/selectProductLike.do",
                    type : "POST",
                    dataType : "JSON",
                    data : {memberNo : $("#loginMember").val(), productNo : $("#productNo").val()},
                    success : function(data){
                        if(data.memberNo == $("#loginMember").val()){
                            $("[name=like]").empty();
                            $("[name=like]").append("<span class='material-symbols-outlined test'>favorite</span>")
                        // } else  {
                        //     $("[name=like]").empty();
                        //     $("[name=like]").append("<span class='material-symbols-outlined'>favorite</span>")
                        }
                    },
                    error : function(){
                        $("[name=like]").empty();
                        $("[name=like]").append("<span class='material-symbols-outlined'>favorite</span>")
                    }
                });
                }
            }
        // 찜하기 버튼 색칠하기
        $("[name=like]").children().on("click",function(){ /*like click event*/
            $(this).children().toggleClass("test");
        })
        // 찜하기 삭제
            $("[name=like]").on("click",function(){ /*like delete*/
            $.ajax({
                url : "/deleteLike.do",
                type : "POST",
		    	dataType : "JSON",
                data : {productNo : $("#productNo").val(), memberNo : $("#loginMember").val()},
                success : function(data){
                    $("[name=like]").empty();
                    $("[name=like]").append("<span class='material-symbols-outlined'>favorite</span>")
                }
            });
        });
        // 찜하기 insert
            $("[name=like]").on("click",function(){ /*like insert*/
            $.ajax({
                url : "/productLike.do",
                type : "POST",
		    	dataType : "JSON",
                data : {productNo : $("#productNo").val(), memberNo : $("#loginMember").val()},
                success : function(data){
                    console.log(data);
                }
            });
        });

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        let productPrice = $("#productPrice").val();
        let productDiscount = $("#productDiscount").val();
        // 금액 3자리마다 , 찍는 함수
        $(function(){
            let result = productPrice * (100-productDiscount)/1000;
            var num = 0;
            num = result;
            var DiscountPrice = Math.floor(result);
            var price = DiscountPrice*10;
            price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            $(".product-price").text(price);
        })

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        // 슬릭슬라이드
        $('.img-box').slick();
        $(".scroll-top").on("click",function(){
            var offset = $("body").offset();
            $("html, body").animate({scrollTop: offset.top},400);
        });

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        // 퀵스크롤 버튼 시작
        $(document).ready(function(){
            $('.product-info-btn').click(function(){
                var offset = $('.product-info-box').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-view-btn').click(function(){
                var offset = $('.product-info-view').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-review-btn').click(function(){
                var offset = $('.product-review').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        $(document).ready(function(){
            $('.product-inquiry-btn').click(function(){
                var offset = $('.product-inquiry').offset(); //선택한 태그의 위치를 반환
                    //animate()메서드를 이용해서 선택한 태그의 스크롤 위치를 지정해서 0.4초 동안 부드럽게 해당 위치로 이동함 
                    $("html, body").animate({scrollTop: offset.top},400); // 선택한 위치로 이동. 두번째 인자는 0.4초를 의미한다.
            });
        });
        //퀵스크롤 버튼 끝


        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


        //문의사항 update에 필요한 값을 게시글 첫번째 수정 버튼 눌렀을때 필요한 값을 추출하기
        $(".updateBtn").on("click",function(){
            var inquiryContent = $(this).parent().parent().parent().prev().children().text();
            var testNumber = $(this).prev().val();
            console.log(testNumber);
            $("[name=inquiryContent]").val(inquiryContent);
            $(".testNumber").val(testNumber);
            console.log($(".testNumber").val());
        })
        //모달 띄우는 함수
        $(function () {
            $('.btn-flex-wrap').children().click(function (event) {
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
            //모달 닫기
            $('#insertInquiry').click(function (event) {
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
        //문의사항 클릭한 게시글 내용 보여주는 버튼(toggle) / 관리자 답변 select
        $(".inquiry-content").hide();
        $(".udBtn").hide();
        let chkcnt = 0;
        $(".inquiry-content-btn").on("click",function(){
            $(this).parent().next().next().children().remove();
            $(this).parent().next().toggle();
            $(this).parent().next().next().next().toggle();
            var inquiryNo = $(this).prev().val();
            if(chkcnt == 0){
                $.ajax({
                    url : "/selectAdminInquiry.do",
                    type : "POST",
                    dataType : "JSON",
                    data : {inquiryNo : inquiryNo},
                    context: this,
                    success : function(data){
                        $(this).parent().next().next().append("<td colspan='4' style='text-align : left;'>"+data.iqAdminContent+"</td>");
                        chkcnt = 1;
                    }
                });
            }else if(chkcnt == 1){
                $(this).parent().next().next().children().remove();
                chkcnt = 0;
            }
        });
        //문의사항 작성
        $("#modalInsertBtn").on("click",function(){
            var inquiryTitle = $("[name=inquiryTitle]").val();
            var inquiryContent = $("[name=inquiryContent1]").val();
            var inquiryWriter = $("#loginMemberId").val();
            var productNo = $("#productNo").val();
            $.ajax({
                url : "/insertInquiry.do",
                type : "POST",
                dataType : "JSON",
                data : {inquiryTitle:inquiryTitle, inquiryContent:inquiryContent, inquiryWriter:inquiryWriter, productNo:productNo},
                success : function(data){
                    if(data == 1){
                        $("#modalBasic2").hide();
                            insertAlert();
                    }
                }
            });
        });
        //문의사항 삭제
        $(".deleteButton").on("click",function(){
            var inquiryNo = $(this).parent().parent().parent().prev().children().next().children().next().children().children().next().children().val();
            console.log(inquiryNo);
        });
        //문의사항 수정
        $(".updateDoneBtn").on("click",function(){
            var inquiryContent = $("[name=inquiryContent]").val();
            var inquiryNo = $(".testNumber").val();
            console.log(inquiryNo);
            
            $.ajax({
                url : "/updateInquiry.do",
                type : "POST",
                dataType : "JSON",
                data : {inquiryContent : inquiryContent, inquiryNo : inquiryNo },
                success : function(data){
                    if(data == 1){
                        $("#modalBasic").hide();
                        jalertshow();
                    } else {
                        console.log("문의사항 작성 실패");
                    }
                }
            });
        });
        //문의사항 답글 모달 값 띄우기
        $(".adminModal").on("click",function(){
            var inquiryContent = $(this).parent().parent().parent().prev().prev().children().text();
            var inquiryWriter = $(this).parent().parent().parent().prev().prev().children().attr("value");
            var inquiryNo = $(this).prev().val();
            $(".adminInquiryNo").val(inquiryNo);
            $("[name=userContent]").text(inquiryContent);
            $(".userId").text(inquiryWriter);

        });
        //문의사항 답글 달기
        $(".adminInsert").on("click",function(){
            var iqAdminContent = $("[name=adminContent]").val();
            var inquiryNo = $(".adminInquiryNo").val();
            $.ajax({
                url : "/adminInsert.do",
                type : "POST",
                dataType : "JSON",
                data : {inquiryNo:inquiryNo, iqAdminContent:iqAdminContent},
                success : function(data){
                    if(data == 1){
                        $("#adminModal").hide();
                        adminInsertAlert();
                    }
                }
            });
        });
        //답글 select
        // $(".inquiry-content-btn").on("click",)
         //문의사항 답글 성공시 띄울 alert창
         function adminInsertAlert(){
                jQueryAlert('success',"문의사항 답글 작성 완료.");

            function jQueryAlert(type, msg) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    case 'success':
                    messageBox = $.parseHTML('<div class="alert__success"></div>');
                    break;
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error"></div>');
                    break;
                    case 'warning':
                    messageBox = $.parseHTML('<div class="alert__warning"></div>');
                    break;
                    case 'info':
                    messageBox = $.parseHTML('<div class="alert__info"></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");
                             location.reload()
                        }
                    },
                    show: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    },
                    hide: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    }
                });
            };
        }
         //문의사항 작성 성공시 띄울 alert창
         function insertAlert(){
                jQueryAlert('success',"문의사항이 작성되었습니다.");

            function jQueryAlert(type, msg) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    case 'success':
                    messageBox = $.parseHTML('<div class="alert__success"></div>');
                    break;
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error"></div>');
                    break;
                    case 'warning':
                    messageBox = $.parseHTML('<div class="alert__warning"></div>');
                    break;
                    case 'info':
                    messageBox = $.parseHTML('<div class="alert__info"></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");
                             location.reload()
                        }
                    },
                    show: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    },
                    hide: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    }
                });
            };
        }
        //문의사항 수정 성공시 띄울 alert창
            function jalertshow(){
                jQueryAlert('success',"문의사항이 수정되었습니다.");

            function jQueryAlert(type, msg) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    case 'success':
                    messageBox = $.parseHTML('<div class="alert__success"></div>');
                    break;
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error"></div>');
                    break;
                    case 'warning':
                    messageBox = $.parseHTML('<div class="alert__warning"></div>');
                    break;
                    case 'info':
                    messageBox = $.parseHTML('<div class="alert__info"></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");
                             location.reload()
                        }
                    },
                    show: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    },
                    hide: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    }
                });
            };
        }
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        </script>

        <script>
            // 상품 옵션 select
            $( function() {
                $( ".product-option" ).selectmenu();
            });
            $( ".product-option" ).on("selectmenuchange", function(){
                console.log($(this).val());
            });

            // 장바구니 담기
            $("#put-in-cart-btn").on("click", function(){
                const productNo = $("#productNo").val();
                const optionNo = $( ".product-option" ).val();

                // alert 띄우고 insert -> OK 누르면 insert 되게 하기 위해 함수 생성해서 번호들 넘겨줌
                jQueryAlert('warning',"", productNo, optionNo);

            });
            function processResult(result, productNo, optionNo) {
                // 페이지 이동 및 db처리
                location.href="/putInShoppingCart.do?productNo="+productNo+"&optionNo="+optionNo;
            }





            // 옵션 없는 상품은 출력 안함
            $(document).ready(function(){
                if($(".info-content").find("option").length == 1){
                    $(".option-list-box").hide();
                }
            });

            // 폼 제출
            $("form").submit(function (e) {
                const productNo = $("#productNo").val();
                const optionNo = $( ".product-option" ).val();
                
                if(optionNo == 0 && $(".info-content").find("option").length > 1){
                    // 옵션 선택 안됐을 때 && 옵션이 있는 상품
					alert("옵션을 선택하세요");       
					// 폼 제출 막음
					e.preventDefault();
                    return false;
                }else{
                    // 옵션이 없거나 옵션 선택된 경우 제출
                    $("[name=productNo]").val(productNo);
                    $("[name=optionNo]").val(optionNo);

                }
			});

            // 장바구니 담기시 성공 alert 띄우고 페이지 이동
            //알림 관련 기능
        // $(function () {
            // $("#alert01").on("click", function () {
            //     jQueryAlert('success',"성공내용성공내용성공내용");
            // });
            // $("#alert02").on("click", function () {
            //     jQueryAlert('error',"에러내용에러내용에러내용에러내용");
            // });
            // $("#put-in-cart-btn").on("click", function () {
            //     jQueryAlert('warning',"장바구니에 담았어요!");
            // });
            // $("#alert04").on("click", function () {
            //     jQueryAlert('info',"정보내용정보내용정보내용정보내용");
            // });

            function jQueryAlert(type, msg, p, o) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    // case 'success':
                    // messageBox = $.parseHTML('<div class="alert__success"></div>');
                    // break;
                    // case 'error':
                    // messageBox = $.parseHTML('<div class="alert__error"></div>');
                    // break;
                    case 'warning':
                    messageBox = $.parseHTML('<div class="alert__warning" style="line-height:100px;text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--primary);padding:0;">뭉쳐야산다</div><br>장바구니에 담았어요!</div>');
                    break;
                    // case 'info':
                    // messageBox = $.parseHTML('<div class="alert__info"></div>');
                    // break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "OK": function () {
                            $(this).dialog("close");

                            // OK 버튼 눌렀을 때 insert 하기 위해 콜백함수 실행
                            processResult(true, p, o);
                        }
                    },
                    show: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    },
                    hide: {
                        effect: 'fade',
                        duration: 200 //at your convenience
                    }
                });
            };
        // });
        </script>
</html>