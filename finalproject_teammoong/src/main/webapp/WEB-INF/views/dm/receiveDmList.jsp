<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>받은 쪽지함</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
	.modal-wrapper{
		display:none;
	    position: fixed;
	    width: 100vw;
	    height: 100vh;
	    background-color: rgb(0, 0,0,0.5);
	    top:0;
	    left:0;
	    justify-content: center;
	    align-items: center;
	}
	
	.custom-modal{
	    width: 350px;
	    background-color: #fff;
	}
	.modal-header{
	    padding: 10px;
	}
	.modal-content{
	    padding: 20px;
	}

</style>
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">받은 쪽지함</div>
			<div class="mypage-content">
				<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
				<table class="receiveDmTbl">
					<thead>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 55%;">쪽지</th>
						<th>보낸사람</th>
						<th>받은날짜</th>
						<th style="width: 10%;">확인</th>
					</tr>
					</thead>
					
					<tbody>
					
					</tbody>
				</table>
				
			</div><!-- mypage-content -->
		</div><!-- mypage-right -->
		
		</div>
		
		
		
		<!-- 쪽지상세보기 모달 -->
		<div id="dmViewer" class="modal modal-sec">
				<div class="modal-content">
					<div class="modal-header" style="height: auto;">
						<h6 id="viewSender"></h6>
						<input type="hidden" id="replyToId">
						<a id="viewDate"></a>
					</div>
					<div class="modal-body" style="display: flex; flex-direction: column;">
						<div id="viewContent"></div>
					</div>
					<div class="area-btn" style="display: flex; justify-content: space-between; padding-bottom: 0;">
						<button onclick="replyDm();" class="btn btn-sec size01">답장</button>
						<a rel="modal:close" class="btn btn-sec size01" style="cursor: pointer;">확인</a>
					</div>
				</div>
		</div><!--모달창-->
		
		
	</div>
	
	
	<script src="/resources/js/myPageDm.js"></script>
	<script>
		getReceiveDm();
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>