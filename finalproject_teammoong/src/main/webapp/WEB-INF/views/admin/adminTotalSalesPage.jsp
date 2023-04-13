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
    <!-- chart -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
    
    <!-- chart 부트스트랩 -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  
  <script>
	  
  	$.ajax({
  		url : "/ajaxTotalSalesChart.do",
  		type : "get",
  		success : function(data){
		    var ctx = document.getElementById('myChart');
		    var myChart = new Chart(ctx, {
		      type: 'bar',
		      data: {
		        labels: ['패션', '뷰티', '식품', '생활용품', '가전/디지털', '가구', '침구', '인테리어', '공구','스포츠/레저/취미','출산/유아동','반려용품','명품관'],
		        datasets: [{
		          label: '# of Votes',
		          data: [data[0], data[1], data[2], data[3], data[4], data[5],data[6],data[7],data[8],data[9],data[10],data[11],data[12],data[13]],
		          backgroundColor: [
		            'rgba(255, 99, 132, 0.2)',
		            'rgba(54, 162, 235, 0.2)',
		            'rgba(255, 206, 86, 0.2)',
		            'rgba(75, 192, 192, 0.2)',
		            'rgba(153, 102, 255, 0.2)',
		            'rgba(255, 99, 132, 0.2)',
		            'rgba(54, 162, 235, 0.2)',
		            'rgba(255, 206, 86, 0.2)',
		            'rgba(75, 192, 192, 0.2)',
		            'rgba(153, 102, 255, 0.2)',
		            'rgba(153, 102, 255, 0.2)',
		            'rgba(153, 102, 255, 0.2)',
		            'rgba(255, 159, 64, 0.2)'
		          ],
		          borderColor: [
		            'rgba(255, 99, 132, 1)',
		            'rgba(54, 162, 235, 1)',
		            'rgba(255, 206, 86, 1)',
		            'rgba(75, 192, 192, 1)',
		            'rgba(153, 102, 255, 1)',
		            'rgba(255, 99, 132, 1)',
		            'rgba(54, 162, 235, 1)',
		            'rgba(255, 206, 86, 1)',
		            'rgba(75, 192, 192, 1)',
		            'rgba(153, 102, 255, 1)',
		            'rgba(153, 102, 255, 1)',
		            'rgba(255, 206, 86, 1)',
		            'rgba(255, 159, 64, 1)'
		          ],
		          borderWidth: 1
		        }]
		      },
		      options: {
		        scales: {
		          yAxes: [{
		            ticks: {
		              beginAtZero: true
		            }
		          }]
		        }
		      }
		    });
  		},error{
  			console.log("다시해보세요")
  		}
  		
  	});
  	
	  
    
	</script>
    
</body>
</html>