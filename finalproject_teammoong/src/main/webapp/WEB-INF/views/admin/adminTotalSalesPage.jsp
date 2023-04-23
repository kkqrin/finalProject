<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    .adminPage-wrapper{
        background-color: lightblue;
        width: 1200px;
        margin: auto;
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
    .adminPage-back>ul>li{
        text-decoration: none;
    }
    .adminPage-main{
        background-color: lightgreen;
        overflow: hidden;
    }
    .adminPage-content{
        background-color: #fff;
        overflow: hidden;
    }
    .material-symbols-outlined{
        font-size: 50px;
        
    }

    .adminPage-sales{
    	overflow: hidden;
    }
    .totalSales{
    	float: left;
    	width: 300px;
    	height: 150px;
    	background-color: lightgray;
    	margin: 10px 100px;
    }
    .monthSales{
    	float: left;
    	width: 300px;
    	height: 150px;
    	background-color: lightyellow;
    	margin: 10px 20px;
    }
    .totalSalesChart{
    	float: left;

    }
    
    
    /* 차트 css */
	.totalChart-wrapper{
		width: 300px;
	}
	.curve_chart{
		height: 400px;
		width: 400px;
	}
	.chart{
		margin-top: 150px;
	}

</style>
<body>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <h1><a href="#">관리자 페이지 입니다.</a></h1>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
	        <div class="adminPage-main">
	        	<div class="adminPage-sales">
	        		<div class="totalSales">
	        			<div class="sales icon"><span class="material-symbols-outlined">monitoring</span></div>
	        			<div class="salesContent">
	        				<span class="salesTitle">총 매출액</span>
	        				<span class="salesCount">원</span>
	        			</div>
	        		</div>
	        		<div class="monthSales">
	        			<div class="sales icon"><span class="material-symbols-outlined">trending_up</span></div>
	        			<div class="salesContent">
	        				<span class="salesTitle">월 매출액</span>
	        				<span class="salesCount"></span>
	        			</div>
	        		</div>
	        		<div class="salesReport">
	        			<button type="button" onclick="salesReportPrint();">매출보고서 출력</button>
	        		</div>
	        	</div>
	        	<div class="chartDiv">
		        	<div class="totalSalesChart chart">
		        		<canvas id="totalChart"></canvas>
		        	</div>
		        	<div class="monthSalesChart chart">
		        		<canvas id="monthChart"></canvas>
		        	</div>
		        	<div class="selectMonthSalesChart chart">
		        		<canvas id="selectMonthChart"></canvas>
		        	</div>
	        	</div>
	        </div>
    	</div>
    </div>
  
<script>
	  
  const chartDataUrl = "https://example.com/data.json";
  

	$(document).ready(function() {

				$.ajax({
					url: 'ajaxTotalSalesManage.do',
				    dataType: 'json',
				    success: function(data){
				    	console.log(data);
						var context = document.getElementById('totalChart').getContext('2d');
				    	var myChart = new Chart(context, {
							type : 'bar', // 차트의 형태
							data : { // 차트에 들어갈 데이터
								labels : [ //x 축
								data[0].monthNo, data[1].monthNo,data[2].monthNo,data[3].monthNo,data[4].monthNo,data[5].monthNo,data[6].monthNo,
								data[7].monthNo,data[8].monthNo,data[9].monthNo,data[10].monthNo,data[11].monthNo],
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
				                      data[0].totalCost,data[1].totalCost,data[2].totalCost,data[3].totalCost,data[4].totalCost,data[5].totalCost,
				                      data[6].totalCost,data[7].totalCost,data[8].totalCost,data[9].totalCost,data[10].totalCost,data[11].totalCost
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
				}); // 매출 판매/원가
				
				
				// 카테고리별 매출 현황
				var context = document.getElementById('monthChart').getContext('2d');
	            var myChart = new Chart(context, {
	                type: 'bar', // 차트의 형태
	                data: { // 차트에 들어갈 데이터
	                    labels: [
	                        // 카테고리 명
	                        '1','2','3','4','5','6','7'
	                    ],
	                    datasets: [
	                        { //데이터
	                            label: 'test1', //차트 제목
	                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                            data: [
	                                21,19,25,20,23,26,25 // 그래프 각각의 값
	                            ],
	                            backgroundColor: [
	                                //색상
	                                'rgba(255, 99, 132, 0.2)',
	                                'rgba(54, 162, 235, 0.2)',
	                                'rgba(255, 206, 86, 0.2)',
	                                'rgba(75, 192, 192, 0.2)',
	                                'rgba(153, 102, 255, 0.2)',
	                                'rgba(255, 159, 64, 0.2)'
	                            ],
	                            borderColor: [
	                                //경계선 색상
	                                'rgba(255, 99, 132, 1)',
	                                'rgba(54, 162, 235, 1)',
	                                'rgba(255, 206, 86, 1)',
	                                'rgba(75, 192, 192, 1)',
	                                'rgba(153, 102, 255, 1)',
	                                'rgba(255, 159, 64, 1)'
	                            ],
	                            borderWidth: 1 //경계선 굵기
	                        }/* ,
	                        {
	                            label: 'test2',
	                            fill: false,
	                            data: [
	                                8, 34, 12, 24
	                            ],
	                            backgroundColor: 'rgb(157, 109, 12)',
	                            borderColor: 'rgb(157, 109, 12)'
	                        } */
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
	            }); // 카테고리별 연도 매출
	            
	            // 월 select / 카테고리 매출
	            var context = document.getElementById('selectMonthChart').getContext('2d');
	            var myChart = new Chart(context, {
	                type: 'doughnut', // 차트의 형태
	                data: { // 차트에 들어갈 데이터
	                    labels: [
	                        // 카테고리 명
	                        '1','2','3','4','5','6','7'
	                    ],
	                    datasets: [
	                        { //데이터
	                            label: 'test1', //차트 제목
	                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                            data: [
	                                21,19,25,20,23,26,25 // 그래프 각각의 값
	                            ],
	                            backgroundColor: [
	                                //색상
	                                'rgba(255, 99, 132, 0.2)',
	                                'rgba(54, 162, 235, 0.2)',
	                                'rgba(255, 206, 86, 0.2)',
	                                'rgba(75, 192, 192, 0.2)',
	                                'rgba(153, 102, 255, 0.2)',
	                                'rgba(255, 159, 64, 0.2)'
	                            ],
	                            borderColor: [
	                                //경계선 색상
	                                'rgba(255, 99, 132, 1)',
	                                'rgba(54, 162, 235, 1)',
	                                'rgba(255, 206, 86, 1)',
	                                'rgba(75, 192, 192, 1)',
	                                'rgba(153, 102, 255, 1)',
	                                'rgba(255, 159, 64, 1)'
	                            ],
	                            borderWidth: 1 //경계선 굵기
	                        }/* ,
	                        {
	                            label: 'test2',
	                            fill: false,
	                            data: [
	                                8, 34, 12, 24
	                            ],
	                            backgroundColor: 'rgb(157, 109, 12)',
	                            borderColor: 'rgb(157, 109, 12)'
	                        } */
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
	            }); // 월 select / 카테고리 매출
	            
	            // 구매자 성별
	            var context = document.getElementById('selectMonthChart').getContext('2d');
	            var myChart = new Chart(context, {
	                type: 'doughnut', // 차트의 형태
	                data: { // 차트에 들어갈 데이터
	                    labels: [
	                        // 카테고리 명
	                        '1','2','3','4','5','6','7'
	                    ],
	                    datasets: [
	                        { //데이터
	                            label: 'test1', //차트 제목
	                            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	                            data: [
	                                21,19,25,20,23,26,25 // 그래프 각각의 값
	                            ],
	                            backgroundColor: [
	                                //색상
	                                'rgba(255, 99, 132, 0.2)',
	                                'rgba(54, 162, 235, 0.2)',
	                                'rgba(255, 206, 86, 0.2)',
	                                'rgba(75, 192, 192, 0.2)',
	                                'rgba(153, 102, 255, 0.2)',
	                                'rgba(255, 159, 64, 0.2)'
	                            ],
	                            borderColor: [
	                                //경계선 색상
	                                'rgba(255, 99, 132, 1)',
	                                'rgba(54, 162, 235, 1)',
	                                'rgba(255, 206, 86, 1)',
	                                'rgba(75, 192, 192, 1)',
	                                'rgba(153, 102, 255, 1)',
	                                'rgba(255, 159, 64, 1)'
	                            ],
	                            borderWidth: 1 //경계선 굵기
	                        }/* ,
	                        {
	                            label: 'test2',
	                            fill: false,
	                            data: [
	                                8, 34, 12, 24
	                            ],
	                            backgroundColor: 'rgb(157, 109, 12)',
	                            borderColor: 'rgb(157, 109, 12)'
	                        } */
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
	            
	            
	            

			}); // function ready
			
		function salesReportPrint(){
			window.open('http://192.168.10.143/salesReportPrint.do','_blank', 'width=700px,height=800px,scrollbars=yes');
		
			
		}
			
			
			
			
</script>
	  
</body>
</html>