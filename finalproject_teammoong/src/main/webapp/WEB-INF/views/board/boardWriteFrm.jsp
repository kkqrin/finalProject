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
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/board/boardWriteFrm.css" />



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
							<div class="board-wrap">
								<div class="boardFile-wrap">
									<input type="file" name="boardFile" id="bFile"
										onchange="previewImage(event)" multiple>
									<div class="image-preview"></div>
									<label for="bFile">
										<div class="btn-upload">이미지 등록<sup>*</sup></div>
									</label>
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
			                <select name="category">
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
						<td><input type="text" name="accountName" required></td>
						<td>
							<select class="select-custom" id="ui-id-1" name="accountBank" required>
							<option value="null" selected disabled hidden>은행선택</option>
							</select>
						</td>
						<td colspan="2"><input type="text" name="accountWriter"
							required></td>
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
						<td colspan="4"><textarea name="boardContent" required></textarea>
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
							name="detailPrice" placeholder="가격을 입력해 주세요" required></td>
					</tr>
					<tr class="one-goods">
						<td colspan="4"><input type="text" id="goods-count"
							name="detailCount" placeholder="재고를 입력해 주세요" required></td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="area-btn right">
								<button type="button" id="goods-plus"
									class="btn btn-border-sec size01">상품추가</button>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4">판매 상품 리스트<span>(총 1개의 상품)</span></td>
					</tr>
					<tr>
						<td colspan="4">공구 사이트 링크</td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="site-link"
							name="referenceLink" placeholder="공구 사이트 링크"></td>
					</tr>
					<tr>
						<td colspan="4">배송 예정일<sup>*</sup></td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="deldate" required>
							<input type="hidden" name="deliveryDate" required></td>
					</tr>
					<tr>
						<td colspan="4">기타 문의사항</td>
					</tr>
					<tr>
						<td colspan="4"><input type="text" id="etc-content"
							name="boardEtc" placeholder="문의사항 필요한 경우 작성해 주세요."></td>
					</tr>
				</table>
				<input class="btn btn-border-sec size01" type="submit" id="form" value="폼만들기">       
			</form>
		</div>
	</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>

	<script>
		let i = 1;
		$("#goods-plus").on(
				"click",
				function() {

					const tr0 = $('<tr>');
					const td0 = $('<td>').attr('colspan', 4);
					let count = "상품" + (i + 1);
					td0.text(count);
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
						placeholder : '가격을 입력해 주세요',
						required : true
					});
					input2.appendTo(td2);
					td2.appendTo(tr2);

					const tr3 = $('<tr>').addClass('one-goods');
					const td3 = $('<td>').attr('colspan', 4);
					const input3 = $('<input>').attr({
						type : 'text',
						id : 'goods-count',
						name : 'detailCount',
						placeholder : '재고를 입력해 주세요',
						required : true
					});
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
            jQueryAlert('warning',"썸네일을 추가 주세요!");
//     	        alert("파일을 첨부해 주세요!");
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
			}
		});
	
		
		$( function() {
			$( "[name=category]" ).selectmenu();
			$( "[name=detailCategoryNo]" ).selectmenu();
		});
		
		window.onload = function(){
			var categoryNo = $("[name=category]").val();
			$("[name=category]").empty();
            $("[name=category]").append("<option>카테고리</option>");
            $("[name=detailCategoryNo]").append("<option>세부카테고리</option>");
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
		    $("[name=detailCategoryNo]").append("<option>세부카테고리</option>");
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
		})
		
// 		$("[name='accountName']").on("change",function(){
// 				const inputAccount = $("[name='accountName']").val();
// 				const AcountReg = /[0-9-]$/;
				
// 				if(AcountReg.test(inputAccount)){
// 			        $(this).removeClass("error");
// 			        $(".caution-tr").eq(6).css("display","none");
			        
// 					const result = $(this).val().replaceAll("-","");
// 					$(this).val(result);
			        
// 			        result[5] = true;
// 				}else{
// 					$(this).addClass("error");
// 					$(".caution-tr").eq(6).css("display","table-row");
// 					$(".caution").eq(6).children().css("color","var(--secondary)");
// 					$(".caution").eq(6).html("<a>숫자를 입력해주세요</a>");
// 					result[5] = false;
// 				}
// 				if(inputAccount==""){
// 					$(this).removeClass("error");
// 					$(".caution-tr").eq(6).css("display","none");
// 					result[5] = true;
// 				}
// 			});//계좌번호 정규표현식
		
		
	</script>
<!-- 	<script src="/resources/js/modal-alert.js"></script> -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />	
</body>

</html>


