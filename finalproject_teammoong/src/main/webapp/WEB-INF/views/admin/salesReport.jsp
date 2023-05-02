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
    <!-- data tables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
	<!-- Chart.js -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
<style>
	#yearChart{
		height: 350px !important;
	}
	#monthChart{
		height: 350px !important;
	}
	[name=reportTitle]{
		background-color: black;
	    color: white;
	    font-size: 35px;
	    text-align: center;
	    margin-bottom: 50px;
	    border-radius: 30px;
	    font-weight: bold;
	    height: 60px;
	    line-height: 60px;
	}
	.firstTr {
		border-bottom: 3px solid black;
	}
	.secondTr{
		border-bottom: 3px solid black;
	}
	.thirdTr{
		border-bottom: 3px solid black;
	}
	.subTitle{
	    margin-left: 20px;
	    margin-bottom: 10px;
	    font-size: 20px;
	    font-weight: bold;
	}
	.dateTitle{
		margin-left: 710px;
	    padding-bottom: 20px;
	    font-size: 20px;
	    font-weight: bold;
	}
	.writerTitle{
		margin-left: 626px;
	    padding-bottom: 20px;
	    font-size: 20px;
	    font-weight: bold;
	}
</style>
</head>
<body>
	<div class="salesReport">
		<div class="salesReport-main">
			<table id="dataTables" class="table table-bordered">
				<div name="reportTitle">뭉쳐야산다 매출보고서</div>
				<tr>
					<div class="subTitle">ㅇ 매출 차트</div>
					<div name="yearChart"><canvas id="yearChart"></canvas></div>
					<div name="monthChart"><canvas id="monthChart"></canvas></div>
				</tr>
			</table>
			<table id="sumTables" class="table table-bordered">
				<div class="subTitle">ㅇ 보고서 본문</div>
				<tr class="firstTr">
					<th style="width : 100px">매출액</th>
					<th style="text-align: right;" colspan="2"><fmt:formatNumber value="${totalSales }"/></th>
				</tr>
				<!-- 매출 forEach 들어가야할 자리겠지 -->
				<c:forEach items="${list }" var="l">
					<tr>
						<td style="text-align: right">ㅇ</td>
						<c:choose>
							<c:when test="${l.categoryNo == 1}">
								<td>패션</td>
							</c:when>
							<c:when test="${l.categoryNo == 2}">
								<td>뷰티</td>
							</c:when>
							<c:when test="${l.categoryNo == 3}">
								<td>식품</td>
							</c:when>
							<c:when test="${l.categoryNo == 4}">
								<td>생활용품</td>
							</c:when>
							<c:when test="${l.categoryNo == 5}">
								<td>가전/디지털</td>
							</c:when>
							<c:when test="${l.categoryNo == 6}">
								<td>가구</td>
							</c:when>
							<c:when test="${l.categoryNo == 7}">
								<td>침구</td>
							</c:when>
							<c:when test="${l.categoryNo == 8}">
								<td>인테리어</td>
							</c:when>
							<c:when test="${l.categoryNo == 9}">
								<td>공구</td>
							</c:when>
							<c:when test="${l.categoryNo == 10}">
								<td>스포츠/레저/취미</td>
							</c:when>
							<c:when test="${l.categoryNo == 11}">
								<td>출산/유아동</td>
							</c:when>
							<c:when test="${l.categoryNo == 12}">
								<td>반려용품</td>
							</c:when>
							<c:when test="${l.categoryNo == 13}">
								<td>명품관</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${l.totalSales == 0 }">
								<td style="text-align: left">0</td>
							</c:when>
							<c:when test="${l.totalSales != 0 }">
								<td style="text-align: right"><fmt:formatNumber value="${l.totalSales }"/></td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
				<tr class="secondTr">
					<th style="width : 100px">매출원가</th>
					<th style="text-align: right;" colspan="2"><fmt:formatNumber value="${totalCost }"/></th>
				</tr>
				<c:forEach items="${list }" var="l">
					<tr>
						<td style="text-align: right">ㅇ</td>
						<c:choose>
							<c:when test="${l.categoryNo == 1}">
								<td>패션</td>
							</c:when>
							<c:when test="${l.categoryNo == 2}">
								<td>뷰티</td>
							</c:when>
							<c:when test="${l.categoryNo == 3}">
								<td>식품</td>
							</c:when>
							<c:when test="${l.categoryNo == 4}">
								<td>생활용품</td>
							</c:when>
							<c:when test="${l.categoryNo == 5}">
								<td>가전/디지털</td>
							</c:when>
							<c:when test="${l.categoryNo == 6}">
								<td>가구</td>
							</c:when>
							<c:when test="${l.categoryNo == 7}">
								<td>침구</td>
							</c:when>
							<c:when test="${l.categoryNo == 8}">
								<td>인테리어</td>
							</c:when>
							<c:when test="${l.categoryNo == 9}">
								<td>공구</td>
							</c:when>
							<c:when test="${l.categoryNo == 10}">
								<td>스포츠/레저/취미</td>
							</c:when>
							<c:when test="${l.categoryNo == 11}">
								<td>출산/유아동</td>
							</c:when>
							<c:when test="${l.categoryNo == 12}">
								<td>반려용품</td>
							</c:when>
							<c:when test="${l.categoryNo == 13}">
								<td>명품관</td>
							</c:when>
						</c:choose>
						<c:choose>
							<c:when test="${l.totalCost == 0 }">
								<td style="text-align: left">0</td>
							</c:when>
							<c:when test="${l.totalCost != 0 }">
								<td style="text-align: right"><fmt:formatNumber value="${l.totalCost }"/></td>
							</c:when>
						</c:choose>
					</tr>
				</c:forEach>
				<tr class="thirdTr">
					<th style="width : 100px">당기순이익</th>
					<th style="text-align: right;" colspan="2"><fmt:formatNumber value="${profit }"/></th>
				</tr>
			</table>
			<div class="dateTitle"></div>
			<div class="writerTitle">작성자 : 뭉쳐야산다 일동</div>
		</div>
	</div>
	
	
	
	
	
