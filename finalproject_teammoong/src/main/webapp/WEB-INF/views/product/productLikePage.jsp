<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .flex-content{
        display: flex;
        justify-content: space-between;
    }
    .content-box{
        margin-top: 20px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e1e4e5;
    }
    .img-box{
        display: flex;
    }
    .like-product-info{
        padding-left: 20px;
        line-height: 75px;
    }
    .like-delete-btn{
        padding-top: 60px;
        margin-right: 20px;
    }
</style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="content-wrap">
		<div class="mypage-wrap">
            <jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
        <div class="mypage-right">
            <div class="mypage-right-title">내 찜 목록</div>
			<c:forEach items="${likeList }" var="i">
            <div class="content-box">
                <div class="flex-content">
                    <div class="img-box">
                        <c:forEach items="${i.fileList}" var="f">
                            <img src="/resources/upload/product/${f.filepath }" style="width: 150px; height: 150px;">
                        </c:forEach>
                        <div class="like-product-info">
                            <div class="product-name">${i.productName}</div>
                            <div class="product-price">${i.productPrice}</div>
                        </div>
                    </div>
                    <div class="like-delete-btn">
                        <button class="btn btn-white size02">삭제</button>
                        <input type="hidden" name="productNo" value="${i.productNo}">
                        <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</body>
<script>
    $(".like-delete-btn>button").on("click", function(){
        var productNo = $(this).next().eq(0).val();
        var memberNo = $(this).next().next().eq(0).val();
        console.log(memberNo);
        $.ajax({
            url : "/deleteLikeByMyLikeList.do",
            type : "post",
            data : {productNo : productNo, memberNo : memberNo},
            context : this,
            success : function(data){
                console.log(data);
                if(data == 0622){
                    location.reload();
                }
            }
        });
    });
</script>
</html>