package moo.ng.san.coupon.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Coupon {
	private int couponNo;
	private String couponTitle;
	private int couponPrice;
	private int couponEnd;
}
