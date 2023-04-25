let forDmMemberId;
let ws;

	$(function(){
		forDmMemberId = $("#memberId").val();
		ws = new WebSocket("ws://192.168.10.41/dm.do");
		ws.onopen = startDm;
		ws.onmessage = receiveMsg;
		ws.onclose = endDm;
	});
	
	
	function startDm(){
		const data = {type:"enter",memberId:forDmMemberId};
		ws.send(JSON.stringify(data)); //객체를 긴 문자열로 바꿔서 보내줘야 함
	}
	
	
	function receiveMsg(param){
		//★session.sendMessage()을 사용해서 값을 넘겨주면 여기로 넘어온다
		//ajax가 아니기때문에 json으로 받을 수가 없다.
		//그래서 전송받은 문자열을 객체 형식으로 인식시켜줘야한다
		const result = JSON.parse(param.data);
		
		if(result.type=="myDmCount"){
			$("#dmCount").text(result.dmCount);
		}
	}
	
	
	function endDm(){
		//안쓸거여도 함수 선언은 해 둬야 함
	}