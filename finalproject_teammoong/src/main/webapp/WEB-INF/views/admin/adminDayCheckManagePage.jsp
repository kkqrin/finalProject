<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jquery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- google icon -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- data tables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/> 
	<!-- data tables 버튼 관련 -->
<!-- 	<script src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script> -->
	<!-- Bootstrap JavaScript 모달 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	
	<!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
	
	
</head>
<style>
    .adminPage-main{
    	overflow: hidden;
    	margin-top: 35px;
    	margin-left: 350px;
    }
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        cursor: pointer;
	    font-size: 35px !important;
	    line-height: 35px;
	    position: absolute;
        
    }
    .mainContent{
        float: left;
        width: 300px;
        height: 400px;
        text-align: center;
    }
    #orderStatusSelect{
    	display: none;
    }
    #space{
    	margin-top: 500px;
    }
    
	tr.hover {
    	background-color: lightgray;
    	color : #ffa220;
	
	}
	.adminPage-result{
		width: 98%;
	}
	.modal-content{
	    width: 400px;
	    border: 5px solid #ffa220;
	    position: fixed;
	    top: 80px;
	    right: 524px;
	    border-radius: 20px;
	}
	#myModal{
		display: none;
	}
	.modal-title{
		font-size: 25px;
   		font-weight: bold;
	}
	#dataTables thead th {
 	 	text-align: center;
	}



</style>
<body>
<c:choose>
    <c:when test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <div class="adminPage-title"><a href="/#">Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
            <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-result">
                    	<div class="space"></div>
                        <table id="dataTables" class="table-bordered">
	                        <thead>
	                            <tr>
	                            	<th>구분</th>
	                                <th>회원아이디</th> 
	                                <th>회원이름</th>
	                                <th>뭉머니 사용금액</th>
	                                <th>뭉머니 잔액</th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                            <c:forEach items="${mMoneyList }" var="ml">
	                            	<tr>
	                                    <input type="hidden" name="memberNo" value="${ml.memberNo }">
	                                	<td><input type="checkBox" id="checkBox"></td>
	                                    <td>${ml.memberId }</td>
	                                    <td>${ml.memberName }</td>
	                                    <td>이것은 사용금액</td>
	                                    <td><fmt:formatNumber value="${ml.pointEa }"/></td>
	                          	 	</tr>
								</c:forEach>
	                        </tbody>
		                        <!-- <div><button type="button">데이터 엑셀 출력</button></div> -->
                        </table>
                   	</div>
                    <!-- 모달 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<span class="modal-title" id="myModalLabel">고객님의 뭉머니 History</span>
									<span class="material-symbols-outlined" name="cancel">cancel</span>
								</div>
								<div class="modal-body">
									<!-- 모달 내용 -->
								</div>
							</div>
						</div>
					</div><!-- 모달 div -->
				</div>
            </div>
        </div>
    </div>
</c:when>
<c:otherwise>
	<script type="text/javascript">
	location.href = "/main.do";
</script>
</c:otherwise>
</c:choose>

<!-- 스크립트를 넣어봅시다 -->
    <script>
    /* data tables 적용해보자 */
    $(document).ready(function() {
	    $('#dataTables').DataTable({
	        dom : 'lfrtip',
	        searching: true, // 검색 input 세팅
	        fixedHeader: true, // 헤더 설정
	        columns: [
	            null,
	            { searchable: true },
	            { searchable: true },
	            { searchable: true },
	            { searchable: true },
	        ], // 검색 조건 설정, 컬럼에 true 값을 주면 해당 컬럼적용
	        "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ], // 조회 개수 설정
	        buttons: ['copy', 'excel', 'pdf', 'print'],
	        
	    }); // 테이블 옵션
	    
	    $('#dataTables').on('click', 'td', function() {
	    	  
	    	  var memberNo = $(this).closest('tr').find('input[name="memberNo"]').val();
	    	  
	    	  /* $(".adminPage-back").css("background-color","gray");
	    	  $(".adminPage-content").css("background-color","gray";) */
	    	  
	    	  $.ajax({
	    	    url: '/ajaxUseMoongCheck.do',
	    	    type: 'post',
	    	    data: {memberNo : memberNo},
	    	    success: function(data) {
	    	    	
	    	    var modalBody = $(".modal-body");
	    	    modalBody.css("background-color","white");
	    	    modalBody.empty(); // 모달 초기화
	    	    
	    	    
	    	    for(let i=0;i<data.length;i++){
		    	    var formattedPointEa = data[i].pointEa.toLocaleString('ko-KR', {style: 'currency', currency: 'KRW'});
					const ul = $("<ul>");
					ul.append("<li>"+data[i].memberId+"님의 뭉머니 내역</li>")
					
					if(data[i].pointStatus == 0){
						ul.append("<li>적립한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 적립일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 출석체크 적립</li>");
					}else if(data[i].pointStatus == 1){
						ul.append("<li>적립한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 적립일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 가입축하 적립</li>");
					}else if(data[i].pointStatus == 2){
						ul.append("<li>적립한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 적립일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 적립</li>");
					}else if(data[i].pointStatus == 3){
						ul.append("<li>사용한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 사용일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 사용</li>");
					}else if(data[i].pointStatus == 4){
						ul.append("<li>충전한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 충전일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 충전</li>");
					}else if(data[i].pointStatus == 5){
						ul.append("<li>환불한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 환불일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 환불</li>");
					}else if(data[i].pointStatus == 6){
						ul.append("<li>사용한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 결제일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 공구결제</li>");
					}else if(data[i].pointStatus == 7){
						ul.append("<li>회수한 뭉머니 : "+formattedPointEa+"</li>");
						ul.append("<li>뭉머니 회수일 : "+data[i].pPointDate+"</li>");
						ul.append("<li>뭉머니 "+formattedPointEa+"뭉 회수</li>");
					}
					
					ul.append("<hr>");
					modalBody.append(ul);
					
	    	      }// for
	    	    
	    	      $('#myModal').modal('show');
	    	      
	    	    } // success
	    	    
	    	    
    	  }); // ajax
	    	  
    	}); // 클릭 모달
    	
    	// close 클릭시 모달 숨기기
    	$("[name=cancel]").on("click",function(){
    		$("#myModal").modal('hide');
    	})
    	
    	// 마우스 커서 변경
    	$("[name=cancel]").on("mouseenter",function(){
    		$(this).css("cursor","pointer");
    	})
    	
    	// 호버
	    $('#dataTables tbody').on('mouseenter', 'tr', function() {
	        $(this).addClass('hover'); 
	       
	    });// 호버시 CSS 클래스 추가
	    $('#dataTables tbody').on('mouseleave', 'tr', function() {
	        $(this).removeClass('hover'); 
	        
	    }); // 호버 빠져나올시 CSS 클래스 제거
	    
	    
	    
	    $(".adminPage-back").css("background-color","gray");
    	$(".adminPage-content").css("background-color","gray");
    	
    	$(".adminPage-back").css("background-color","white");
    	$(".adminPage-content").css("background-color","white");
	    
	    
}); // ready
    
    
    
        
    </script>
    
</body>
</html>