package moo.ng.san.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CouponData {
	//member
	private String memberName;
	private String memberId;
	
	//issue_coupon
	private int issueNo;
	private int memberNo;
	private int couponNo;
	private String issueDate;
	private String endDate;
	private int couponStatus;
	private String couponTitle;
	private int couponPrice;
	
	//point_tbl
	private int pMemberNo;
	private int pointNo;
	private int pointEa; // 잔액
	private int usePointEa; // 사용금액
	private String pPointDate;
	private int pointStatus;
	
	
	//day_check
	private int dMemberNo;
	private int checkNo;
	private int dPointEa;
	private String checkDate;
}
