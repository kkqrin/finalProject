<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
<style>
  .custom-file-upload {
    display: inline-block;
    padding: 6px 12px;
    cursor: pointer;
    background-color: #fff;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    line-height: 1.5;
    color: #555;
  }

  .custom-file-upload input[type="file"] {
    display: none;
  }
  .content-all{
  	
  }
  .main-content{
  	padding-top: 30px; 
  }
    #drop-zone {
    width: 300px;
    height: 50px;
    border: 2px dashed #ccc;
    border-radius: 20px;
    text-align: center;
    font-size: 15px;
    font-weight: bold;
    margin: 20px auto;
    line-height: 50px;
    cursor: pointer;
  }
  #drop-zone.dragover {
    background-color: #eee;
  }
  #file-names {
    margin-top: 20px;
  }
  #file-names p {
    margin: 0;
  }
  #file-names button {
    margin-left: 10px;
  }
  .category-box{
  	display : flex;
  	flex-wrap: wrap;
  	gap: 18px;
  	width: 90%;
  }
  .star{
  	color : red;
  	
  }
</style>
</head>
<body>
	<div class="content-wrap">
		<div class="content-all">
		<h3>입점문의</h3>
		<p class="bold">*목적에 맞지 않는 광고, 홍보글은 사전 통보 없이 삭제 조치될 수 있음을 안내드립니다.</p>
		<P class="star bold">* 필수입력 항목</P>
			<form action="/askItem.do" method="post" enctype="multipart/form-data" id="askItemFrm">
				<table class="tbn-box">
					<tr>
						<th style="width:30%;"><sup class="star">*</sup>사업장명</th>
						<td>
							<input type="text" name="corpName" class="input-basic" placeholder="회사명을 입력해주세요" required>
						</td>
					</tr>
					<tr>
						<th><sup class="star">*</sup>사업자등록번호(필수)</th>
						<td>
							<div class="regDiv">
								<input type="text" name="regNo" class="input-basic" placeholder="사업자번호를 조회해주세요" required readonly>
							</div>
							<button type="button" id="regNoCheck" class="btn btn-border-pri size01" data-modal="#modalBasic">조회</button>		
						</td>
					</tr>
					<tr>
						<th><sup class="star">*</sup>대표자명</th>
						<td>
							<input type="text" name="repName" class="input-basic" placeholder="대표자 성함을 입력해주세요" required>
						</td>
					</tr>
					<tr>
						<th><sup class="star">*</sup>사업장 주소</th>
						<td>
							<button type="button" id="addrCheck" class="btn btn-border-pri size01">주소조회</button>		
							<div class="addrDiv">
								<input type="text" name="corpAddr1" class="input-basic" placeholder="사업장 주소" required readonly>
								<input type="text" name="corpAddr2" class="input-basic" placeholder="사업장 상세주소" >
							</div>
						</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>
							<input type="text" name="corpType" class="input-basic" placeholder="업태을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>종목</th>
						<td>
							<input type="text" name="corpItem" class="input-basic" placeholder="종목을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th><sup class="star">*</sup>담당자명</th>
						<td>
							<input type="text" name="contName" class="input-basic" placeholder="담당자 성함을 입력해주세요" required>
						</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>
							<input type="text" name="depart" class="input-basic" placeholder="부서를 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>직함</th>
						<td>
							<input type="text" name="positionJob" class="input-basic" placeholder="직함을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>연락처</th>
						<td>
							<input type="text" name="contPhone" class="input-basic" placeholder="연락처를 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>담당자메일</th>
						<td>
							<input type="text" name="contMail" class="input-basic" placeholder="메일을 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>홈페이지 주소</th>
						<td>
							<input type="text" name="homepage" class="input-basic" placeholder="홈페이지 주소를 입력해주세요">
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<div class="category-box">
								<input type="checkbox" name="categoryName" id="1" value="패션">
								<label for="1">패션</label>
								<input type="checkbox" name="categoryName" id="2" value="뷰티">
								<label for="2">뷰티</label>
								<input type="checkbox" name="categoryName" id="3" value="식품">
								<label for="3">식품</label>
								<input type="checkbox" name="categoryName" id="4" value="생활용품">
								<label for="4">생활용품</label>
								<input type="checkbox" name="categoryName" id="5" value="가전/디지털">
								<label for="5">가전/디지털</label>
								<input type="checkbox" name="categoryName" id="6" value="가구">
								<label for="6">가구</label>
								<input type="checkbox" name="categoryName" id="7" value="침구">
								<label for="7">침구</label>
								<input type="checkbox" name="categoryName" id="8" value="인테리어">
								<label for="8">인테리어</label>
								<input type="checkbox" name="categoryName" id="9" value="공구">
								<label for="9">공구</label>
								<input type="checkbox" name="categoryName" id="10" value="스포츠/레저/취미">
								<label for="10">스포츠/레저/취미</label>
								<input type="checkbox" name="categoryName" id="11" value="출산/유아동">
								<label for="11">출산/유아동</label>
								<input type="checkbox" name="categoryName" id="12" value="반려용품">
								<label for="12">반려용품</label>
								<input type="checkbox" name="categoryName" id="13" value="명품관">
								<label for="13">명품관</label>
								<input type="checkbox" name="categoryName" id="14" value="기타(etc)">
								<label for="14">기타(etc)</label>
							</div>
						</td>
					</tr>
					<tr>
						<th>
							<label for="file"><sup class="star">*</sup>사업자등록증 첨부</label>
						</th>
						<td>
							<div id="drop-zone">
      							<label for="fileUpload">파일을 여기에 끌어다 놓거나 클릭하세요.</label>
    						</div>
    						<input type="file" name="askItemFile" id="fileUpload" multiple style="display: none" />
    						<div id="file-names">
    						</div>
    					</td>
					</tr>
					<tr>
						<th><sup class="star">*</sup>제목</th>
						<td>
							<input type="text" name="askTitle" class="input-basic" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea id="askContent" cols="30" rows="20" name="askContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="area-btn center">
								<button type="button" onclick="submitAskItemForm()" class="btn btn-border-pri size02">저장</button>
								<a href="/main.do" class="btn btn-border-black size02">취소</a>
							</div>
						</td>
					</tr>
				</table>
			</form>
			<div class="area-btn left" style="display:none;">
                <button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
				<button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
                <button class="btn btn-border-ter size01" type="button" id="alert03">경고</button>
                <button class="btn btn-border-black size01" type="button" id="alert04">정보</button>
           </div>
			<div id="modalBasic" class="modal modal-sec">
            	<div class="modal-content">
                	<div class="modal-header">
                    	<h6>사업자등록번호 조회</h6>
                    </div>
                    <div class="modal-body">
                    	<!--내용영역-->
                        <input type="text" name="checkRegNo" id="checkRegNo" placeholder="'-'없이 입력해주세요">
                        <span id="resultMsg"></span>
                        <button type="button" id="checkRegBtn" class="btn btn-sec size01">조회</button>
                        <!--//내용영역-->
                   	</div>
                    <div class="area-btn right">
                    	<button class="btn btn-pri size01" type="button" id="regInsertBtn">적용</button>
                        <a href="" rel="modal:close" class="btn btn-sec size01" onclick="resetInput()" id="close">닫기</a>
                    </div>
                </div>
            </div>
		</div>
	</div>
	<script>
	$("#addrCheck").on("click",function(){
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$("[name='corpAddr1']").val(data.address);
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	        }
	    }).open();
		if($("[name='corpAddr1']").val()==!""){
			alert("gd");
		}
	});
	$("#askContent").summernote({
		height : 550,
		lang : "ko-KR",
		callbacks : {
			onImageUpload : function(files) {
				uploadImage(files[0], this)
			}
			
		}
	});
	function uploadImage(file, editor) {
	    const form = new FormData();
	    form.append("imageFile", file);
	    console.log(file);
	    $.ajax({
	        url: "/uploadAskItemImage.do",
	        type: "post",
	        data: form,
	        processData: false,
	        contentType: false,
	        success: function(data) {
	        	console.log(data);
	            $(editor).summernote("insertImage", data);
	        }
	    });
	}
	$(function () {
        $('[data-modal]').click(function (event) {
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
        $("#regInsertBtn").hide();
    });
	$(function(){
		$("#checkRegNo").keypress(function(e){
			if(e.keyCode == 13){
				$("#checkRegBtn").click();
			}
		});
	});
	function resetInput() {
        $('#checkRegNo').val('');
        $("#regInsertBtn").hide();
        $("#resultMsg").text("");
    }
	
	$("#checkRegBtn").on("click",function(){
	    const checkRegNo = $("#checkRegNo").val();
	    var data = {
	    	    "b_no": [checkRegNo]
	    	};

	    $.ajax({
	    	  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=gEalERG7TYUJsrURLYKBhpx2leSDiLwJcRmQ3biM8pkh%2F3xO5uUxndYGXTyexgkwtd4ZgnAaM4vw81EpriD29A%3D%3D",
	    	  type: "POST",
	    	  data: JSON.stringify(data),
	    	  dataType: "JSON",
	    	  contentType: "application/json",
	    	  accept: "application/json",
	    	  success: function(result) {
	    	      console.log(result.data[0].tax_type);
	    	      const resultText = result.data[0].tax_type
					if(resultText == "국세청에 등록되지 않은 사업자등록번호입니다."){
						$("#resultMsg").text("유효하지 않은 사업자입니다.");
						$("#resultMsg").css("color","red");
						$("#regInsertBtn").hide();
	    	     	}else{
    			      	$("#resultMsg").text("유효한 사업자입니다.");
    			      	$("#resultMsg").css("color","green");
    			      	$("#regInsertBtn").show();
	    	     	}
	    	  },
	    	  	error: function(result) {
	    	      console.log(result.responseText);
	    	  }
	    	}); 
	});
	$("#regInsertBtn").on("click",function(){
		const regNo = $("#checkRegNo").val();
		$('[name=regNo]').val(regNo);
		$("#close").click();
	});
	

	$(document).ready(function() {
		  $('#fileUpload').change(function() {
		    const files = $('#fileUpload')[0].files;
		    if (files.length > 0) {
		      let fileNamesWrapper = $('<div></div>');
		      for (let i = 0; i < files.length; i++) {
		        let fileDiv = $('<div></div>');
		        let fileNameSpan = $('<span></span>');
		        fileNameSpan.text(files[i].name);
		        let delBtn = $('<button type="button">삭제</button>');
		        delBtn.attr("class", "delete-file-btn");
		        fileDiv.append(fileNameSpan);
		        fileDiv.append(delBtn);
		        fileNamesWrapper.append(fileDiv);
		      }
		      $('#file-names').html(fileNamesWrapper);
		      
		    }
		  });

		  $(document).ready(function() {
			  let dropZone = $('#drop-zone');

			  dropZone.on('dragover', function(e) {
			    e.preventDefault();
			    dropZone.addClass('drag-over');
			  });

			  dropZone.on('dragleave', function(e) {
			    e.preventDefault();
			    dropZone.removeClass('drag-over');
			  });

			  dropZone.on('drop', function(e) {
			    e.preventDefault();
			    dropZone.removeClass('drag-over');
			    const files = e.originalEvent.dataTransfer.files;
			    
			    if (files.length > 0) {
			      let fileNamesWrapper = $('<div></div>');
			      let formData = new FormData();
			      for (let i = 0; i < files.length; i++) {
			    	  formData.append("askItemFile", files[i]);
			        let fileDiv = $('<div></div>');
			        let fileNameSpan = $('<span></span>');
			        fileNameSpan.text(files[i].name);
			        let delBtn = $('<button type="button">삭제</button>');
			        delBtn.attr("class", "delete-file-btn");
			        fileDiv.append(fileNameSpan);
			        fileDiv.append(delBtn);
			        fileNamesWrapper.append(fileDiv);
			        // 삭제 버튼 클릭 시 해당 파일 삭제
			        delBtn.on('click', function() {
			          fileDiv.remove();
			        });
			      $('#fileUpload')[0].files = files;
			        
			      }
			      $('#file-names').html(fileNamesWrapper);
			      console.log(files); 
			    }
			  });
			});

		  $(document).on("click", ".delete-file-btn", function() {
		    $(this).parent().remove();
		  });
		});
	function submitAskItemForm() {
		  const form = $("#askItemFrm")[0]; // form 엘리먼트를 가져옵니다.
		  const formData = new FormData(form); // form 데이터를 FormData 객체로 생성합니다.
		  console.log($('[name=regNo]').val());
		 
		  $.ajax({
		    url: "/askItem.do", // action 속성값으로 요청을 보낼 URL을 지정합니다.
		    method: 'POST', // 요청 방식을 지정합니다.
		    data: formData, // 전송할 데이터를 지정합니다.
		    processData: false, // 데이터 전송 시 데이터 처리 방식을 지정합니다. 기본값은 true입니다.
		    contentType: false, // 데이터 전송 시 컨텐트 타입을 지정합니다. 기본값은 'application/x-www-form-urlencoded; charset=UTF-8'입니다.
		    traditional : true,
		    success: function(data) {
	    		console.log(data);
		    	if(data == "success"){
		    		$("#alert01").click();
		    	}else{
		    		$("#alert02").click();
		    	}
		    },
		    error: function() {
		      console.error("에러"); // 에러 발생 시 실행할 코드를 작성합니다.
		    }
		  });
		}
  $(function () {
      $("#alert01").on("click", function () {
          jQueryAlert('success',"입점문의 작성 완료");
      });
      $("#alert02").on("click", function () {
          jQueryAlert('error',"관리자에게 문의하세요.");
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
                      location.href = '/main.do';
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
	</script>		
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>