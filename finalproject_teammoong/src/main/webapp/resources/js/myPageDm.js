
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
            //상세화면 표시된 후 알림에 있는 수 깎아줘야 함-받은 사람의 헤더만
            if(memberId==dm.dmReceiver){
	            const sendData = {type:"readCheck",dmReceiver:dm.dmReceiver};
	            ws.send(JSON.stringify(sendData));
            }
            $("#readOk").on("click",function(){
            	location.reload();
            })
        }
    })
}




function replyDm(){
	const memberId = $("#replyToId").val();
	location.href="/dmReply.do?receiver="+memberId;
}