<script type="text/javascript">

const chartDataUrl = "https://example.com/data.json";

	$(document).ready(function() {	
			
		$.ajax({
			url: 'ajaxTotalSalesManage.do',
		    dataType: 'json',
		    success: function(data){
				var context = document.getElementById('yearChart').getContext('2d');
		    	var myChart = new Chart(context, {
					type : 'bar', // 차트의 형태
					data : { // 차트에 들어갈 데이터
						labels : [ //x 축
							'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
						datasets : [ { //데이터
						label : '매출', //차트 제목
						fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
						data : //x축 label에 대응되는 데이터 값
							[ data[0].totalSales,data[1].totalSales,data[2].totalSales,data[3].totalSales,data[4].totalSales,data[5].totalSales,
								data[6].totalSales,data[7].totalSales,data[8].totalSales,data[9].totalSales,data[10].totalSales,data[11].totalSales 
						],
						backgroundColor : [
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
								'rgba(255, 159, 64, 0.2)'
								],
						borderColor : [
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
								'rgba(255, 159, 64, 1)'
								],
						borderWidth : 1	//경계선 굵기
					} ,
		              {
		                  label: '원가',
		                  type: 'line',
		                  fill: false,
		                  data: [
		                      data[0].totalCost, data[1].totalCost, data[2].totalCost, data[3].totalCost, data[4].totalCost, data[5].totalCost,
		                      data[6].totalCost, data[7].totalCost, data[8].totalCost, data[9].totalCost, data[10].totalCost, data[11].totalCost
		                  ],
		                  backgroundColor: 'rgb(157, 109, 12)', // 라인이니까 색상은 한개
		                  borderColor: 'rgb(157, 109, 12)' // 라인이니까 색상 한개
		              }
					]
				},
				options : {
					scales : {
						yAxes : [ {
							ticks : {
								beginAtZero : true
							}
						} ]
					}
				}
			});
		    	
		    }
		}); // 매출 chart
	
		
		// 월 카테고리
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
			
		})
	
		
		// 날짜 입력
		var dateTitle = $(".dateTitle");
		
		var today = new Date();
		var year = today.getFullYear(); // 년도
		var month = today.getMonth() + 1;  // 월
		var date = today.getDate();  // 날짜

		// 출력 예시 : 2023년 5월 2일
		dateTitle.text(year + "년 " + month + "월 " + date + "일");			
				
				
				
				
				
	}); // ready

	$(".searchBtn").on("click",function(){
		const salesReport = $(".salesReport-main");
		salesReport.show();
		
	});
	
	
		
		
		
		




	/* $.ajax({
		url : "/ajaxSalesReportPrint.do",
		type : "get",
		success: function(data){
			const table =$("<table>");
			const titleTr = $("<tr>");
			titleTr.html("<th>구분</th><th>게시글 번호</th><th>카테고리 번호</th><th>작성자</th><th>게시일자</th><th>공구 시작일</th><th>공구 마감일</th><th>공구 진행여부</th><th>상품명</th><th>상품가격</th>");
			table.append(titleTr);
			const tr = $("<tr>");
			tr.append("<td>"+"</td>")
			tr.append("<td>"+data[i].boardNo+"</td>");
			tr.append("<td>"+data[i].detailCategoryNo+"</td>");
			tr.append("<td>"+data[i].boardWriter+"</td>");
			tr.append("<td>"+data[i].boardDate+"</td>");
			tr.append("<td>"+data[i].boardStart+"</td>");
		}	
		
	}); */
</script>
<style>

</style>
</body>
</html>