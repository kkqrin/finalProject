<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="#" method="get">
    <table border="3">
        <tr>
            <th>카테고리</th>
            <th>
                <select name="category">
                    <option value="">카테고리</option>
                    <option value="1" name="option">패션</option>
                    <option value="2" name="option">뷰티</option>
                    <option value="3">식품</option>
                    <option value="4">생활용품</option>
                    <option value="5">가전/디지털</option>
                    <option value="6">가구</option>
                    <option value="7">침구</option>
                    <option value="8">인테리어</option>
                    <option value="9">공구</option>
                    <option value="10">출산/유아동</option>
                    <option value="11">반려용품</option>
                    <option value="12">명품</option>
                    <option value="13">상품권</option>
                </select>
            </th>
            <th>
                <select name="detail-category">
                    <option value="">세부 카테고리</option>
                </select>
            </th>
        </tr>
        <tr>
            <th>상품이름</th>
            <th colspan="2"><input type="text" name="productName"></th>
        </tr>
        <tr>
            <th>상품수량</th>
            <th colspan="2"><input type="text" name="productEa"></th>
        </tr>
        <tr>
            <th>상품가격</th>
            <th colspan="2"><input type="text" name="productPrice"></th>
        </tr>
        <tr>
            <th>할인률</th>
            <th colspan="2"><input type="text" name="productPrice"></th>
        </tr>
        <tr>
            <th>상품상태</th>
            <th colspan="2"><input type="text" name="productStatus" value="1"></th>
        </tr>
        <tr>
            <th>원가격</th>
            <th colspan="2"><input type="text" name="productCost"></th>
        </tr>
        <tr>
            <th>공동구매인원수</th>
            <th  colspan="2">
                <select>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </th>
        </tr>
        <tr>
            <th>썸네일</th>
            <th colspan="2"><input type="file"></th>
        </tr>
        <tr>
            <th>상품내용</th>
            <th colspan="2"><textarea name="productContent"></textarea></th>
        </tr>
        <th colspan="3"><button type="submit">등록</button></th>
    </table>
	</form>
</body>
</html>