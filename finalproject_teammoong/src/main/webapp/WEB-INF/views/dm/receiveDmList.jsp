<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<style>
.dmContentBox{
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;	
}

.modal-content .modal-header {height:auto;}
.modal-content .modal-body {padding:30px;}
.modal-content .modal-body:not(.info__fix) {max-height:350px !important;}


</style>
	<div class="content-wrap">
		<div class="mypage-wrap">
		
		<jsp:include page="/WEB-INF/views/common/myPageMenu.jsp" />
		
		<div class="mypage-right">
			<div class="mypage-right-title">받은 쪽지함</div>
			<div class="mypage-content">
				
				<table>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 55%;">쪽지</th>
						<th>보낸사람</th>
						<th>받은날짜</th>
						<th style="width: 10%;">확인</th>
					</tr>
					<c:forEach items="${list }" var="dm">
						<tr>
							<td>${dm.rnum }</td>
							<td>
								<div class="dmContentBox">
								<a style="cursor:pointer;" data-modal="#modalBasic">${dm.dmContent }</a>
								</div>
							</td>
							<td>${dm.dmSender }</td>
							<td>${dm.dmDate }</td>
							<td>
								<c:choose>
								<c:when test="${dm.dmReadChk eq 0}">
									읽지않음
								</c:when>
								<c:otherwise>
									읽음
								</c:otherwise>
								</c:choose>
							</td>
						</tr>
						
						<!-- modal-basic -->
				        <div id="modalBasic" class="modal modal-pri">
				            <div class="modal-content">
				                <div class="modal-header">
				                    <h6>보낸 사람 : ${dm.dmSender }</h6>
				                    <input type="hidden" name="toReply" value="${dm.dmSender }">
				                    <a>보낸 시간 : [ ${dm.dmDateHour } ]</a>
				                </div>
				                <div class="modal-body">
			                    	${dm.dmContentBr }
				                </div>
				                <div style="display: flex; justify-content: space-between; padding: 0 20px 20px 20px;">
				                	<button class="btn btn-sec size01 reply" type="button">답장</button>
				                    <a href="" rel="modal:close" class="btn btn-pri size01">확인</a>
				                </div>
				            </div>
				        </div>
				        <!-- //modal-basic -->
						
					</c:forEach>
				</table>
				
			</div><!-- mypage-content -->
		</div>
		
		</div><!-- mypage-right -->
	</div>
	
	
	
	<script>
		//모달 관련 기능
	    $(function () {
	        $('[data-modal]').click(function (event) {
                $($(this).data('modal')).modal({
                    fadeDuration: 100
                });
                return false;
	        });
	    });
	
		$(".reply").on("click",function(){
			const receiver = $("[name='toReply']").val();
			location.href="/dmReply.do?receiver="+receiver;
		});
		
		
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>