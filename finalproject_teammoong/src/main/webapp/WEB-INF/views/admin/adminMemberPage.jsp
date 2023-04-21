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
</head>
<style>
    .adminPage-wrapper{
        background-color: #111;
        margin-top: 300px;
        
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
    .table{
    	border: 1px solid black;
    }
    .table>tbody>tr>th{
    	border: 1px solid black;
    }
    .table>tbody>tr>td{
    	border: 1px solid black;
    }
    .searchForm{
    	display: none;
    }
    



</style>
<body>
    <c:if test="${not empty sessionScope.m and sessionScope.m.memberStatus == 0}">
        <!-- 관리자일때만 페이지 보이게 세팅 -->
    </c:if>
    <div class="adminPage-wrapper" id="adminMemberTable">
        <div class="adminPage-header">
            <h1><a href="#">Admin-Page</a></h1>
        </div>
        <div class="adminPage-back">
            <jsp:include page="/WEB-INF/views/admin/adminSideNavi.jsp"/>
            <div class="adminPage-main">
                <div class="adminPage-content">
                    <div class="adminPage-search">
                        <select id="memberSearchSelect">
                            <option id="searchMemberNo" value="memberNo">회원번호 검색</option>
                            <option id="searchMemberId" value="memberId">회원 아이디 검색</option>
                            <option id="searchMemberName" value="memberName">회원 이름 검색</option>
                        </select>
                        <input type="text" name="memberSearchBox" id="searchOption">
                        <button type="button" name="searchSubmitBtn">검색</button>
                    </div>
                    <div class="adminPage-result">
                        <table class="table">
                            <tr>
                            	<th>구분</th>
                                <th>회원번호</th>
                                <th>회원아이디</th>
                                <th>이름</th>
                                <th>이메일</th>
                                <th>전화번호</th>
                                <th>주소</th>
                                <th>성별</th>
                                <th>생년월일</th>
                                <th>은행정보</th>
                                <th>계좌번호</th>
                                <th>회원등급</th>
                                <th>마케팅 동의 여부</th>
                                <th>가입일</th>
                                <th>회원등급 변경</th>
                                <th>확정버튼</th>
                            </tr>
                            <c:forEach items="${memberList }" var="m">
                                <tr>
                                	<td><input type="checkBox" class="checkBox"></td>
                                    <td>${m.memberNo }<input type="hidden" class="memberNo" value="${m.memberNo }"></td>
                                    <td>${m.memberId }<input type="hidden" class="memberId" value="${m.memberId }"></td>
                                    <td>${m.memberName }</td>
                                    <td>${m.memberEmail }</td>
                                    <td>${m.memberPhone }</td>
                                    <td>${m.memberAddr }</td>
                                    <c:choose>
                                    	<c:when test="${m.memberGender == 1 }">
                                    		<td>남성</td>
                                    	</c:when>
                                    	<c:when test="${m.memberGender == 2 }">
                                    		<td>여성</td>
                                    	</c:when>
                                    	<c:when test="${m.memberGender == 3 }">
                                    		<td>성별없음</td>
                                    	</c:when>
                                    </c:choose>
                                    <td>${m.memberBday }</td>
                                    <td>${m.memberBank }</td>
                                    <td>${m.memberAccount }</td>
                                    <c:choose>
                                        <c:when test="${m.memberStatus == 0}">
                                            <td>관리자</td>
                                        </c:when>
                                        <c:when test="${m.memberStatus == 1}">
                                            <td>정상회원</td>
                                        </c:when>
                                        <c:when test="${m.memberStatus == 2}">
                                            <td>정지회원</td>
                                        </c:when>
                                        <c:when test="${m.memberStatus == 3}">
                                            <td>탈퇴회원</td>
                                        </c:when>
                                    </c:choose>
                    				<input type="hidden" class="memberStatus" value="${m.memberStatus }">
                                    <c:choose>
                                        <c:when test="${m.memberAgree == 0}">
                                            <td>동의안함</td>
                                        </c:when>
                                        <c:when test="${m.memberAgree == 1}">
                                            <td>동의</td>
                                        </c:when>
                                    </c:choose>
                                    <td>${m.regDate }</td>
                                    <td>
	                                    <c:choose>
	                                        <c:when test="${m.memberStatus == 0}">
		                                         <select name="memberStatusList" class="memberStatusList">
		                                            <option value="0" selected>관리자</option>
		                                            <option value="1">정상회원</option>
		                                            <option value="2">정지회원</option>
		                                            <option value="3">탈퇴회원</option>
	                                       		 </select>
	                                        </c:when>
	                                        <c:when test="${m.memberStatus == 1}">
		                                         <select name="memberStatusList" class="memberStatusList">
		                                            <option value="0">관리자</option>
		                                            <option value="1" selected>정상회원</option>
		                                            <option value="2">정지회원</option>
		                                            <option value="3">탈퇴회원</option>
	                                       		 </select>
	                                        </c:when>
	                                        <c:when test="${m.memberStatus == 2}">
		                                         <select name="memberStatusList" class="memberStatusList">
		                                            <option value="0">관리자</option>
		                                            <option value="1">정상회원</option>
		                                            <option value="2" selected>정지회원</option>
		                                            <option value="3">탈퇴회원</option>
	                                       		 </select>
	                                        </c:when>
	                                        <c:when test="${m.memberStatus == 3}">
		                                         <select name="memberStatusList" class="memberStatusList">
		                                            <option value="0">관리자</option>
		                                            <option value="1">정상회원</option>
		                                            <option value="2">정지회원</option>
		                                            <option value="3" selected>탈퇴회원</option>
	                                       		 </select>
	                                        </c:when>
	                                    </c:choose>
                                    </td>
                                    <td>
                                    	<button type="button" class="changeMemberStatusBtn">회원등급 변경</button>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th colspan="16">${pageNavi}</th>
                            </tr>
                            <tr>
                                <th colspan="2"><button type="button" name="allChangeMemberStatus">일괄 변경</th>
                            </tr>
	                        <form name="searchForm" method="POST" action="" class="">
	                       		<button type="button" onclick="exportToExcel();">엑셀출력</button>
	                        </form><!--  -->
                        </table>
                        <!-- 엑셀용 -->
                    </div>
                    <div id="ajaxResult" class="table"></div>
                </div>
            </div>
            
        </div>
    </div>

<!-- 스크립트를 넣어봅시다 -->
    <script>
    /* 등급 변경 */
    	$(".changeMemberStatusBtn").on("click",function(){
    		var memberNo = $(this).parent().parent().children().eq(1).text();
    		var memberStatus = $(this).parent().prev().children().val();
    		
            $.ajax({
                url: "/ajaxChangeMemberStatus.do",
                type: "POST",
                data: {memberStatus : memberStatus, memberNo : memberNo},
                success: function(data) {
                	if(data == "ok"){
                		$("#adminMemberTable").load(location.href+ '#adminMemberTable');
                	}else{
	    				console.log("다시 시도");
                		
                	}
                }
            })
    		
    	});
    
    /* 일괄 변경 */
    
    $("[name=allChangeMemberStatus]").on("click",function(){
    	const check = $(".checkBox:checked");
		if(check.length == 0){
			alert("선택된 회원이 없습니다.");
			return;
		}
			const no = new Array();
			//체크된 회원의 등급을 저장할 배열
			const level = new Array();
			//체크된 체크박스 기준으로 회원번호, 등급을 찾아서 배열에 넣는 작업
		
			check.each(function(index, item){
				const memberNo = $(item).parent().next().text();
				no.push(memberNo);
				//check기준으로 td -> tr -> 후손중에 select찾기
				const memberLevel = $(item).parent().parent().find("select").val();
				level.push(memberLevel);
			});
			
			location.href="/checkedChangeMemberStatus.do?no="+no.join("/")+"&level="+level.join("/");
            
	});
            
            
        /* 검색기능 */
         $("[name=searchSubmitBtn]").on("click",function(){
        	 var memberSearchOption = $("#memberSearchSelect option:selected").val();
         	 var memberNo = $("#searchMemberNo").val();
        	 var memberId = $("#searchMemberId").val();
        	 var memberName = $("#searchMemberName").val();
        	 var memberSearchBox = $("[name=memberSearchBox]").val();
  
        	 
        	 if(memberSearchOption == 'memberNo'){
        		 memberNo = memberSearchBox;
        		 memberId = '';
	        	 memberName = '';
        		 
        	 }else if(memberSearchOption == 'memberId'){
        		 memberId = memberSearchBox;
        		 memberNo = 0;
        		 memberName = '';
        		 
        	 }else if(memberSearchOption == 'memberName'){
        		 memberName = memberSearchBox;
        		 memberNo = 0;
        		 memberId = '';
        	 }
        	 
        	 
         	 $.ajax({
                 url: "/ajaxAdminSearchMember.do",
                 type: "POST",
                 data: {memberNo : memberNo, memberId : memberId, memberName : memberName},
                 success: function(data) {
                 	if(data){
                 		$("#ajaxResult").empty();
                 			$(".adminPage-result").hide();
							const table =$("<table>");
							const titleTr = $("<tr>");
							titleTr.html("<th>구분</th><th>회원번호</th><th>회원아이디</th><th>이름</th><th>이메일</th><th>전화번호</th><th>주소</th><th>성별</th><th>생년월일</th><th>은행정보</th><th>계좌번호</th><th>회원등급</th><th>마케팅 동의 여부</th><th>가입일</th><th>회원등급 변경</th><th>확정버튼</th>");
							table.append(titleTr);
							for(let i=0;i<data.length;i++){
								const tr = $("<tr>");
								tr.append("<td>"+"</td>")
								tr.append("<td>"+data[i].memberNo+"</td>");
								tr.append("<td>"+data[i].memberId+"</td>");
								tr.append("<td>"+data[i].memberName+"</td>");
								tr.append("<td>"+data[i].memberEmail+"</td>");
								tr.append("<td>"+data[i].memberPhone+"</td>");
								tr.append("<td>"+data[i].memberAddr+"</td>");
								
								if(data[i].memberGender == 1){
									tr.append("<td>남자</td>");
								}else if(data[i].memberGender == 2){
									tr.append("<td>여자</td>");
								}else if(data[i].memberGender == 3){
									tr.append("<td>성별없음</td>");
								}
								
								tr.append("<td>"+data[i].memberBday+"</td>");
								tr.append("<td>"+data[i].memberBank+"</td>");
								
								if(data[i].memberAccount == undefined){
									tr.append("<td>계좌 등록 안함</td>");
								}else{
									tr.append("<td>"+data[i].memberAccount+"</td>");
								}
								
								if(data[i].memberStatus == 0){
									tr.append("<td>관리자</td>");
								}else if(data[i].memberStatus == 1){
									tr.append("<td>정상회원</td>");
								}else if(data[i].memberStatus == 2){
									tr.append("<td>정지회원</td>");
								}else if(data[i].memberStatus == 3){
									tr.append("<td>탈퇴회원</td>");
								}
								
								if(data[i].memberAgree == 0){
									tr.append("<td>동의함</td>");
								}else if(data[i].memberAgree == 1){
									tr.append("<td>동의하지 않음</td>");
								}
								
								tr.append("<td>"+data[i].regDate+"</td>");
								tr.append("<td>"+data[i].memberNo+"</td>");
								tr.append("<td>"+data[i].memberNo+"</td>");
								table.append(tr);
						}
						$("#ajaxResult").append(table);
                 		
                 	}else{
 	    				console.log("다시 시도");
                 	}
                 }
             })        		 
         });
    	
    	
        
        
    </script>
</body>
</html>