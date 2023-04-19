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
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- google icon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
	
	
    
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


</style>
<body>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
    <div class="adminPage-wrapper">
        <div class="adminPage-header">
            <h1><a href="#">관리자 페이지 입니다.</a></h1>
        </div>
        <div class="adminPage-back">
            <div class="adminPage-sidebar">
                <ul>
                    <a>회원 관리</a>
                    <li><a href="/adminMemberPage.do?reqPage=1">회원등급 관리</a></li>
                </ul>
                <ul>
                    <a>매출 관리</a>
                    <li><a href="/adminTotalSalesManage.do?reqPage=1">전체 매출 관리</a></li>
                    <li><a href="/categorySalesManage.do">카테고리별 매출관리</a></li>
                </ul>
                <ul>
                    <a href="/adminProductPage.do">상품 관리</a>
                    <li><a href="/productConfirmManage.do">상품 등록 관리</a></li>
                    <li><a href="/productRegist.do"></a>상품 등록</li>
                    <li><a href="/deliveryManage.do"></a>배송 관리</li>
                </ul>
                <ul>
                    <a>이벤트 관리</a>
                    <li>쿠폰 발행 관리</li>
                </ul>
                <ul>
                    <a href="/adminBoardManagePage.do">여기여기붙어라 관리</a>
                    <li>여기여기붙어라 게시판 관리</li>
                    <li>여기여기붙어라 신고 관리</li>
                    <li>카테고리별 매출관리</li>
                </ul>
            </div>
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
	        				<span class="salesCount">원</span>
	        			</div>
	        		</div>
	        	</div>
	        	<div class="totalSalesChart">
	        		<canvas id="myChart"></canvas>
	        	</div>
	        	<div class="monthSalesChart">
	        		
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
		    success: function(data) {
		    	console.log(data);
			      // Chart.js 옵션 설정
			      const options = {
			        // 옵션 설정 내용
			    	responsive: true, // 차트 크기 자동으로 조정할지?
			    	maintainAspectRatio: false, // 종횡비를 유지할지?
			    	title: { // 차트 제목 관련 옵션 설정
			            display: true, // 제목 표시?
			            text: '총 매출액', // 제목
			            fontSize: 20, // 제목 글꼴 사이즈
			            fontColor: '#333' // 제목 글꼴 색상
			        },
			        legend: { // 범례 옵션 설정
			            display: true, // 범례 표시?
			            position: 'bottom', // 범례 위치는 어디?
			            labels: { // 범례 라벨 관련 옵션
			                fontColor: '#333', // 범례 글꼴 색상
			                fontSize: 14 // 범례 글꼴 사이즈
			            }
			        },
			        scales: { // 축 관련 옵션 설정
			            xAxes: [{ // x축 관련 옵션
			                gridLines: { // x축 그리드 라인 옵션
			                    display: true, // 그리드 라인 표시?
			                    color: '#ddd', // 그리드 라인 색상
			                    drawBorder: false // 축과 그리드 라인 사이의 경계선 넣어?
			                },
			                ticks: { // x축 눈금선 관련 옵션
			                    fontColor: '#333',
			                    fontSize: 14
			                }
			            }],
			            yAxes: [{
			                gridLines: {
			                    display: true,
			                    color: '#ddd',
			                    drawBorder: false
			                },
			                ticks: {
			                    fontColor: '#333',
			                    fontSize: 14,
			                    beginAtZero: true
			                }
			            }]
			        }
			
			      }; // option
			
			      // Chart.js 데이터 설정
			      const chartData = {
		    		  labels: [data[0].monthNo, data[1].monthNo, data[2].monthNo,data[3].monthNo, 
		    			  data[4].monthNo,data[5].monthNo,data[6].monthNo,data[7].monthNo,data[8].monthNo,
		    			  data[9].monthNo,data[10].monthNo,data[11].monthNo], // x 축에 표시되는 레이블
		    		  
		    		  datasets: [{
		    		    label: '월 매출액',
		    		    data: [data[0].totalSales,data[1].totalSales,data[2].totalSales,data[3].totalSales,
		    		    	data[4].totalSales,data[5].totalSales,data[6].totalSales,data[7].totalSales,data[8].totalSales,
		    		    	data[9].totalSales,data[10].totalSales,data[11].totalSales],
		    		    backgroundColor: 'rgba(255, 99, 132, 0.2)',
		    		    borderColor: 'rgba(255,99,132,1)',
		    		    borderWidth: 1
		    		  },
		    		  {
		    		    label: '매출 원가',
		    		    type : 'line', // 데이터 표시방법
		    		    data: [data[0].totalCost,data[1].totalCost,data[2].totalCost,data[3].totalCost,data[4].totalCost,
		    		    	data[5].totalCost,data[6].totalCost,data[7].totalCost,data[8].totalCost,data[9].totalCost,data[10].totalCost,
		    		    	data[11].totalCost], 
		    		    backgroundColor: 'rgba(54, 162, 235, 0.2)',
		    		    borderColor: 'rgba(54, 162, 235, 1)',
		    		    borderWidth: 1
		    		  }]
			      
			      }; //chartData
			
			      // 차트 렌더링
			      const ctx = $("#myChart")[0].getContext("2d");
			      const myChart = new Chart(ctx, {
			        type: data.type,
			        data: chartData,
			        options: options
			        
			      }); // myChart
		    	
		    }
	  });
	  
    });
  
  </script>
	  
</body>
</html>