<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js"></script>
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
  	padding-top: 30px; 
  }
  .main-content{
  	padding-top: 30px; 
  }
  #drop-zone {
    width: 300px;
    height: 150px;
    border: 2px dashed #ccc;
    border-radius: 20px;
    text-align: center;
    font-size: 24px;
    font-weight: bold;
    margin: 20px auto;
    line-height: 150px;
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
			<h3>공지사항 수정</h3>
			<div class="main-content">
		<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data" id="updateFrm">
			<table class="tbn-box">
				<tr>
					<th style="width:30%;">
						<p>제 목</p>
						<div>
							<span style="color: red;">*</span>
							<select  class="select-custom" name="noticeStatus" style="width:50%;">
								<option value="1" style="text-align:center;" ${n.noticeStatus == 1 ? "selected" : ""}>공지</option>
								<option value="0" style="text-align:center;" ${n.noticeStatus == 0 ? "selected" : ""}>일반</option>
							</select>
						</div>
					</th>
					<td>
						<input type="text" name="noticeTitle" value="${n.noticeTitle}" required>
					</td>
				</tr>
				<tr>
					<th>
						<label for="file">파일첨부</label>
					</th>
					<td>
						<div class="custom-file-upload" id="file-choose">
  							<label for="fileUpload">파일 선택</label>
  							<c:forEach items="${n.fileList }" var="f">
							     <p>
							     	<a href="/noticeFileDown.do?fileNo=${f.fileNo}">${f.fileName }</a>
							        <button type="button" onclick="deleteFile(this,${f.fileNo}, '${f.filepath}');">삭제</button>
							     </p>
							</c:forEach>	
						</div>
						<div id="drop-zone">
      					파일을 여기에 끌어다 놓거나 클릭하세요.
    					</div>
    					<input type="file" id="fileUpload" multiple style="display: none" />
    					<div id="file-names"></div>
					</td>
				</tr>
				<tr>
					<th>
						<label for="noticeWriter">작성자</label>
					</th>
					<td>
						${n.noticeWriter }
						<input type="hidden" name="noticeWriter" value="${n.noticeWriter}" readonly>
					</td>
				</tr>
				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2">
						<textarea id="noticeContent" cols="30" rows="20" name="noticeContent">${n.noticeContent }</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="area-btn center">
							<button type="submit" class="btn btn-border-pri size02">저장</button>
							<a href="/noticeView.do?noticeNo=${n.noticeNo}" class="btn btn-border-black size02">취소</a>
						</div>
					</td>
				</tr>
			</table>
			<input type="hidden" name="noticeNo" value="${n.noticeNo}">
		</form>
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
		function deleteFile(obj, fileNo, filepath){
			const fileNoInput = $("<input>");
			fileNoInput.attr("name","fileNo");
			fileNoInput.val(fileNo);
			fileNoInput.hide();
			
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepath");
			filepathInput.val(filepath);
			filepathInput.hide();
			
			$("#updateFrm").append(fileNoInput).append(filepathInput);
			$(obj).parent().remove();
		}
		$(document).ready(function() {
			  $('#fileUpload').change(function() {
			    const files = $('#fileUpload')[0].files;
			    if (files.length > 0) {
			      let fileNames = '';
			      for (let i = 0; i < files.length; i++) {
			        fileNames += files[i].name + '<button type="button" class="delete-file-btn" onclick="deleteSelectedFile(this)">삭제</button></div>';
			      }
			      $('#file-names').empty();
			      $('#file-names').append(fileNames);
			    } else {
			      $('#file-names').empty();
			    }
			  });
			});

			function deleteSelectedFile(btn) {
			  const file = $(btn).prev();
			  file.val('');
			  $(btn).remove();
			  file.remove();
			}
			
			const dropZone = document.getElementById("drop-zone");
			const fileInput = document.getElementById("fileUpload");
			const fileNames = document.getElementById("file-names");

			dropZone.addEventListener("dragover", (e) => {
			  e.preventDefault();
			  dropZone.classList.add("dragover");
			});

			dropZone.addEventListener("dragleave", () => {
			  dropZone.classList.remove("dragover");
			});

			dropZone.addEventListener("drop", (e) => {
			  e.preventDefault();
			  dropZone.classList.remove("dragover");
			  const files = e.dataTransfer.files;
			  for (let i = 0; i < files.length; i++) {
			    const file = files[i];
			    console.log(file);
			    // 파일 정보를 가져오기 위해 FileReader 객체 사용
			    const reader = new FileReader();
			    reader.readAsDataURL(file);
			    reader.onload = function () {
			      const fileInfo = `${file.name} (${Math.round(file.size / 1024)} KB)`;
			      console.log(fileInfo);
			      fileNames.append += `<p>'file <button type="button" onclick="removeFile(event)">삭제</button></p>`;
			    };
			  }
			});

			fileInput.addEventListener("change", () => {
			  const files = fileInput.files;
			  fileNames.innerHTML = "";
			  for (let i = 0; i < files.length; i++) {
			    const file = files[i];
			    const fileInfo = `${file.name} (${Math.round(file.size / 1024)} KB)`;
			    fileNames.innerHTML += `<p>${fileInfo} <button type="button" onclick="removeFile(event)">삭제</button></p>`;
			  }
			});

			function removeFile(e) {
			  e.target.parentNode.remove();
			  fileInput.value = "";
			}

	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>