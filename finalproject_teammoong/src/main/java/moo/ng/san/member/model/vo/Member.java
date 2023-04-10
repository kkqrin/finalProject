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
	private String memberBDay;
	private String memberAccount;
	private String memberPath;
	private int memberAgree;
	private int memberStatus;
	private String memberBank;
	private String regDate;

}
