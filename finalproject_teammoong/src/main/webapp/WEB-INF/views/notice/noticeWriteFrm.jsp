<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
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
					<input type="file"><button type=button>삭제</button>
				</th>
			</tr>
			<tr>
				<th>
					내용
				</th>
			</tr>
			<tr>
				<td>
					<textarea ></textarea>
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
</body>
</html>