package moo.ng.san.coupon.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.coupon.model.dao.CouponDao;
import moo.ng.san.coupon.model.vo.Coupon;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.member.model.vo.Member;

@Service
public class CouponService {
	@Autowired
	private CouponDao dao;

	public ArrayList<Member> selectAllMember() {
		ArrayList<Member> list = dao.selectAllMember();
		return list;
	}

	public Coupon selectOneCoupon(String couponTitle) {
		Coupon c = dao.selectOneCoupon(couponTitle);
		return c;
	}

	public int insertIssueCoupon(IssueCoupon ic) {
		int result = dao.insertIssueCoupon(ic);
		return result;
	}

	public ArrayList<IssueCoupon> selectAllIssueCoupon() {
		ArrayList<IssueCoupon> list = dao.selectAllIssueCoupon();
		return list;
	}

	public int updateIssueCoupon(int issueNo) {
		int result = dao.updateIssueCoupon(issueNo);
		return result;
	}

}
