<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<!-- Bootstrap JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	
</head>
<style>
    .adminPage-wrapper{
		width: 1200px;
    }
    .adminPage-header{
        margin-left: 30px;
    }
    .adminPage-back{
        background-color: lightyellow;
        overflow: hidden;
    }
    .adminPage-sidebar{
        float: left;
        width: 300px;
        background-color: lightcoral;
        height: 2000px;

    }
    .adminPage-sidebar>ul>li{
        list-style-type: none;
    }
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




</style>
<body>
    <c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <h1><a href="#">Admin-Page</a></h1>
        </div>
        <div class="adminPage-back">
            <div class="adminPage-sidebar">
                <ul>
                    <li>회원 관리</li>
                    <il><a href="/adminMemberPage.do?reqPage=1">회원 관리</a></il><!-- jsp 생성완료 -->
                </ul>
                <ul>
                    <li>매출 관리</li>
                    <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li><!-- jsp 생성완료 -->
                    <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
                </ul>
                <ul>
                    <li>상품 관리</li>
                    <li><a href="/adminTotalProductList.do?reqPage=1">상품 관리</li><!-- jsp 생성완료 -->
                    <li><a href="/adminProductRegist.do"></a>상품 등록</li>
                    <li><a href="/adminDeliveryManagePage.do?reqPage=1"></a>배송 관리</li>
                </ul>
                <ul>
                    <a>이벤트 관리</a>
                    <li>쿠폰 발행 관리</li>
                </ul>
                <ul>
                    <li>여기여기붙어라 관리</li>
                    <li><a href="/adminBoardManagePage.do?reqPage=1">여기여기붙어라 게시판 관리</a></li><!-- jsp 생성완료 -->
                    <li><a href="/adminBoardReportManagePage.do?reqPage=1">여기여기붙어라 신고 관리</a></li><!-- jsp 생성완료 -->
                    <li>카테고리별 매출관리</li>
                </ul>
            </div>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-result">
                    	<div class="space"></div>
                        <table id="dataTables" class="table table-bordered">
                        <thead>
                            <tr>
                            	<th>구분</th>
                                <th>회원아이디</th> 
                                <th>회원이름</th>
                                <th>뭉머니 사용금액</th>
                                <th>뭉머니 잔액</th>
                            </tr>
                        </thead>
                            <c:forEach items="${mMoneyList }" var="ml">
                            	<tr>
                                    <input type="hidden" name="memberNo" value="${ml.memberNo }">
                                	<td><input type="checkBox" id="checkBox"></td>
                                    <td>${ml.memberId }</td>
                                    <td>${ml.memberName }</td>
                                    <td>이것은 사용금액</td>
                                    <td>${ml.pointEa }</td>
                          	 	</tr>
							</c:forEach>
                        </table>
                    </div>
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
					</div>
                </div>
            </div>
        </div>
    </div>


<!-- 스크립트를 넣어봅시다 -->
    <script>
    /* data tables 적용해보자 */
    $(document).ready(function() {
	    $('#dataTables').DataTable({
	        searching: true, // 검색 input 세팅
	        fixedHeader: true, // 헤더 설정
	        columns: [
	            null,
	            { searchable: true },
	            { searchable: true },
	            { searchable: true },
	            { searchable: true },
	        ], // 검색 조건 설정, 컬럼에 true 값을 주면 해당 컬럼적용
	        "lengthMenu": [ [10, 25, 50, -1], [10, 25, 50, "All"] ] // 조회 개수 설정
	    });
	    
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
	    	    }
    	  });	
	    	  
    	});
	    
});
    
    
    
        
    </script>
    
</body>
</html>