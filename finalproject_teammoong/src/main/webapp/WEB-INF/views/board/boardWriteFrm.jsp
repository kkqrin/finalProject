<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여기여기붙어라</title>


    <!-- 슬릭 슬라이더 제이쿼리 -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <!-- 슬릭 슬라이더 -->
<link rel="stylesheet" href="/resources/slick/slick-theme.css"/>
<link rel="stylesheet" href="/resources/slick/slick.css"/>
    <!-- 슬라이더 화살표 아이콘 arrow -->
	<script src="https://kit.fontawesome.com/285f888d1c.js" crossorigin="anonymous"></script>
<style>
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
</style>

<script>
	    function previewImage(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.createElement('img');
			output.src = reader.result;
			output.style.maxWidth = '250px';
			output.style.maxHeight = '250px';
			document.querySelector('.image-preview').innerHTML = '';
			document.querySelector('.image-preview').appendChild(output);
		};
		reader.readAsDataURL(event.target.files[0]);
	}
</script>


</head>

<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>

<link rel="stylesheet" href="/resources/css/board/boardWriteFrm.css" />
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">


	<div class="content-wrap">
		<div class="content-board-wrap">
			<form action="/boardWrite.do" method="post"
				enctype="multipart/form-data">
				<table class="writeFrm-input-wrap">
					<tr>
						<td colspan="4"><input type="hidden" name="boardWriter"
							value="${sessionScope.m.memberId }"></td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="board-wrap" style="height: 400px;">
								<div class="boardFile-wrap">
									<input type="file" name="boardFile" id="bFile"
										onchange="previewImage(event)" multiple >
									<div class="image-preview"></div>
									<label for="bFile">
										<div class="btn-upload">이미지 등록<sup>*</sup></div>
									</label>
									<div class="responsive">
										<div class="img-sub-wrap" style="width: 150px; height: 50px; margin-top: 20px;">
										</div>
									</div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">폼제목<sup>*</sup></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" name="boardName"
							class="mid-input" id="title" required></td>
					<tr>
					<tr>
			            <td colspan="2">카테고리<sup>*</sup></td>
			            <td>
			                <select name="category" required>
			                    <!--아작스로 카테고리 추가  -->
			                </select>
			            </td>
			            <td>
			                <select name="detailCategoryNo">
			                	<!--아작스로 세부 카테고리 추가  -->
			                </select>
			            </td>
			        </tr>
					<tr>
						<td colspan="4">계좌정보<sup>*</sup></td>
					</tr>
					<tr>
						<td colspan="1">이름</td>
						<td colspan="1">은행정보</td>
						<td colspan="2">계좌번호</td>
					</tr>
					<tr>
						<td colspan="1" ><input type="text" name="accountName" style="height: 40px;" required placeholder="이름을 입력해주세요"><span class="comment"></span></td>
						<td colspan="1">
							<select class="select-custom" id="ui-id-1" name="accountBank" required>
							<option value="null" selected disabled hidden>은행선택</option>
							</select>
						</td>
						<td colspan="2"><input type="text" name="accountWriter"
							required style="height: 40px;" placeholder="계좌번호를 입력하세요('-'없이)"><span class="caution"></span>
						</td>
					</tr>
					<tr>
						<td colspan="4">폼 시작/종료<sup>*</sup></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="daterangepicker"
							required> <input type="hidden" name="boardStart">
							<input type="hidden" name="boardEnd"></td>
					</tr>
					<tr>
						<td colspan="4">상세설명<sup>*</sup></td>
					</tr>
					<tr>
						<td colspan="4"><textarea id="boardContent" name="boardContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">상세정보입력<sup>*</sup><span>재고를 제외한 상품 정보는
								구매 발생 전까지만 수정 가능합니다.</span></td>
					</tr>
					<tr>
						<td colspan="4">상품1</td>
					</tr>
					<tr class="one-goods">
						<td colspan="4"><input type="text" id="goods-name"
							name="detailName" placeholder="상품명을 입력해 주세요" required></td>
					</tr>
					<tr class="one-goods">
						<td colspan="4"><input type="text" id="goods-price"
							name="detailPrice" placeholder="가격을 입력해 주세요(숫자만!)" required><span class="caution"></span></td>
					</tr>
					<tr class="one-goods">
						<td colspan="4"><input type="text" id="goods-count"
							name="detailCount" placeholder="재고를 입력해 주세요(숫자만!)" required><span class="cautionn"></span></td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="area-btn right">
								<button type="button" id="goods-plus"
									class="btn btn-pri size01">상품추가</button>
								
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">배송 예정일<sup>*</sup></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="deldate" required>
							<input type="hidden" name="deliveryDate" required></td>
					</tr>
				</table>
				<input class="btn btn-border-sec size01" type="submit" id="form" value="폼만들기">       
			</form>
		</div>
	</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>

