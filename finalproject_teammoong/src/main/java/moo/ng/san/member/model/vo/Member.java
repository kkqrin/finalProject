package moo.ng.san.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberAddr;
	private int memberGender;
	private String memberBday; // 카멜표기법에는 대문자가 연속으로 들어올수 없어서 변경(강사님)
	private String memberAccount;
	private String memberPath;
	private int memberAgree;
	private int memberStatus;
	private String memberBank;
	private String regDate;
	private String memberZoneCode;

}
