<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/summernote/summernote-lite.js"></script>
<script src="/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/summernote/summernote-lite.css">
<body>
	<form action="/noticeWrite.do" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>
					<label for="title">제목</label>
					<select size="1" name="status" class="input-form-short">
						<option value="1">공지</option>
						<option value="0">일반</option>
					</select>
					<input type="text" name="noticeTitle" class="input-form">
				</th>
			</tr>
			<tr>
				<th>
					<label for="file">파일첨부</label>
					<input type="file" name="noticeFile" multiple><button type=button>삭제</button>
				</th>
			</tr>
			<tr>
				<th>
					<label for="noticeWriter">작성자</label>
				</th>
				<td>
					${sessionScope.m.memberId }
					<input type="hidden" name="noticeWriter" value="${sessionScope.m.memberId }" readonly>
				<td>
			</tr>
			<tr>
				<th>내용</th>
			</tr>
			<tr>
				<td>
					<textarea id="noticeContent" rows="20" name="noticeContent" class="form"></textarea>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="저장">
					<button type="button">취소</button>
				</td>
			</tr>
		</table>
	</form>
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
	</script>
</body>
</html>