<script type="text/javascript" src="/resources/slick/slick.min.js"></script>
	<script>
	
	
	let sel_files = [];
	$(document).ready(function(){
		$("#bFile").on("change", function(e){
			let files = e.target.files;
			let filesArr = Array.prototype.slice.call(files);
// 			if($("#bFile")[0].files.length > 8){
// 				alert("상품이미지는 8개 이하만 첨부 가능합니다.");
// 				return false;
// 			}
			filesArr.forEach(function(f){
				$(".img-sub-wrap").html("");
				let img = [];
				sel_files.push(f);
				const reader = new FileReader();
				reader.onload = function(e){
					img.push("<img style='width:50px;height:50px;'src=\""+e.target.result+"\" /><div class='material-symbols-outlined delete-img'style='position: absolute; bottom: 0;' onclick='delImg(this)'>close</div>");
					const div = $("<div class='img-sub'></div>");
					div.append(img);
					$(".img-sub-wrap").append(div);
					//슬릭 부분
					if( $('.img-sub-wrap').hasClass('slick-initialized') ){

						$('.img-sub-wrap').slick('unslick');//슬릭해제

						}
					$(".img-sub-wrap").slick({
						
						slidesToShow: 3,
						  slidesToScroll: 3
					});
					
				}
			reader.readAsDataURL(f);
			});
		});
	});
	
	
	
	function delImg(obj){
		const index = $(".delete-img").index($(obj));
		console.log(index);
		
		const dataTransfer = new DataTransfer();
		let files = $("#bFile")[0].files;
		let fileArray = Array.from(files);
		fileArray.splice(index, 1);
		
		fileArray.forEach(function(file, items){
			dataTransfer.items.add(file);
		});
		
		$("#bFile")[0].files = dataTransfer.files;
	
		$(obj).parent().remove();
	}
	
	
	
	let result = [false, false, false, false]; //정규표현식 검사
	// 0 : 데이터피커, 1:배송시작데이터피커,
		
		
		let i = 1;
		$("#goods-plus").on(
				"click",
				function() {
					
// 					const minusBtn = $('<button>');
// 					minusBtn.text('상품삭제');
// 					minusBtn.addClass('btn minBtn btn-border-sec size01 ');
// 					$("#goods-plus").after(minusBtn);
// 					minusBtn.css('display','inline-block');
					
					const minusBtn = $('<span>');
					minusBtn.addClass('material-symbols-outlined');
					minusBtn.text('delete_forever');
					$("#goods-plus").after(minusBtn);
					minusBtn.css('font-size','25px');
					minusBtn.css('color','darkorange');
					minusBtn.on("click",function(){
						$(this).parent().parent().next().next().next().empty();
						$(this).parent().parent().next().next().empty();
						$(this).parent().parent().next().empty();
						$(this).parent().parent().empty();
					});
				
// 					<span class="material-symbols-outlined" id="goods-minus" style="text-align: left; font-size: 40px;">
// 					delete_forever
// 				</span>
				
					
					const tr0 = $('<tr>');
					const td0 = $('<td>').attr('colspan', 4);
					let count = "상품" + (i + 1);
					td0.append(count);
					td0.append(minusBtn);
					td0.appendTo(tr0);
					i++;

					
					
					
					const tr = $('<tr>').addClass('one-goods');
					const td = $('<td>').attr('colspan', 4);
					const input = $('<input>').attr({
						type : 'text',
						id : 'goods-name',
						name : 'detailName',
						placeholder : '상품명을 입력해주세요',
						required : true
					});
					input.appendTo(td);
					td.appendTo(tr);

					const tr2 = $('<tr>').addClass('one-goods');
					const td2 = $('<td>').attr('colspan', 4);
					const input2 = $('<input>').attr({
						type : 'text',
						id : 'goods-price',
						name : 'detailPrice',
						placeholder : '가격을 입력해 주세요(숫자만!)',
						required : true
					});
					input2.appendTo(td2);
					input2.on("keyup",function(){
						const detailPrice = $(this).val();
						const caution = $(this).next();
						priceCheck(detailPrice,caution);
					});
					td2.appendTo(tr2);
					
					const cautionSpan = $("<span class='caution'>");
					input2.after(cautionSpan);

					const tr3 = $('<tr>').addClass('one-goods');
					const td3 = $('<td>').attr('colspan', 4);
					const input3 = $('<input>').attr({
						type : 'text',
						id : 'goods-count',
						name : 'detailCount',
						placeholder : '재고를 입력해 주세요(숫자만!)',
						required : true
					});
					input3.appendTo(td3);
					input3.on("keyup",function(){
						const detailPrice = $(this).val();
						const caution = $(this).next();
						priceCheck(detailPrice,caution);
					});
					td3.appendTo(tr3);
					
					const cautionSpann = $("<span class='cautionn'>");
					input3.after(cautionSpann);
					
					input3.appendTo(td3);
					td3.appendTo(tr3);
					$("#goods-plus").parent().parent().parent().before(tr0)
							.before(tr).before(tr2).before(tr3);

					/*
					<tr class="one-goods"></tr>
					
					const goodsPrice = $("[name=detailPrice]").val()
					const goodsPrice2 = $("[name=detailCount]").val()
					const result = goodsPrice*goodsPrice2;
					$("[name=boardPrice]").val(result);
					console.log($("[name=boardPrice]").val());
					 */

				});
		</script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script>
		$("#daterangepicker").daterangepicker();

		$("#daterangepicker").daterangepicker(
				{
					locale : {
						"separator" : " ~ ", // 시작일시와 종료일시 구분자
						"format" : 'YYYY-MM-DD', // 일시 노출 포맷
						"applyLabel" : "확인", // 확인 버튼 텍스트
						"cancelLabel" : "취소", // 취소 버튼 텍스트
						"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ]
					},
					//timePicker: true,                        // 시간 노출 여부
					showDropdowns : true, // 년월 수동 설정 여부
					autoApply : true, // 확인/취소 버튼 사용여부
					timePicker24Hour : true, // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
				//timePickerSeconds: true,                 // 초 노출 여부
				},
				function(start, end, label) {
// 					console.log(start.format('YYYY-MM-DD'), end
// 							.format('YYYY-MM-DD'));
					var boardStart = start.format('YYYY-MM-DD');
					var boardEnd = end.format('YYYY-MM-DD');
					
					result[0] = true;
					console.log(boardStart);
					console.log(boardEnd);
					
					//input hidden 날짜 값 넣어서 디비로 보내기
					$("[name=boardStart]").val(boardStart);
					$("[name=boardEnd]").val(boardEnd);
				});

		$("#daterangepicker").on('show.daterangepicker', function(ev, picker) {
			$(".yearselect").css("float", "left");
			$(".monthselect").css("float", "right");
			$(".cancelBtn").css("float", "right");
		});
		
		
		

		$("#deldate").daterangepicker();

		$("#deldate").daterangepicker(
			{
		locale : {
						"separator" : " ~ ", // 시작일시와 종료일시 구분자
						"format" : 'YYYY-MM-DD', // 일시 노출 포맷
						"applyLabel" : "확인", // 확인 버튼 텍스트
						"cancelLabel" : "취소", // 취소 버튼 텍스트
						"daysOfWeek" : [ "일", "월", "화", "수", "목", "금", "토" ],
						"monthNames" : [ "1월", "2월", "3월", "4월", "5월", "6월",
								"7월", "8월", "9월", "10월", "11월", "12월" ]
					},
					showDropdowns : true, // 년월 수동 설정 여부
					autoApply : true, // 확인/취소 버튼 사용여부
					timePicker24Hour : true, // 24시간 노출 여부(ex> true : 23:50, false : PM 11:50)
					timePickerSeconds: true,                 // 초 노출 여부
					singleDatePicker : true,
					minDate : moment()
					
					// 하나의 달력 사용 여부
					},

				function(start, label) {
					result[1]=true;
					console.log(start.format('YYYY-MM-DD'));
					const deliveryDate = start.format('YYYY-MM-DD');
					//input hidden 날짜 값 넣어서 디비로 보내기
					$("[name=deliveryDate]").val(deliveryDate);
				});

		$("#deldate").on('show.daterangepicker', function(ev, picker) {
			$(".yearselect").css("float", "left");
			$(".monthselect").css("float", "right");
			$(".cancelBtn").css("float", "right");
		});
		
