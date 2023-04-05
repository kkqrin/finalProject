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
  	padding-top: 30px; 
  }
  .main-content{
  	padding-top: 30px; 
  }
</style>
</head>
<body>
	<div class="content-wrap">
		<div class="content-all">
			<h3>공지사항 작성</h3>
			<div class="main-content">
				<form action="/noticeWrite.do" method="post" enctype="multipart/form-data" id="writeFrm">
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
							    <div class="custom-file-upload" id="file-choose">
								    <input type="file" name="noticeFile" multiple id="fileUpload">
								    <c:forEach items="${n.fileList }" var="f">
							     		<p>
							        		<a href="/noticeFileDown.do?fileNo=${f.fileNo}">${f.fileName }</a>
							        		<button type="button" onclick="deleteFile(this,${f.fileNo}, '${f.filepath}');">삭제</button>
							      		</p>
							    	</c:forEach>					    
									<label for="fileUpload">선택하기</label>
							    </div>
							    <div id="file-names"></div>
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
									<button type="submit" class="btn btn-border-pri size02">저장</button>
									<a href="noticeList.do?reqPage=1" class="btn btn-border-black size02">취소</a>
								</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }" readonly>
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
			
			$("#writeFrm").append(fileNoInput).append(filepathInput);
			$(obj).parent().remove();
		}
		$(document).ready(function() {
			  $('#fileUpload').change(function() {
			    const files = $('#fileUpload')[0].files;
			    if (files.length > 0) {
			      let fileNames = '';
			      for (let i = 0; i < files.length; i++) {
			        fileNames += files[i].name + ', ';
			      }
			      fileNames = fileNames.substring(0, fileNames.length - 2);
			      $('#file-names').text(fileNames);
			    }
			  });
			});
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>