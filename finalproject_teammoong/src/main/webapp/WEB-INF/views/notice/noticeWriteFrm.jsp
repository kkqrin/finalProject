<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</style>
</head>
<body>
	<div class="content-wrap">
		<div class="content-all">
			<h3>공지사항 작성</h3>
			<div class="main-content">
				<form method="post" enctype="multipart/form-data" id="writeFrm">
					<table class="tbn-box">
						<tr>
							<th style="width:30%;">
								<p>제 목</p>
								<div>
									<span style="color: red;">*</span>
									<select  class="select-custom" name="noticeStatus"  style="width:50%;">
										<option value="1" style="text-align:center;">공지</option>
										<option value="0" style="text-align:center;">일반</option>
									</select>
								</div>
							</th>
							<td>
								<input type="text" name="noticeTitle" class="input-basic" required>
							</td>
						</tr>
						<tr>
							<th>
								<label for="file">파일첨부</label>
							</th>
							<td>
								<div id="drop-zone">
      							<label for="fileUpload">파일을 여기에 끌어다 놓거나 클릭하세요.</label>
    						</div>
    							<input type="file" name="noticeFile" id="fileUpload" multiple style="display: none" />
    						<div id="file-names">
    						</div>
    					</td>
						</tr>
						<tr>
							<th>
								<label for="noticeWriter">작성자</label>
							</th>
							<td>
								${sessionScope.m.memberId }
							</td>
						</tr>
						<tr>
							<th colspan="2">내용</th>
						</tr>
						<tr>
							<td colspan="2">
								<textarea id="noticeContent" cols="30" rows="20" name="noticeContent"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="area-btn center">
									<button type="button" onclick="submitNoticeForm()" class="btn btn-border-pri size02">저장</button>
									<a href="noticeList.do?reqPage=1" class="btn btn-border-black size02">취소</a>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }" readonly>
				</form>
			</div>
			<div class="area-btn left" style="display:none;">
                <button class="btn btn-border-pri size01" type="button" id="alert01">성공</button>
				<button class="btn btn-border-sec size01" type="button" id="alert02">에러</button>
                <button class="btn btn-border-ter size01" type="button" id="alert03">경고</button>
                <button class="btn btn-border-black size01" type="button" id="alert04">정보</button>
           </div>
		</div>
	</div>
	<script>
		$("#noticeContent").summernote({
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
		        url: "/uploadImage.do",
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
				    	  formData.append("noticeFile", files[i]);
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
		function submitNoticeForm() {
			  const form = $('#writeFrm')[0]; // form 엘리먼트를 가져옵니다.
			  const formData = new FormData(form); // form 데이터를 FormData 객체로 생성합니다.

			  $.ajax({
			    url: "/noticeWrite.do", // action 속성값으로 요청을 보낼 URL을 지정합니다.
			    method: 'POST', // 요청 방식을 지정합니다.
			    data: formData, // 전송할 데이터를 지정합니다.
			    processData: false, // 데이터 전송 시 데이터 처리 방식을 지정합니다. 기본값은 true입니다.
			    contentType: false, // 데이터 전송 시 컨텐트 타입을 지정합니다. 기본값은 'application/x-www-form-urlencoded; charset=UTF-8'입니다.
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
                jQueryAlert('success',"글쓰기 작성 완료");
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
                            location.href = '/noticeList.do?reqPage=1';
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