// 	$("#form").on("click",function(){
// 		const fileCheck = $("#bFile").val();
// 	    if(!fileCheck){
// 	        alert("파일을 첨부해 주세요!");
// 	        return false;
// 	    }		
// 	});
		
	
	
	//알림 관련 기능
    $(function () {
        $("#alert01").on("click", function () {
            jQueryAlert('success',"성공내용성공내용성공내용");
        });
        $("#form").on("click", function () {
    		const fileCheck = $("#bFile").val();
    	    if(!fileCheck){
            jQueryAlert('warning',"이미지를 추가 해주세요!");
//     	        alert("파일을 첨부해 주세요!");
    	        return false;
    	    }	
        });

		$(".content-board-wrap>form").submit(function (e) {
			if($("[name=detailCategoryNo]").val() == 0){
				// console.log("하하하하00000000000");
				optionjQueryAlert('info', '카테고리를 선택해주세요!');

				e.preventDefault();
				return false;
			}
			if($("[name=category]").val() == 0){
				//console.log("00상상상000000000");
				optionjQueryAlert('info', '카테고리를 선택해주세요!');

				e.preventDefault();
				return false;
			}

			if(!result[0]){
				// optionjQueryAlert('info');
				// alert("데이터피커1");
				optionjQueryAlert('info', '날짜를 선택해주세요!');

				// 폼 제출 막음
				e.preventDefault();
				return false;
			}else if(!result[1]){
				// optionjQueryAlert('info');
				// alert("데이터피커2");
				optionjQueryAlert('info', '날짜를 선택해주세요!');

				// 폼 제출 막음
				e.preventDefault();
				return false;
			}				

			if ($('#boardContent').summernote('isEmpty')) {
				optionjQueryAlert('info', '상세설명을 입력해주세요!');

				e.preventDefault();
				return false;
			}
		});











        $("#alert03").on("click", function () {
            jQueryAlert('warning',"경고내용경고내용경고내용경고내용");
        });
        $("#alert04").on("click", function () {
            jQueryAlert('info',"정보내용정보내용정보내용정보내용");
        });

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
    
    });
	
    
		const accountBank = [ "NH농협은행", "KB국민은행", "신한은행", "우리은행", "하나은행",
				"IBK기업은행", "부산은행", "경남은행", "대구은행", "우체국은행", "새마을금고", "SC제일은행",
				"광주은행", "수협", "전북은행", "신협은행", "제주은행", "케이뱅크", "카카오뱅크", "토스뱅크",
				"카카오뱅크(미성년자)", "토스뱅크(미성년자)", "씨티은행", "KDB산업" ];

		function makeBankList() {
			for (let i = 0; i < accountBank.length; i++) {
				let option = "<option value="+accountBank[i]+">" + accountBank[i]
						+ "</option>";
				$("[name='accountBank']").append(option);
			}
		}

		makeBankList();
		
		$("[name='boardName']").keyup(function(){
			let inputName = $(this).val().length;
			console.log(inputName);
			if(inputName > 65) {
				alert("입력가능한 글자가 초과되었습니다.");
				// result[0]=false;
			}
		});//제목 정규표현식
		
		$("[name = detailPrice]").keyup(function(){
			
			const detailPrice = $(this).val();
			const caution = $(this).next();
			
			priceCheck(detailPrice,caution);
			
		});
		
		
	function priceCheck(inputDetailPrcie,caution){
		const DetailPriceReg = /^[0-9]+$/;
		
		if(DetailPriceReg.test(inputDetailPrcie)){
			$(this).removeClass("error");
			caution.css("display","none");
		}else{
			$(this).addClass("error");
			caution.css("display","block");
			caution.css("color","var(--secondary)");
			caution.html("<a>숫자만 입력해주세요</a>");
			// result[2] = false;
		}
		if(inputAccount==""){
			$(this).removeClass("error");
			caution.html("");
			// result[2] = true;
		}
	}		

	$("[name = detailCount]").keyup(function(){

		const inputDetailCount = $("[name=detailCount]").val();
		const DetailCountReg = /^[0-9]+$/;
		
		if(DetailCountReg.test(inputDetailCount)){
			$(this).removeClass("error");
			$(".caution").css("display","none");
		}else{
			$(this).addClass("error");
			$(".cautionn").css("display","block");
			$(".cautionn").css("color","var(--secondary)");
			$(".cautionn").html("<a>숫자만 입력해주세요</a>");
			// result[2] = false;
		}
		if(inputDetailCount==""){
			$(this).removeClass("error");
			$(".cautionn-tr").eq(0).css("display","none");
			// result[2] = true;
		}
	});
	
