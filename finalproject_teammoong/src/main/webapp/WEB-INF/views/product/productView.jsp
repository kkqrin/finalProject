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
    <c:if test="${not empty sessionScope.m }">
        <jsp:include page="/WEB-INF/views/common/stickyRight.jsp" />
    </c:if>



    

<div class="content-wrap">
	<c:if test="${not empty sessionScope.m }">
			<!-- <form action="/orderSheet.do" method="post">
				<input type="hidden" name="productNo">
				<input type="hidden" name="optionNo">
				<button>주문하기</button>
                <input type="hidden" id="option-list-null" value="${optionList}">
			</form> -->
		<!-- <button type="button" id="put-in-cart-btn">장바구니 담기</button> -->
	</c:if>
        <div class="top-info-box">
            <div class="img-box">
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
                    
                    <!-- <div class="flex-box">
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
                    </div> -->

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
                    <div class="flex-box">
                        <div class="info-title-box">
                            <a class="info-title">수량</a>
                        </div>
                        <div class="info-content">
                            <div class="product-view-volume">
                                <button type="button" class="minus-count">-</button>
                                <input type="text" name="pop_out" value="1" readonly="readonly" style="text-align:center;"/>
                                <button type ="button" class="plus-count">+</button>
                            </div>
                        </div>
                    </div>
                    <div class="flex-btn">
                        <div>
                            <div class="cart-btn">
                                <!-- <button type="button" id="put-in-cart-btn">장바구니 담기</button> -->
                                <span id="put-in-cart-btn" class="material-symbols-outlined" style="font-variation-settings:'FILL' 0">add_shopping_cart</span>
                            </div>
                        </div>
                        <div class="form-box">
                            <div class="one-btn">
                                <form action="/orderSheet.do" method="post">
                                    <input type="hidden" name="productNo">
                                    <input type="hidden" name="optionNo">
                                    <button class="btn btn-white size02">혼자구매하기</button>
                                    <input type="hidden" id="option-list-null" value="${optionList}">
                                    <input type="hidden" name="page" value="0">
                                </form>
                            </div>
                            <div class="moong-btn">
                                <form action="/moongsanOrder.do" method="post">
                                    <input type="hidden" name="productNo">
                                    <input type="hidden" name="optionNo">
                                    <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                                    <button class="btn btn-pri size02">뭉쳐야산다</button>
                                    <input type="hidden" id="option-list-null" value="${optionList}">
                                    <input type="hidden" name="btnDivision" value="main">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="gonggu-board-logo"><h3>뭉쳐야 산다!</h3></div>
        	<c:if test="${gongguList ne null }">
        <div class="gonggu-board">
            <c:forEach items="${gongguList }" var="g">
            <div class="all-flex-wrap">
                <div class="left-flex-wrap">
                    <div class="user-img"><img src="/resources/upload/member/${g.memberPath}" style="width: 50px; height: 50px;"></div>
                    <div class="user-id">${g.memberId}</div>
                    <div class="gonggu-number">(${g.useCnt}/${g.gongguNumber })</div>
                </div>
                <div class="right-flex-wrap">
                    <div class="right-flex-info">
                        <div class="number-info">${g.gongguNumber-g.useCnt}명 남음</div>
                    </div>
                    <c:if test="${sessionScope.m.memberId eq g.memberId }">
                    <form action="/updateGonggu.do" method="post">
                    <input type="hidden" name="gongguPayNo" value="${g.gongguPayNo}">
                    <button type="submit" class="btn btn-pri size01" id="orderBtn">뭉산취소</button>
                    </form>
                    </c:if>
                    <c:if test="${sessionScope.m.memberId ne g.memberId }">
                        <div class="form-box">
                            <div>
                                <form action="/moongsanOrder.do" method="post" class="subMoongsanOrderBtn">
                                    <input type="hidden" name="productNo">
                                    <input type="hidden" name="optionNo">
                                    <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                                    <button class="btn btn-pri size01" id="orderBtn">주문참여</button>
                                    <input type="hidden" id="option-list-null" value="${optionList}">
                                    <input type="hidden" name="gongguNo" value="${g.gongguNo}">
                                    <input type="hidden" name="btnDivision" value="sub">
                                </form>
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </c:forEach>
        </div>
        </c:if>
        
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
        <div class="product-content-logo product-info-box"><h3>상품설명</h3></div>
        <div class="product-content-wrap">
            ${p.productContent}
        </div>
        <div class="product-review-logo product-review"><h3>리뷰</h3></div>
        <div class="review-wrap">
            <form action="/reviewWrite.do" method="post" enctype="multipart/form-data"></form>
            <!-- <div class="top-info">
                <div class="img-title">사진</div>
                <div class="content-title">내용</div>
            </div>
            <div class="middle-content">
                <div class="middle-left-content">
                    <input type="file" name="reviewFile" multiple onchange="readURL(this)">
                    <img id="preview">
                    <fieldset class="rate">
                        <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                        <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                        <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                        <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                        <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                        <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                        <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                        <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                        <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                        <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
                    </fieldset>
                </div>
            </div> -->
            <table>
                <tr>
                    <th style="background-color: #f88000;">사진</th>
                    <th style="background-color: #f88000;" colspan="5">내용</th>
                </tr>
                <tr>
                    <td >
                        <input type="file" name="reviewFile" multiple onchange="readURL(this)">
                        <img id="preview">
                    </td>
                    <td colspan="5" rowspan="3"><textarea style="height: 200px; border: none;"></textarea></td>
                </tr>
                <tr >
                    <td>별점</td>
                    <!-- <td style="color:gold">
                        <div>
                          <label for="star1">★</label>
                        </div>
                        <input type="radio" name="star" id="star1" value="1">
                      </td>
                    <td style="color:gold">★★<div><input type="radio" name="star" value="2"></div></td>
                    <td style="color:gold">★★★<div><input type="radio" name="star" value="3"></div></td>
                    <td style="color:gold">★★★★<div><input type="radio" name="star" value="1"></div></td>
                    <td style="color:gold">★★★★★<div><input type="radio" name="star" value="1"></div></td> -->
                </tr>
                <!-- <fieldset class="rate">
                    <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                    <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                    <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                    <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                    <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                    <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                    <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                    <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                    <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                    <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
                </fieldset> -->
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td colspan="6"><div class="area-btn full"><button class="btn btn-pri size02">리뷰작성</button></div></td>
                </tr>
            </table>
        </div>  
        <div class="gonggu-content-wrap">
            <div class="gonggu-content-title">
            </div>
            <div class="product-inquiry-logo product-inquiry"><h3>문의사항</h3></div>
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
                <button type="button" id="insertReview" class="btn btn-pri size01" data-modal="#modalReview">리뷰하기</button>
            </div>
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
     <!--구매버튼-->
     <!--리뷰작성 모달 시작-->
     <form action="/insertReview.do" method="post" enctype="multipart/form-data">
     <div id="modalReview" class="modal modal-pri" style="max-width: none;">
        <div class="modal-content">
            <div class="modal-header">
                <h6>리뷰작성</h6>
            </div>
                <input type="hidden" name="reviewWriter" value="${sessionScope.m.memberId}">
                <input type="hidden" name="productNo" value="${p.productNo}">
            <div class="modal-body">
                <!--내용영역-->
                <div style="display: flex;">
                    <div>
                        <!-- <h5>사진첨부</h5> -->
                        <div id="root">
                            <h5>사진등록</h5>
                            <div class="contents">
                              <div class="upload-box">
                                <div id="drop-file" class="drag-file">
                                  <img src="https://img.icons8.com/pastel-glyph/2x/image-file.png" alt="파일 아이콘" class="image" >
                                  <p class="message">사진 드래그 업로드</p>
                                  <img src="" alt="미리보기 이미지" class="preview">
                                </div>
                                <label class="file-label" for="chooseFile">사진선택</label>
                                <input class="file" id="chooseFile" type="file" onchange="dropFile.handleFiles(this.files)" accept="image/png, image/jpeg, image/gif" multiple>
                              </div>
                            </div>
                          </div>
                        <!-- <input type="file" name="reviewFile" multiple onchange="readURL(this)"> -->
                        <!-- <img id="preview"> -->
                    </div>
                    <div style="width: 100%; margin-left: 10px;">
                        <div>
                        <fieldset class="rate" style="padding: 0;"><h5 style="padding-bottom: 10px;">별점</h5>
                            <input type="radio" id="rating10" name="rating" value="10"><label for="rating10" title="5점"></label>
                            <input type="radio" id="rating9" name="rating" value="9"><label class="half" for="rating9" title="4.5점"></label>
                            <input type="radio" id="rating8" name="rating" value="8"><label for="rating8" title="4점"></label>
                            <input type="radio" id="rating7" name="rating" value="7"><label class="half" for="rating7" title="3.5점"></label>
                            <input type="radio" id="rating6" name="rating" value="6"><label for="rating6" title="3점"></label>
                            <input type="radio" id="rating5" name="rating" value="5"><label class="half" for="rating5" title="2.5점"></label>
                            <input type="radio" id="rating4" name="rating" value="4"><label for="rating4" title="2점"></label>
                            <input type="radio" id="rating3" name="rating" value="3"><label class="half" for="rating3" title="1.5점"></label>
                            <input type="radio" id="rating2" name="rating" value="2"><label for="rating2" title="1점"></label>
                            <input type="radio" id="rating1" name="rating" value="1"><label class="half" for="rating1" title="0.5점"></label>
                        </fieldset>
                        </div>
                        <br>
                        <h5>리뷰내용</h5>
                        <textarea name="reviewContent" style="height:65%; "></textarea>
                    </div>
                </div>
            </div>
            <div class="area-btn right">
                <!-- class="btn btn-pri size01 reviewInsertBtn" id="reviewInsertBtn" -->
                <button>작성</button>
                <a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
            </div>
        </div>
    </div>
