package common;

import java.util.Random;

import org.springframework.stereotype.Component;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Component
public class PhoneCertify {

	public String PhoneCheck(String memberPhone) {
			
			//★휴대폰 인증을 위한 랜덤코드 생성 //숫자 6자리
			String code = "";
			
			Random r = new Random();
			for(int i=0 ; i<6 ; i++) {
				int num = r.nextInt(9); // 0부터 [매개변수]까지의 개수 중 랜덤한 수 하나
				String c = Integer.toString(num);
				code += c;
			}
			
			DefaultMessageService messageService =  NurigoApp.INSTANCE.initialize("NCS1HRUA7F60AWQU", "ZYAGXMQQG0M6C6LFQGHMQZOVYAXSZ3Q0", "https://api.solapi.com");
			// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
			Message message = new Message();
			message.setFrom("01096418864");
			message.setTo(memberPhone);
			message.setText("뭉쳐야산다 인증번호는 ["+code+"]입니다.");
	
			try {
			  // send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			  messageService.send(message);
			} catch (NurigoMessageNotReceivedException exception) {
			  // 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			  System.out.println(exception.getFailedMessageList());
			  System.out.println(exception.getMessage());
			} catch (Exception exception) {
			  System.out.println(exception.getMessage());
			}
	
			return code;
		}//핸드폰 인증 메시지 보내기
	
	
}//PhoneCertify