// 		$("[name='accountName']").on("change",function(){
// 		    const nameReg = /^[가-힣]{1,}$/;
// 		    const nameValue = $(this).val();
// 		    if(nameReg.test(nameValue)){
// 		        result[1] = true;
// 		    }else{
// 		        $(this).next().text("1글자이상(한글)입력가능합니다.")
// 		        $(this).next().css("color","var(--secondary)");
// 		        result[1] = false;
// 		    }
// 		});//계좌 이름 정규표현식
		
		$("[name='accountWriter']").keyup(function(){
			const inputAccount = $("[name='accountWriter']").val();
			const AcountReg = /^[0-9]+$/;
			
			const inputAccount2 = $(this).val().replaceAll("-","");
			$(this).val(inputAccount2);
			
			if(AcountReg.test(inputAccount)){
		        $(this).removeClass("error");
		        $(".caution").css("display","none");
		        // result[2] = true;
			}else{
				$(this).addClass("error");
				$(".caution").css("display","block");
				$(".caution").css("color","var(--secondary)");
				$(".caution").html("<a>숫자를 입력해주세요</a>");
				// result[2] = false;
			}
			if(inputAccount==""){
				$(this).removeClass("error");
				$(".caution-tr").eq(0).css("display","none");
				// result[2] = true;
			}
		});//계좌번호 정규표현식
	
		
		
		
		window.onload = function(){
			var categoryNo = $("[name=category]").val();
			$("[name=category]").empty();
            $("[name=category]").append("<option value='0'>카테고리</option>");
            $("[name=detailCategoryNo]").append("<option value='0'>세부카테고리</option>");
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
		    $("[name=detailCategoryNo]").empty();
		    $("[name=detailCategoryNo]").append("<option value='0'>세부카테고리</option>");
		    $.ajax({
		    	url : "/selectDetailCategory.do",
		    	type : "POST",
		    	dataType : "JSON",
		    	data : {categoryNo : $("[name=category]").val()},
		    	success : function(data){
		    		console.log(data)
		    		for(var i=0; i<data.length; i++){
			    		$("[name=detailCategoryNo]").append("<option value="+data[i].detailCategoryNo+">"+data[i].detailCategoryName+"</option>");
			    		}
// 		    		select메뉴 비우는 코드
		    		$( "[name=detailCategoryNo]" ).selectmenu("refresh");
		    		$( "[name=detailCategoryNo]" ).selectmenu();
	    		},
		    });
		});
		$("[name=detailCategoryNo]").on("selectmenuchange",function(){
			console.log($(this).val());
		});
		

		
		$("#boardContent").summernote({
				height : 550,
				lang : "ko-KR",
				toolbar: [
				    // 글꼴 설정
				    ['fontname', ['fontname']],
				    // 글자 크기 설정
				    ['fontsize', ['fontsize']],
				    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
				    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
				    // 글자색
				    ['color', ['forecolor','color']],
				    // 표만들기
				    ['table', ['table']],
				    // 글머리 기호, 번호매기기, 문단정렬
				    ['para', ['ul', 'ol', 'paragraph']],
				    // 줄간격
				    // 코드보기, 확대해서보기, 도움말
				    ['view', ['codeview','fullscreen', 'help']]
				  ],
				callbacks : {
					onImageUpload : function(files) {
						uploadImage(files[0], this)
					}
		
					
				}
			});


			// 	jqueryAlert
			function optionjQueryAlert(type, msg) {
                let $type = type;
                let messageBox = msg;
                switch ($type) {
                    case 'info':
                    messageBox = $.parseHTML('<div class="alert__info" style="line-height:100px;text-align:center;"><div class="title" style="margin-bottom:10px;color:var(--info);padding:0;">뭉쳐야산다</div><br>'+msg+'</div>');
                    break;
                }
                $("body").append(messageBox);
                $(messageBox).dialog({
                    dialogClass :$type,
                    // open: $(messageBox).append(msg),
                    draggable: false,
                    modal: true,
					width: 500,
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
















			
		//이미지 프리뷰
// 		$('.responsive').slick({
// 			  dots: true,
// 			  infinite: false,
// 			  speed: 300,
// 			  slidesToShow: 4,
// 			  slidesToScroll: 4,
// 			  responsive: [
// 			    {
// 			      breakpoint: 1024,
// 			      settings: {
// 			        slidesToShow: 3,
// 			        slidesToScroll: 3,
// 			        infinite: true,
// 			        dots: true
// 			      }
// 			    },
// 			    {
// 			      breakpoint: 600,
// 			      settings: {
// 			        slidesToShow: 2,
// 			        slidesToScroll: 2
// 			      }
// 			    },
// 			    {
// 			      breakpoint: 480,
// 			      settings: {
// 			        slidesToShow: 1,
// 			        slidesToScroll: 1
// 			      }
// 			    }
// 			    // You can unslick at a given breakpoint now by adding:
// 			    // settings: "unslick"
// 			    // instead of a settings object
// 			  ]
// 			});
	
		
 	</script>
	
	
	    <!--jquery ui .js-->
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
	 <script>
	 $( function() {
			$( "[name=category]" ).selectmenu();
			$( "[name=detailCategoryNo]" ).selectmenu();
			$("[name='accountBank']").selectmenu();
		});
	 </script>
		 
	<script src="/resources/js/modal-alert.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>

</html>