</form>
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
<!-- <input type="hidden" id="productContent" value="${p.productContent}"> -->




<jsp:include page="/temporReview.jsp" />


<jsp:include page="/WEB-INF/views/common/footer.jsp" />


    
    
</body>
    	<!-- 슬릭 슬라이더 js -->
	<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
    <!-- 상품 상세 js -->
	<script src="/resources/js/productView.js"></script>	


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
                const cnt = $("[name=pop_out]").val();
                
                if(optionNo == 0 && $(".info-content").find("option").length > 1){
                    optionjQueryAlert('info'); 
                    // alert("옵션을 선택하세요");
                }else{
                    // alert 띄우고 insert -> OK 누르면 insert 되게 하기 위해 함수 생성해서 번호들 넘겨줌
                    jQueryAlert('warning',"", productNo, optionNo, cnt);
                }

            });
            function processResult(result, productNo, optionNo, cnt) {
                // 페이지 이동 및 db처리
                location.href="/putInShoppingCart.do?productNo="+productNo+"&optionNo="+optionNo+"&cnt="+cnt;
            }





            // 옵션 없는 상품은 출력 안함
            $(document).ready(function(){
                if($(".info-content").find("option").length == 1){
                    $(".option-list-box").hide();
                }
            });

            // 폼 제출
            $(".form-box>div>form").submit(function (e) {
                const productNo = $("#productNo").val();
                const optionNo = $( ".product-option" ).val();
                
                if(optionNo == 0 && $(".info-content").find("option").length > 1){
                    // 옵션 선택 안됐을 때 && 옵션이 있는 상품
                    optionjQueryAlert('info');
					// alert("옵션을 선택하세요");

					// 폼 제출 막음
					e.preventDefault();
                    return false;
                }else{
                    // 옵션이 없거나 옵션 선택된 경우 제출
                    $("[name=productNo]").val(productNo);
                    $("[name=optionNo]").val(optionNo);
                    // 수량
                    $("[name=page]").val($("[name=pop_out]").val());
                }
			});

            // 공동구매 폼 제출
            $(".moong-btn>form").submit(function (e) {

                const optionNo = $( ".product-option" ).val();

                if(Number($("[name=pop_out]").val()) != 1){
                    // 수량이 1이 아닐때
                    gongujQueryAlert('error'); // 수량 체크

                    e.preventDefault();
                    return false;
                }else{
                    // 수량이 1이면

                    if(optionNo == 0 && $(".info-content").find("option").length > 1){
                        // 옵션 선택 안됐을 때 && 옵션이 있는 상품

                        optionjQueryAlert('info'); // 옵션 체크

                        // 폼 제출 막음
                        e.preventDefault();
                        return false;
                    }else{
                        gonguTwojQueryAlert('error', this);

                        e.preventDefault();
                        return false;
                    }
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

            function jQueryAlert(type, msg, p, o, c) {
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
                    messageBox = $.parseHTML('<div class="alert__warning" style="line-height:100px;text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--primary);padding:0;">뭉쳐야산다</div><br>장바구니에 담으시겠습니까?</div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: [
                        {
                            text: "담기",
                            style: "margin-right:5px",
                            click: function(){
                                $(this).dialog("close");

                                // OK 버튼 눌렀을 때 insert 하기 위해 콜백함수 실행
                                processResult(true, p, o, c);
                            }
                        },
                        {
                            text: "취소",
                            click: function(){
                                $(this).dialog("close");
                            }
                        }
                    ],
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



            // 옵션 선택 안됐을때 alert
            function optionjQueryAlert(type) {
                let $type = type;
                // let messageBox = msg;
                switch ($type) {
                    case 'info':
                    messageBox = $.parseHTML('<div class="alert__info" style="line-height:100px;text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--info);padding:0;">뭉쳐야산다</div><br>옵션을 선택해주세요!</div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    // open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "닫기": function () {
                            $(this).dialog("close");
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


            // 공동구매 (뭉산) 수량 1개만 가능하므로 그 이외를 입력했을때
            function gongujQueryAlert(type) {
                let $type = type;
                // let messageBox = msg;
                switch ($type) {
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error" style="text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--error);padding:0;">뭉쳐야산다</div><div style="margin: 50px auto;"><div>공동구매 제품은 1인 1개 구매제한 입니다.</div><div style="margin-top:10px;">수량을 1개만 선택해주세요 !</div></div></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    // open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    buttons: {
                        "닫기": function () {
                            $(this).dialog("close");
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

            // 공동구매 진행시 기본 alert
            function gonguTwojQueryAlert(type, form) {
                let $type = type;
                // let messageBox = msg;
                switch ($type) {
                    // case 'success':
                    // messageBox = $.parseHTML('<div class="alert__success"></div>');
                    // break;
                    // case 'error':
                    // messageBox = $.parseHTML('<div class="alert__error"></div>');
                    // break;
                    case 'error':
                    messageBox = $.parseHTML('<div class="alert__error" style="text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--error);padding:0;">뭉쳐야산다</div><div style="margin-bottom: 50px;margin-top: 20px;"><h6 style="margin-bottom:40px;">< 공동구매 안내 ></h6><div>상품하단에 위치한 뭉쳐야산다 게시판에서 <button type="button" class="btn btn-pri size01" style="display:inline-block;cursor:auto;">주문참여</button><br>버튼 클릭시 더욱 빠르게 배송받아보실수 있습니다.</div><div style="margin-top:20px;">진행 버튼 클릭시 뭉쳐야산다 게시글이 생성됩니다.</div></div></div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    // open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
                    width: 500,
                    buttons: [
                        {
                            text: "진행",
                            style: "margin-right:5px",
                            click: function(){
                                $(this).dialog("close");

                                form.submit();
                            }
                        },
                        {
                            text: "취소",
                            click: function(){
                                $(this).dialog("close");
                            }
                        }
                    ],
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




            // 주문 수량 증감
            $(".product-view-volume>button").on("click", function(){
                let inputCount = $(this).parent().find("input[name='pop_out']");
                let inputCountVal = Number(inputCount.val());
                // 상품 재고
                const productEa = 10;

                if($(this).hasClass("plus-count")){
                    if(inputCountVal < productEa){
                        inputCount.val(Number(inputCountVal)+1).trigger('change');
                    }
                }else{
                    if(inputCountVal > 1 ){
                        inputCount.val(Number(inputCountVal)-1).trigger('change');
                    }
                }
            });

        </script>
        
</html>