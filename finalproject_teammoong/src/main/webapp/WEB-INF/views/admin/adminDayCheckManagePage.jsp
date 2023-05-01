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
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- google icon -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	<!-- data tables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css"/> 
	
	<!-- data tables 버튼 관련 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script> 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.html5.min.js"></script> 
	<script src="https://cdn.datatables.net/buttons/1.5.1/js/buttons.print.min.js"></script>
	<!-- Bootstrap JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	<!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
	
	
</head>
<style>
    
    .adminPage-main{
        background-color: lightgreen;
    }
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 150px;
        
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
    color : white;
	
	}
	.adminPage-result{
		width: 1500px;
	}




</style>
<body>
    <c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
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
									<h4 class="modal-title" id="myModalLabel">모달 제목</h4>
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
	    	  
	    	  $.ajax({
	    	    url: '/ajaxUseMoongCheck.do',
	    	    type: 'post',
	    	    data: {memberNo : memberNo},
	    	    success: function(data) {
	    	    	
	    	    var modalBody = $(".modal-body");
	    	    modalBody.empty(); // 모달 초기화
	    	    
	    	    for(let i=0;i<data.length;i++){
					const ul = $("<ul>");
					ul.append("<li>"+data[i].memberId+"님의 뭉머니 사용내역</li>")
					ul.append("<li>사용한 뭉머니 : "+data[i].pointEa+"</li>");
					ul.append("<li>뭉머니 적립일 : "+data[i].pPointDate+"</li>");
					if(data[i].pointStatus == 3){
						ul.append("<li>뭉머니 "+data[i].pointEa+"뭉 사용완료</li>");
					}
					ul.append("<br>");
					modalBody.append(ul);
	    	      }
	    	      $('#myModal').modal('show');
	    	    } // for
	    	    
    	  }); // ajax
	    	  
    	}); // 클릭 모달
    	
	    $('#dataTables tbody').on('mouseenter', 'tr', function() {
	        $(this).addClass('hover'); 
	    });// 호버시 CSS 클래스 추가
	    $('#dataTables tbody').on('mouseleave', 'tr', function() {
	        $(this).removeClass('hover'); 
	    }); // 호버 빠져나올시 CSS 클래스 제거
	    
	    
	    
	    
	    
	    
});
    
    
    
        
    </script>
    
</body>
</html>