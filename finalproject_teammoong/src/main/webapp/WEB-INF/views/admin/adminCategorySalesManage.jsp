<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<!-- Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- css -->
	<link rel="stylesheet" href="/resources/css/admin/admin.css" />
	<link rel="stylesheet" href="/resources/css/common/default.css" />
	
	
    
</head>
<style>
    .adminPage-back{
        overflow: hidden;
    }
    .adminPage-back>ul>li{
        text-decoration: none;
    }
    .adminPage-main{
        overflow: hidden;
    }
    .adminPage-sales{
    	margin: auto;
    	overflow: hidden;
    }
    .adminPage-content{
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 50px;
        
    }
    .adminPage-sales{
    	overflow: hidden;
    }
    
    
    /* 차트 css */
	.chartDiv{
		width: 1100px;
		margin-top: 100px;
	}
	.bestSales{
		background-color: white;
		display: inline-block;
		width: 400px;
		vertical-align: top; /* 요소 상단 맞추기 */
		border: 1px solid #ffa220;
		width: 500px;
	}
	.salesRanking{
		background-color: white;
		display: inline-block;
		vertical-align: top; /* 요소 상단 맞추기 */
		width: 400px;
		border: 1px solid #ffa220;
		width: 500px;
		margin-left: 100px;
	}
	
	.salesContent{
		display: inline-block;
	}
	
	
	.otherSalesTable>tbody>tr>th{
		height: 68.59px;
	}
	

</style>
<body>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <div class="adminPage-title"><a href="/#">Moong's Admin</a></div>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
	        <div class="adminPage-main">
	        	<div class="adminPage-sales">
	        		<div class="bestAndOther">
		        		<div class="bestSales">
		        			<div class="sales icon"><span class="material-symbols-outlined">monitoring</span></div>
		        			<div class="salesContent">
		        				<span class="bestSalesCategory">최고 매출 카테고리</span>
		        				<span class="bestSalesCount"><fmt:formatNumber value="${bestSales.totalSales }"/>원</span>
		        				<table class="bestSalesTable guide-board">
		        					<tr>
		        						<th>카테고리 베스트</th>
		        						<th>카테고리 베스트 매출액</th>
		        						<th>카테고리 베스트 원가</th>
		        						<th>카테고리 베스트 이익률</th>
		        					</tr>
		        					<tr>
		        						<c:choose>
		        							<c:when test="${bestSales.categoryNo == 1}">
		        								<td>패션</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 2}">
		        								<td>뷰티</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 3}">
		        								<td>식품</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 4}">
		        								<td>생활용품</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 5}">
		        								<td>가전/디지털</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 6}">
		        								<td>가구</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 7}">
		        								<td>침구</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 8}">
		        								<td>인테리어</td>	
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 9}">
		        								<td>공구</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 10}">
		        								<td>스포츠/레저/취미</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 11}">
		        								<td>출산/유아동</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 12}">
		        								<td>반려용품</td>
		        							</c:when>
		        							<c:when test="${bestSales.categoryNo == 13}">
		        								<td>명품관</td>
		        							</c:when>
		        						</c:choose>
		        						<td><fmt:formatNumber value="${bestSales.totalSales }"/>원</td>
		        						<td><fmt:formatNumber value="${bestSales.totalCost }"/>원</td>
		        						<td>${bestProfit } </td>
		        					</tr>
		        				</table>
		        			</div>
		        		</div>
		        		<div class="salesRanking">
		        			<div class="sales icon"><span class="material-symbols-outlined">trending_up</span></div>
		        			<div class="salesContent">
		        				<span class="salesTitle">월 매출액</span>
		        				<span class="otherSalesCount"><fmt:formatNumber value="${otherSalSum }"/>원</span>
		        				<table class="otherSalesTable guide-board">
		        					<tr>
		        						<th>카테고리</th>
		        						<th>매출액</th>
		        						<th>원가</th>
		        						<th>이익률</th>
		        					</tr>
			        				<c:forEach items="${otherSalesList }" var="other">
			        					<c:forEach items="${otherProfit }" var="otherProfit">
			        						<tr>
			        							<c:choose>
				        							<c:when test="${other.categoryNo == 1}">
				        								<td>패션</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 2}">
				        								<td>뷰티</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 3}">
				        								<td>식품</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 4}">
				        								<td>생활용품</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 5}">
				        								<td>가전/디지털</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 6}">
				        								<td>가구</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 7}">
				        								<td>침구</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 8}">
				        								<td>인테리어</td>	
				        							</c:when>
				        							<c:when test="${other.categoryNo == 9}">
				        								<td>공구</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 10}">
				        								<td>스포츠/레저/취미</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 11}">
				        								<td>출산/유아동</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 12}">
				        								<td>반려용품</td>
				        							</c:when>
				        							<c:when test="${other.categoryNo == 13}">
				        								<td>명품관</td>
				        							</c:when>
				        						</c:choose>
				        						<td><fmt:formatNumber value="${other.totalSales }"/>원</td>
		        								<td><fmt:formatNumber value="${other.totalCost }"/>원</td>
		        								<td>${otherProfit } </td>
			        						</tr>
		        						</c:forEach>
		        					</c:forEach>
		        				</table>
		        			</div>
		        		</div>
	        		</div>
	        	</div>
        		<!-- <div class="salesReport">
        			<div><button type="button" onclick="salesReportPrint();">매출보고서 출력</button></div>
        		</div> -->
	        	<div class="chartDiv">
		        	<div class="monthSalesChart chart">
		        		<canvas id="monthChart"></canvas>
		        	</div>
	        	</div>
	        </div>
    	</div>
    </div>
  
