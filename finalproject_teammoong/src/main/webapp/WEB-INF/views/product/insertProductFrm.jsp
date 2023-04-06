<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<style>
	.note-editable{
		text-align: left;
		background-color: #fff;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<div class="content-wrap">
    <form action="/insertProduct.do" method="post" enctype="multipart/form-data">
    <table border="3">
        <tr>
            <th>카테고리</th>
            <th>
                <select name="category">
                    <!--아작스로 카테고리 추가  -->
                </select>
            </th>
            <th>
                <select name="detail-category">
                	<!--아작스로 세부 카테고리 추가  -->
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
                <select name="gonggu-number">
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </th>
        </tr>
        <tr>
            <th>썸네일</th>
            <th colspan="2"><input type="file" multiple></th>
        </tr>
        <tr>
            <th>상품내용</th>
            <th colspan="2"><textarea name="productContent"></textarea></th>
        </tr>
        <tr>
        <th colspan="3"><div class="area-btn full"><button class="btn btn-pri size01" type="button">등록</button></div></th>
        </tr>
        <tr>
        <th colspan="3"><div class="area-btn full"><button class="btn btn-sec size01" type="button">취소</button></div></th>
        </tr>
    </table>
	</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	$( function() {
		$( "[name=category]" ).selectmenu();
		$( "[name=detail-category]" ).selectmenu();
		$("[name=gonggu-number]").selectmenu();
	});
		$("[name=productContent]").summernote({
			height : 550,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					uploadImage(files[0], this)
				}
				
			}
		});
		window.onload = function(){
			var categoryNo = $("[name=category]").val();
			$("[name=category]").empty();
            $("[name=category]").append("<option>카테고리</option>");
            $("[name=detail-category]").append("<option>세부카테고리</option>");
		    $.ajax({
		    	url : "/selectAllCategory.do",
		    	type : "POST",
		    	dataType : "JSON",
		    	success : function(values){
		    		console.log(values)
		    		for(var i=0; i<values.length; i++){
		    		$("[name=category]").append("<option value="+[i+1]+">"+values[i].categoryName+"</option>");
		    		}
		    	},
		    });
	    }
		$("[name=category]").on("selectmenuchange",function(){
		    $("[name=detail-category]").empty();
		    $("[name=detail-category]").append("<option>세부카테고리</option>");
		    $.ajax({
		    	url : "/selectDetailCategory.do",
		    	type : "POST",
		    	dataType : "JSON",
		    	data : {categoryNo : $("[name=category]").val()},
		    	success : function(data){
		    		console.log(data)
		    		for(var i=0; i<data.length; i++){
			    		$("[name=detail-category]").append("<option value="+data[i].dcategoryNo+">"+data[i].dcategoryName+"</option>");
			    		}
		    		
	    		},
		    });
		});
		$("[name=detail-category]").on("selectmenuchange",function(){
			console.log($(this).val());
		})
		
	</script>
</body>
</html>