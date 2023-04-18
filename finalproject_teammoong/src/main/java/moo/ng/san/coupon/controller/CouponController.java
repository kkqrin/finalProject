package moo.ng.san.coupon.controller;

import java.time.LocalDate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import moo.ng.san.coupon.model.service.CouponService;
import moo.ng.san.coupon.model.vo.Coupon;
import moo.ng.san.coupon.model.vo.CouponPageData;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.coupon.model.vo.PointPageData;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.vo.Member;

@Controller
public class CouponController {
	@Autowired
	private CouponService service;
	
	@Scheduled(cron="0 0 0 * * *")
	public void sendBirthdayCoupon() {	
		LocalDate today = LocalDate.now();
		String[] dateParts = today.toString().split("-");
		int todayMonth = Integer.parseInt(dateParts[1]);
		int todayDay = Integer.parseInt(dateParts[2]);
		ArrayList<Member> list = service.selectAllMember();
		String couponTitle = "생일쿠폰";
		Coupon c = service.selectOneCoupon(couponTitle);		
		for(Member m : list) {
			int memberNo = m.getMemberNo();
			IssueCoupon ic = new IssueCoupon();
			ic.setCouponNo(c.getCouponNo());
			ic.setMemberNo(memberNo);
			String memberBday = m.getMemberBday();
			String[] parts = memberBday.split("-");
		    int month = Integer.parseInt(parts[1]);
		    int day = Integer.parseInt(parts[2]);
		    if(todayMonth == month && todayDay == day) {
		    	int result = service.insertIssueCoupon(ic);
		    	System.out.println(result);
		    }

		}
	}
	@Scheduled(cron="0 0 0 * * *")
	public void EndCoupon() {
		LocalDate today = LocalDate.now();
		String date = today.toString();
		
		ArrayList<IssueCoupon> list = service.selectAllIssueCoupon();		
		for(IssueCoupon ic : list) {
			int issueNo = ic.getIssueNo();
			String endDate = ic.getEndDate();
		
			int couponStatus = ic.getCouponStatus();
		
		    if(date.equals(endDate) && couponStatus == 1) {
		    	int result = service.updateIssueCoupon(issueNo);
		    	System.out.println(result);
		    }

		}
	}
	@RequestMapping(value="/couponSearch.do")
	public String couponSearch(int reqPage, int memberNo, Model model) {
		CouponPageData cpd = service.selectIssueCouponList(reqPage, memberNo);		
		System.out.println(cpd);
		model.addAttribute("couponList",cpd.getCouponList());
		model.addAttribute("CouponPageNavi", cpd.getPageNavi());
		
		return "member/couponSearch";
	}
	@RequestMapping(value="/pointSearch.do")
	public String pointSearch(int reqPage, int memberNo, Model model) {		
		PointPageData ppd = service.selectAllPoint(reqPage, memberNo);
		
		model.addAttribute("pointList",ppd.getPointList());
		model.addAttribute("PointPageNavi",ppd.getPageNavi());
		return "member/pointSearch";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/pointCheck.do")
	public int pointCheck(int memberNo) {
		ArrayList<Point> list = service.selectAllPointMember(memberNo);
		int totalPoint = 0;
		if(!list.isEmpty()) {
			for(Point p: list) {
				int pointStatus = p.getPointStatus();
				int pointEa = p.getPointEa(); // pointEa 변수는 if문 밖에서 선언해야 함
				if(pointStatus == 3) {
					totalPoint -= pointEa; // minusPoint를 따로 선언하지 않고 바로 totalPoint에 빼줌
				} else {
					totalPoint += pointEa; // plusPoint를 따로 선언하지 않고 바로 totalPoint에 더해줌
				}
			}
		}
		return totalPoint;
	}
	
}
