<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	
	
	
	<!-- 필요한것만 -->
	 <div class="adminPage-sidebar">
	 	 <ul class="firstLi">
	 	 	<li><a>Welcome</a></li>
	 	 	<li><a href="/admin.do">대시보드</a></li>
	 	 </ul>
	     <ul class="firstLi">
	     	<li><a>하늘같은 우리</a></li>
	        <li><a href="/adminMemberPage.do?reqPage=1">회원 관리</a></li><!-- jsp 생성완료 -->
	     </ul>
	     <ul class="firstLi">
	         <li><a>매출 관리</a></li>
	         <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/adminCategorySalesManage.do">카테고리별 매출관리</a></li>
	     </ul>
	     <ul class="firstLi">
	         <li><a>상품 관리</a></li>
	         <li><a href="/adminTotalProductList.do?reqPage=1">등록 상품 관리</a></li><!-- jsp 생성완료 -->
	         <li><a href="/adminProductRegist.do?reqPage=1">입점 문의</a></li>
	         <li><a href="/adminDeliveryManagePage.do?reqPage=1">상품 배송 관리</a></li>
	     </ul>
	     <ul class="firstLi">
	         <li><a>결제내역 관리</a></li>
	         <li><a href="/adminDaycheckManagePage.do">뭉머니 사용내역</a></li>
	         <li><a href="/adminGongguManagePage.do">공구 포인트 사용내역</a></li>
	     </ul>
	     <ul class="firstLi">
	     	 <li><a>...</a></li>
	         <li><a href="/adminBoardManagePage.do?reqPage=1">여여붙게시판 관리</a></li><!-- jsp 생성완료 -->
	     </ul>
	 </div>
