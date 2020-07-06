package kr.co.healthner.common;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import kr.co.healthner.mail.model.service.MailServiceImpl;

@Component("mailCheckScheduled")
public class MailCheckScheduled extends TextWebSocketHandler {

	private ArrayList<WebSocketSession> members;

	// 메일 체크를 위한 Service
	@Autowired
	@Qualifier("mailService")
	private MailServiceImpl service;

	public MailCheckScheduled() {
		members = new ArrayList<WebSocketSession>();
	}

	// 소켓이 생성되어 연결되었을 때 실행되는 메소드
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		System.out.println("연결 성공!!");
		members.add(session);// 신규 접속자 정보 저장
		loginMailCheck(session);
	}

	// 메세지를 수신하면 동작하는 메소드로 memberNo를 받아 처리한다
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 소켓으로 받은 메세지를 JSON 타입으로 변경하여 사용
		JsonParser parser = new JsonParser();

		JsonElement element = parser.parse(message.getPayload());
		int memberNo = Integer.parseInt(element.getAsJsonObject().get("memberNo").getAsString());

		if (memberNo != 0) {
			int count = service.mailCheck(memberNo);
			session.sendMessage(new TextMessage(String.valueOf(count)));
		}
	}

	// 연결이 끊겼을 때 동작하는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		System.out.println("연결 종료!!");
		members.remove(session);
	}

	// 매분 메일 테이블을 체크해서 연결된 페이지에 memberNo를 물어보는 메소드
	@Scheduled(cron = "0 0/1 * * * *")
	public void mailCheck() throws Exception {
		System.out.println("확인");
		for (WebSocketSession ws : members) {
			ws.sendMessage(new TextMessage("memberNo"));
		}
	}

	public void loginMailCheck(WebSocketSession ws) throws Exception {

		ws.sendMessage(new TextMessage("memberNo"));
	}
}
