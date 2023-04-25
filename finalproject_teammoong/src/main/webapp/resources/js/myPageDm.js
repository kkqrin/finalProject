function getReceiveDm(){
    const memberId = $("#memberId").val();
    $.ajax({
        url : "/myDmList.do",
        data : {dmReceiver:memberId},
        success : function(list){
            const tbody = $(".receiveDmTbl>tbody");
            tbody.empty();
            for(let i = 0 ; i<list.length ; i++){
                const dm = list[i];
                const tr = $("<tr>");
                
                const td1 = $("<td>");
                td1.text(dm.rnum);
                
                const td2 = $("<td>");
                const td2Div = $("<div>");
                td2Div.css({"width":"478px","height":"20px","overflow":"hidden","cursor":"pointer","white-space": "nowrap","text-overflow": "ellipsis"});
                td2Div.text(dm.dmContent);
                td2.attr("onclick","dmView("+dm.dmNo+");");
                td2.append(td2Div);
                
                
                const td3 = $("<td>");
                td3.text(dm.dmSenderName);
                
                const td4 = $("<td>");
                td4.text(dm.dmDate);
                
                const td5 = $("<td>");
                if(dm.dmReadChk == 0){
                    tr.addClass("bold");
                    td5.text("읽지않음");
                }else{
                    td5.text("읽음");
                }
                tr.append(td1).append(td2).append(td3).append(td4).append(td5);
                tbody.append(tr);
            }
        }
    })
}




function getSendDm(){
    const memberId = $("#memberId").val();
    $.ajax({
        url : "/myDmList.do",
        data : {dmSender:memberId},
        success : function(list){
            const tbody = $(".sendDmTbl>tbody");
            tbody.empty();
            for(let i = 0 ; i<list.length ; i++){
                const dm = list[i];
                const tr = $("<tr>");
                
                const td1 = $("<td>");
                td1.text(dm.rnum);
                
                const td2 = $("<td>");
                const td2Div = $("<div>");
                td2Div.css({"width":"478px","height":"20px","overflow":"hidden","cursor":"pointer","white-space": "nowrap","text-overflow": "ellipsis"});
                td2Div.text(dm.dmContent);
                td2.attr("onclick","dmView("+dm.dmNo+");");
                td2.append(td2Div);
                
                const td3 = $("<td>");
                td3.text(dm.dmReceiverName);
                
                const td4 = $("<td>");
                td4.text(dm.dmDate);
                
                tr.append(td1).append(td2).append(td3).append(td4);
                tbody.append(tr);
            }
        }
    })
}




function dmView(dmNo){
	const memberId = $("#memberId").val();
    $.ajax({
        url : "/dmView.do",
        data : {dmNo:dmNo,memberId:memberId},
        success : function(dm){
            $("#viewSender").text("보낸 사람 : "+dm.dmSenderName+"("+dm.dmSender+")");
            $("#replyToId").val(dm.dmSender);
            $("#viewReceiver").text("받은 사람 : "+dm.dmReceiverName+"("+dm.dmReceiver+")");
            $("#viewDate").text("보낸 날짜 : "+dm.dmDateHour);
            $("#viewContent").html(dm.dmContent.replaceAll("\n", "<br>"));
            $("#dmViewer").modal({
				 showClose: false,
	             fadeDuration: 100
	        });
	        console.log($("#dmViewer"));
            //상세화면 표시된 후 알림에 있는 수 깎아줘야 함-받은 사람의 헤더만
            if(memberId==dm.dmReceiver){
	            const sendData = {type:"readCheck",dmReceiver:dm.dmReceiver};
	            ws.send(JSON.stringify(sendData));
            }
        }
    })
}




function replyDm(){
	const memberId = $("#replyToId").val();
	location.href="/dmReply.do?receiver="+memberId;
}