<script>

  const chartDataUrl = "https://example.com/data.json";
  
	$(document).ready(function() {
		var bestSalesCount = $(".bestSalesCount");
		var otherSalesCount = $(".otherSalesCount");
		
				// 카테고리별 매출 현황
				$.ajax({
					url : '/ajaxTotalCategorySalesManage.do',
					dataType: 'json',
					success: function(data){
												
						var context = document.getElementById('monthChart').getContext('2d');
			            var myChart = new Chart(context, {
			                type: 'bar', // 차트의 형태
			                data: { // 차트에 들어갈 데이터
			                    labels: [
			                        // 카테고리 명
			                        '패션','뷰티','식품','생활용품','가전/디지털','가구','침구','인테리어','공구','스포츠/레저/취미','출산/유아동','반려용품','명품관'
			                    ],
			                    datasets: [
			                        { //데이터
			                            label: '카테고리별 매출현황', //차트 제목
			                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
			                            data : //x축 label에 대응되는 데이터 값
											[ data[0].totalSales, data[1].totalSales, data[2].totalSales, data[3].totalSales, data[4].totalSales, data[5].totalSales,
												data[6].totalSales, data[7].totalSales, data[8].totalSales, data[9].totalSales, data[10].totalSales, data[11].totalSales,
												data[12].totalSales
										],
			                            backgroundColor: [
			                                //색상
			                            	'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(255, 159, 64, 0.2)',
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(255, 159, 64, 0.2)',
											'rgba(255, 159, 64, 0.2)'
			                            ],
			                            borderColor: [
			                                //경계선 색상
			                            	'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)',
											'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(255, 159, 64, 1)',
											'rgba(255, 159, 64, 1)'
			                            ],
			                            borderWidth: 1 //경계선 굵기
			                        } ,
			                        {
			                        	 label: '원가',
						                  type: 'line',
						                  fill: false,
						                  data: [
						                      data[0].totalCost, data[1].totalCost, data[2].totalCost, data[3].totalCost, data[4].totalCost, data[5].totalCost,
						                      data[6].totalCost, data[7].totalCost, data[8].totalCost, data[9].totalCost, data[10].totalCost, data[11].totalCost,
						                      data[12].totalCost
						                  ],
						                  backgroundColor: 'rgb(157, 109, 12)', // 라인이니까 색상은 한개
						                  borderColor: 'rgb(157, 109, 12)' // 라인이니까 색상 한개
			                        } 
			                    ]
			                },
			                options: {
			                    scales: {
			                        yAxes: [
			                            {
			                                ticks: {
			                                    beginAtZero: true
			                                }
			                            }
			                        ]
			                    }
			                }
			            });
					} 
					
				})// 카테고리별 연도 매출
				
	

			}); // function ready
			
		function salesReportPrint(){
			window.open('http://192.168.10.143/salesReportPrint.do','_blank', 'width=700px,height=800px,scrollbars=yes');
					
			
		}
			
			
			
			
</script>
	  
</body>
</html>