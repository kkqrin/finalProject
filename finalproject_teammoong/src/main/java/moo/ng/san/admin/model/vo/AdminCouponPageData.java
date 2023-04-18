package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.dayCheck.model.vo.DayCheck;
import moo.ng.san.dayCheck.model.vo.Point;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminCouponPageData {
	private ArrayList<IssueCoupon> couponList; // issueCoupon + couponTbl 컬럼 합쳐져있음
	private ArrayList<DayCheck> dcList; 
	private ArrayList<Point> pointList;
}
