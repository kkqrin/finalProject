<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	 input[type=radio],input[type=checkbox]{
        width: auto;
        display: inline-block;
        min-height: auto;
        margin-left : 20px;
    }
   	label{
   		margin-right : 130px;
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
            <td>
                <select name="category">
                    <!--아작스로 카테고리 추가  -->
                </select>
            </td>
            <td>
                <select name="dCategoryNo">
                	<!--아작스로 세부 카테고리 추가  -->
                </select>
            </td>
        </tr>
        <tr>
            <th>상품이름</th>
            <td colspan="2"><input type="text" name="productName"></td>
        </tr>
        <tr>
            <th>상품수량</th>
            <td colspan="2"><input type="text" name="productEa"></td>
        </tr>
        <tr>
            <th>상품가격</th>
            <td colspan="2"><input type="text" name="productPrice"></td>
        </tr>
        <tr>
            <th>할인률</th>
            <td colspan="2"><input type="text" name="productDiscount"></td>
        </tr>
        <tr>
            <th>원가격</th>
            <td colspan="2"><input type="text" name="productCost"></td>
        </tr>
        <tr>
            <th>공동구매인원수</th>
            <td  colspan="2">
<!--                 <select name="gongguNumber"> -->
<!--                     <option value="2">2</option> -->
<!--                     <option value="3">3</option> -->
<!--                     <option value="4">4</option> -->
<!--                     <option value="5">5</option> -->
<!--                 </select> -->
				<div style="text-align : left;"> 
                <input type="radio" id="two" name="gongguNumber" value="2">
                <label for="two">2명</label>
                <input type="radio" id="three" name="gongguNumber" value="3">
                <label for="three">3명</label>
                <input type="radio" id="four" name="gongguNumber" value="4">
                <label for="four">4명</label>
                <input type="radio" id="five" name="gongguNumber" value="5">
                <label for="five">5명</label>
                </div>
            </td>
        </tr>
        <tr>
            <th>썸네일</th>
            <td colspan="2"><input type="file" name="productFile" multiple></td>
        </tr>
        <tr>
            <th>상품내용</th>
            <td colspan="2"><textarea name="productContent" id="summernote"></textarea></td>
        </tr>
        <tr>
        <th colspan="3"><div class="area-btn full"><button class="btn btn-pri size01" type="submit">등록</button></div></th>
        </tr>
        <tr>
        <th colspan="3"><div class="area-btn full"><button class="btn btn-sec size01" type="button">취소</button></div></th>
        </tr>
    </table>
            <input type="hidden" name="productStatus" value="1">
	</form>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<script>
	$( function() {
		$( "[name=category]" ).selectmenu();
		$( "[name=dCategoryNo]" ).selectmenu();
		$("[name=gonggu-number]").selectmenu();
	});
    var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
        
		
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}


	
		window.onload = function(){
			var categoryNo = $("[name=category]").val();
			$("[name=category]").empty();
            $("[name=category]").append("<option>카테고리</option>");
            $("[name=dCategoryNo]").append("<option>세부카테고리</option>");
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
		    $("[name=dCategoryNo]").empty();
		    $("[name=dCategoryNo]").append("<option>세부카테고리</option>");
		    $.ajax({
		    	url : "/selectDetailCategory.do",
		    	type : "POST",
		    	dataType : "JSON",
		    	data : {categoryNo : $("[name=category]").val()},
		    	success : function(data){
		    		console.log(data)
		    		for(var i=0; i<data.length; i++){
			    		$("[name=dCategoryNo]").append("<option value="+data[i].detailCategoryNo+">"+data[i].detailCategoryName+"</option>");
			    		}
// 		    		select메뉴 비우는 코드
		    		$( "[name=dCategoryNo]" ).selectmenu("refresh");
		    		$( "[name=dCategoryNo]" ).selectmenu();
	    		},
		    });
		});
		$("[name=dCategoryNo]").on("selectmenuchange",function(){
			console.log($(this).val());
		})
		
	</script>
</body>
</html>