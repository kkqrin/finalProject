<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script type="text/javascript">

$(document).ready(function() {
	  
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
	    		  labels: [1,2,3,4,5,6,7,8,9,10,11,12],
	    			  
	    			  /* [data[0].monthNo, data[1].monthNo, data[2].monthNo,data[3].monthNo, 
	    			  data[4].monthNo,data[5].monthNo,data[6].monthNo,data[7].monthNo,data[8].monthNo,
	    			  data[9].monthNo,data[10].monthNo,data[11].monthNo], */ // x 축에 표시되는 레이블
	    		  
	    		  datasets: [{
	    		    label: '월 매출액',
	    		    data: [10,20,30,40,50,60,70,80,90,100,110,120],
	    		    	
	    		    	/* [data[0].totalSales,data[1].totalSales,data[2].totalSales,data[3].totalSales,
	    		    	data[4].totalSales,data[5].totalSales,data[6].totalSales,data[7].totalSales,data[8].totalSales,
	    		    	data[9].totalSales,data[10].totalSales,data[11].totalSales], */
	    		    	
	    		    backgroundColor: [
	    		    	'rgba(255, 99, 132, 0.2)',
	    		    	'rgba(254, 99, 132, 0.2)',
	    		    	'rgba(253, 99, 132, 0.2)',
	    		    	'rgba(252, 99, 132, 0.2)',
	    		    	'rgba(251, 99, 132, 0.2)',
	    		    	'rgba(250, 99, 132, 0.2)',
	    		    	'rgba(259, 99, 132, 0.2)',
	    		    	'rgba(258, 99, 132, 0.2)',
	    		    	'rgba(257, 99, 132, 0.2)',
	    		    	'rgba(256, 99, 132, 0.2)',
	    		    	'rgba(255, 99, 132, 0.2)',
	    		    	'rgba(254, 99, 132, 0.2)'
	    		    	],
	    		    borderColor: 
	    		    	[
	    		    	'rgba(255,99,132,1)',
	    		    	'rgba(254,99,132,1)',
	    		    	'rgba(253,99,132,1)',
	    		    	'rgba(252,99,132,1)',
	    		    	'rgba(251,99,132,1)',
	    		    	'rgba(250,99,132,1)',
	    		    	'rgba(259,99,132,1)',
	    		    	'rgba(258,99,132,1)',
	    		    	'rgba(257,99,132,1)',
	    		    	'rgba(256,99,132,1)',
	    		    	'rgba(255,99,132,1)',
	    		    	'rgba(254,99,132,1)'
	    		    	],
	    		    borderWidth: 1
	    		  },
	    		  
	    		  {
	    		    label: '매출 원가',
	    		    type : 'line', // 데이터 표시방법
	    		    data: 
	    		    	[5,6,7,8,9,10,11,12,13,14,15,16],
	    		    	/* [data[0].totalCost,data[1].totalCost,data[2].totalCost,data[3].totalCost,data[4].totalCost,
	    		    	data[5].totalCost,data[6].totalCost,data[7].totalCost,data[8].totalCost,data[9].totalCost,data[10].totalCost,
	    		    	data[11].totalCost],  */
	    		    backgroundColor: 
	    		    	[
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)',
	    		    	'rgba(54, 162, 235, 0.2)'
	    		    	],
	    		    borderColor: 
	    		    	[
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)',
	    		    	'rgba(54, 162, 235, 1)'
	    		    	],
	    		    borderWidth: 1 // 경계선 굵기
	    		  }]
		      
		      }; //chartData
		
		      // 차트 렌더링
		      const ctx = $("#myChart")[0].getContext("2d");
		      const myChart = new Chart(ctx, {
		        type: chartData.type, // 데이터 설정값이랑 맞춰
		        data: chartData,
		        options: options
		        
		      }); // myChart
	  
	 
  });
  
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
	
	      };
	
	      // Chart.js 데이터 설정
	      const chartData = {
    		  labels: [data[0].monthNo, data[1].monthNo, data[2].monthNo,data[3].monthNo, data[4].monthNo,data[5].monthNo,data[6].monthNo,data[7].monthNo,data[8].monthNo,data[9].monthNo,data[10].monthNo,data[11].monthNo],
    		  datasets: [{
    		    label: 'Dataset 1',
    		    data: [data[0].totalSales,data[1].totalSales,data[2].totalSales,data[3].totalSales,data[4].totalSales,data[5].totalSales,data[6].totalSales,data[7].totalSales,data[8].totalSales,data[9].totalSales,data[10].totalSales,data[11].totalSales,data[12].totalSales],
    		    backgroundColor: 'rgba(255, 99, 132, 0.2)',
    		    borderColor: 'rgba(255,99,132,1)',
    		    borderWidth: 1
    		  },
    		  {
    		    label: 'Dataset 2',
    		    type : 'line',
    		    data: [20, 30, 10, 50, 60, 40, 70],
    		    backgroundColor: 'rgba(54, 162, 235, 0.2)',
    		    borderColor: 'rgba(54, 162, 235, 1)',
    		    borderWidth: 1
    		  }]
	      };
	
	      // 차트 렌더링
	      const ctx = $("#myChart")[0].getContext("2d");
	      const myChart = new Chart(ctx, {
	        type: data.type,
	        data: chartData,
	        options: options
	      });
    	
    }
});
</script>
</body>
</html>