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
    <!-- data tables -->
	<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/> 
	<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
	<style>
		
		
	</style>
</head>
<body>
	<div class="salesReport">
		<div class="searchBtn"><a href="/ajaxSalesReportPrint.do">조회하기</a></div>
		<div class="salesReport-main" style="display: none">
			<table id="dataTables" class="table table-bordered">
				<tr>매출요약</tr>
				<tr>
					<td><div><canvas id="yearChart"></canvas></div></td>
					<td><div><canvas id="monthChart"></canvas></div></td>
				</tr>
			</table>
			<table id="sumTables" class="table table-bordered">
				<tr>
					<th style="width : 100px">매출액</th>
					<th style="text-align: right;" colspan="2">100</th>
				</tr>
				<!-- 매출 forEach 들어가야할 자리겠지 -->
				<tr>
					<td style="text-align: right">ㅇ</td>
					<td>의류</td>
					<td style="text-align: left">1000</td>
				</tr>
				
				<tr>
					<th style="width : 100px">매출원가</th>
					<th style="text-align: right;" colspan="2">1000</th>
				</tr>
				<!-- 매출원가 forEach 들어갈 자리 -->
				<tr>
					<td style="text-align: right">ㅇ</td>
					<td>의류</td>
					<td style="text-align: left">1000</td>
				</tr>
				
				<tr>
					<th style="width : 100px">당기순이익</th>
					<th style="text-align: right;" colspan="2">1</th>
				</tr>
			</table>
		</div>
	</div>
	
	
	
	
	
<script type="text/javascript">

	$(document).ready(function(){
		$("#sumTable").css("border-bottom-color","red")
	});

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