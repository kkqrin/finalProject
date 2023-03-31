<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>여기여기붙어라</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>제이쿼리 위젯 달력 사용하기</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        
    $( function() {
      $( "#datepicker" ).datepicker({
         dateFormat:"yy-mm-dd"
      });     
    } );
    </script>
</head>
<body>
		<div class="writeFrm-all-wrap">
	        <div class="writeFrm-wrap">
	            <div class="writeFrm-title">
	                <h1>여기여기붙어라👍</h1>
	                <h3>썸네일</h3>
	            </div>
	            <div class="writeFrm-content">
	                <form action="/boardWrite.do" method="post" enctype="multipart/from-data"">
	                    <div class="inputs-wrap">
	                        <div class="board-input-wrap">
	                            <div>
	                                <label for="id">폼제목<sup>*</sup></label>
	                            </div>
	                            <div>
	                                <input type="text" name="title" class="mid-input" id="title" required>
	                            </div>
	                        </div>
	                    </div>
	                    <div class="category-check">
	                        <div>
	                            <label for="category">카테고리<sup>*</sup></label>
	                        </div>
	                        <input type="radio" name="category" id="c" value="clothes">
	                        <label for="c">의류</label>
	                        <input type="radio" name="category" id="f" value="food">
	                        <label for="f">음식</label>
	                        <input type="radio" name="category" id="t" value="toy">
	                        <label for="c">완구</label>
	                    </div>
	                <table class="writeFrm-input-wrap">
	                    <tr>
	                        <td>계좌정보<sup>*</sup></td>
	                    </tr>
	                    <tr>
	                        <td>이름</td>
	                        <td>은행정보</td>
	                        <td>계좌번호</td>
	                    </tr>
	                    <tr>
		                    <td>
		                        <input type="text" name="accountName">
		                    </td>
		                </tr>
		                <tr>
		                    <td>
		                        <select class="selec-custom">
		                            <option value="bank1">은행명 선택</option>
		                            <option value="bank2">NH농협은행</option>
		                            <option value="bank3">KB국민은행</option>
		                            <option value="bank4">신한은행</option>
		                            <option value="bank5">우리은행</option>
		                            <option value="bank6">하나은행</option>
		                            <option value="bank7">IBK기업은행</option>
		                            <option value="bank8">부산은행</option>
		                            <option value="bank9">경남은행</option>
		                            <option value="bank10">대구은행</option>
		                            <option value="bank11">우체국</option>
		                            <option value="bank12">새마을금고</option>
		                            <option value="bank13">SC제일은행</option>
		                            <option value="bank14">광주은행</option>
		                            <option value="bank15">수협</option>
		                            <option value="bank16">전북은행</option>
		                            <option value="bank17">신협은행</option>
		                            <option value="bank18">제주은행</option>
		                            <option value="bank19">케이뱅크</option>
		                            <option value="bank20">카카오뱅크</option>
		                            <option value="bank21">토스뱅크</option>
		                            <option value="bank22">카카오뱅크(미성년자)</option>
		                            <option value="bank23">토스뱅크(미성년자)</option>
		                            <option value="bank24">씨티은행</option>
		                            <option value="bank25">KDB산업</option>
		                            <option value="bank26">은행 정보 없음</option>
		                        </select>
		                    </td>
		                </tr>
		                <tr>
		                    <td>
		                        <input type="text" name="accountNumber">
		                    </td>
		                </tr>
		                <tr>
		                    <td>판매기간<sup>*</sup></td>
		                </tr>
		                <tr>
		                   <td>폼 시작일</td>
		                   <td>종료일</td>
		                </tr>
		                <tr>
		                   <td>
	                       <input type="text" id="datepicker"  placeholder="폼 시작일">
	                       <select class="select-custom">
	                          	<option value="time-start">시</option>
	                            <c:forEach var="i" begin="0" end="23" step="1">
	                            	<option value="time-start">${i}</option>
	                            </c:forEach>
	                        </select>
	                        <select class="select-custom">
	                            <option value="time-start">분</option>
	                            <c:forEach var="i" begin="0" end="59" step="1">
	                            	<option value="time-start">${i}</option>
	                            </c:forEach>
	                        </select>
	                    	</td>
	                    </tr>
	                    <tr>
		                    <td>
		                        <input type="text" id="datepicker"  placeholder="폼 종료일">
		                        <select class="select-custom">
		                            <option value="time-start">시</option>
		                           	<c:forEach var="i" begin="0" end="23" step="1">
		                            	<option value="time-start">${i}</option>
		                            </c:forEach>
		                        </select>
		                        <select class="select-custom">
		                         	<c:forEach var="i" begin="0" end="59" step="1">
		                            	<option value="time-start">${i}</option>
		                            </c:forEach>   
		                        </select>
		                    </td>
	                    </tr>
	                    <tr>
	                        <td>상세설명<sup>*</sup></td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <textarea name="noticeContent"></textarea>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>상세정보입력<sup>*</sup><span>재고를 제외한 상품 정보는 구매 발생 전까지만 수정 가능합니다.</span></td>
	                    </tr>
	                    <tr>
	                        <td>상품명<input type="text" id="goods-name"  placeholder="상품명을 입력해 주세요"></td>
	                    </tr>
	                    <tr>
	                        <td>가격<input type="text" id="goods-price"  placeholder="가격을 입력해 주세요"></td>
	                    </tr>
	                    <tr>
	                        <td>재고<input type="text" id="goods-count"  placeholder="재고를 입력해 주세요"></td>
	                    </tr>
	                    <tr>
	                        <td>판매 상품 리스트<span>(총 1개의 상품)</span></td>
	                    </tr>
	                    <tr>
	                        <td><input type="text" id="goods-name"  placeholder="상품명">원</td>
	                    </tr>
	                    <tr>
	                        <td>공구 사이트 링크</td>
	                    </tr>
	                    <tr>
	                        <td><input type="text" id="site-link"  placeholder="공구 사이트 링크"></td>
	                    </tr>
	                    <tr>
	                        <td>배송 예정일<sup>*</sup></td>
	                    </tr>
	                    <tr>
	                        <td><input type="text" id="datepicker"  placeholder="배송을 보낼 날짜를 선택해 주세요."></td>
	                    </tr>
	                    <tr>
	                        <td>기타 문의사항</td>
	                    </tr>
	                    <tr>
	                        <td><input type="text" id="etc-content"  placeholder="문의사항 필요한 경우 작성해 주세요."></td>
	                    </tr>
		                <tr>
		                	<th><input type="submit" value="폼만들기"></th>
		                </tr>
	                </table>
	            </form>
	        </div>
	    </div>
    </div>
</body>
</html>