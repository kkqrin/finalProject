package moo.ng.san.coupon.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class IssueCoupon {
	private int issueNo;
	private int memberNo;
	private int couponNo;
	private String issueDate;
	private String endDate;
	private int couponStatus;
}
