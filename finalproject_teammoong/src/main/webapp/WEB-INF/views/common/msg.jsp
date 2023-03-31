<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="modalBasic" class="modal modal-pri">
		<div class="modal-content">
			<div class="modal-header">
				<h6>모달 타이틀</h6>
			</div>
			<div class="modal-body">
				<!--내용영역-->
				<h5>내용타이틀</h5>
				<p>Contents Contents Contents Contents Contents </p>
				<p>Contents Contents Contents Contents Contents </p>
				<p>Contents Contents Contents Contents Contents </p>
				<p>우측상단에 x버튼이 있는 모달 </p>
				<p>x 스타일은 common.css .jquery-modal .modal .close-modal  요거 백그라운드 수정해서 쓰기 </p>
				<!--//내용영역-->
			</div>
			<div class="area-btn right">
				<button class="btn btn-pri size01" type="button">버튼</button>
				<a href="" rel="modal:close" class="btn btn-sec size01">닫기</a>
			</div>
		</div>
	</div>

	<script>
		$(function () {
			$($(this).data('modal')).modal({
				fadeDuration: 100
			});
			return false;
		});
	</script>
</body>
</html>