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
	<script src="/resources/js/noticewrite.js"></script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>