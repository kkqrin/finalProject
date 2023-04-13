package common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class SHA256Enc {

	public String encData(String data) throws Exception {//매개변수로 받은 문자열을 sha-256으로 암호화해서 문자열로 만들어서 리턴해주는 메소드
		
		String salt = "happyquokka";
		String pw = salt+data;
		
		//MessageDigest 객체를 이용한 암호화
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		
		//암호화 하고 싶은 문자열을 byte배열로 변환해서 mDigest에 넣어줌
		mDigest.update(pw.getBytes());
		
		//SHA-256으로 암호화된 데이터를 다시 꺼내옴
		byte[] msgStr = mDigest.digest();
		
		//byte는 -128~127 --> 0~255로 변환해서 사용 --> 00~ff로 16진수로 변환해서 사용
		StringBuffer sb = new StringBuffer();
		for(int i = 0 ; i<msgStr.length ; i++) {
			byte str = msgStr[i];
			String encText = Integer.toString((str & 0xff)+0x100,16).substring(1);
			sb.append(encText);
		}//for
		
		return sb.toString();
	}//encData
	
	
}//SHA256Enc
