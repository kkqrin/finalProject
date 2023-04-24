package moo.ng.san.dm.model.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;



//최초접속 시 : 현재 내가 읽지 않은 쪽지 수를 가져옴
//다른사람이 접속한 사람한테 쪽지를 보낸 경우 : 접속한 사람의 쪽지 수 update
public class DirectMessageHandler extends TextWebSocketHandler{

	@Autowired
	private DmService service;
	
	//쪽지 실시간 알림에 접속한 회원을 관리할 Map (Key :  id, value:접속세션)
	private HashMap<String, WebSocketSession> connectionMemberList;
	
	public DirectMessageHandler() {
		super();
		connectionMemberList = new HashMap<String, WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//접속했을때 자동실행
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//★ws.send했을때는 무조건 이 메소드가 실행됨
		String receiveMsg = message.getPayload(); //ws.send로 보내준 값 받아오는거
		
		JsonElement element =JsonParser.parseString(receiveMsg);//가져온 값을 JSON으로 바꿔줌
		String type = element.getAsJsonObject().get("type").getAsString();
		
		if(type.equals("enter")) {
			String memberId = element.getAsJsonObject().get("memberId").getAsString();
			connectionMemberList.put(memberId,session); //최초접속이므로, 접속한 회원의 아이디를 map에 추가
			//현재 읽지 않은 쪽지를 조회해서 되돌려줘야 하기 때문에 service에 요청
			int dmCount = service.selectDmCount(memberId);
			JsonObject obj = new JsonObject();
			obj.addProperty("type", "myDmCount");
			obj.addProperty("dmCount", dmCount); // 객체처리 완
			String resultStr = new Gson().toJson(obj); //<--보내주는건 String타입이어야 하므로 객체를 스트링타입으로 변형
			TextMessage tm = new TextMessage(resultStr); //전송양식
			session.sendMessage(tm);
		}else if(type.equals("sendDm")) {//쪽지 받을 사람이 접속해있다면, 실시간으로 알림을 갱신해준다
			String memberId = element.getAsJsonObject().get("dmReceiver").getAsString();
			WebSocketSession dmReceiver = connectionMemberList.get(memberId);
			if(dmReceiver!=null) {//dmReceiver가 현재 접속중일 때만 코드 실행한다
				int dmCount = service.selectDmCount(memberId);
				JsonObject obj = new JsonObject();
				obj.addProperty("type", "myDmCount");
				obj.addProperty("dmCount", dmCount); //<--받아온 결과(dmCount)를 사용해서 객체처리 완
				String resultStr = new Gson().toJson(obj); //<--보내주는건 String타입이어야 하므로 객체를 스트링타입으로 변형
				TextMessage tm = new TextMessage(resultStr); //전송양식
				dmReceiver.sendMessage(tm);
			}//if
		}else if(type.equals("readCheck")) {
			String dmReceiver = element.getAsJsonObject().get("dmReceiver").getAsString(); //<--읽은쪽지 개수가 줄어야 하는 사람
			int dmCount = service.selectDmCount(dmReceiver);
			
			JsonObject obj = new JsonObject();
			obj.addProperty("type", "myDmCount");
			obj.addProperty("dmCount", dmCount);
			String resultStr = new Gson().toJson(obj);
			TextMessage tm = new TextMessage(resultStr);
			session.sendMessage(tm); //<-- 여기까지 . 쪽지를 읽은 회원의 읽지 않은 쪽지 수를 갱신함
		}//else if. type이 readCheck일때
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//접속을 끊었을 때 접속이 끊긴 회원을 HashMap에서 삭제해주기
		connectionMemberList.values().remove(session);
	}
	
}//DirectMessageHandler
