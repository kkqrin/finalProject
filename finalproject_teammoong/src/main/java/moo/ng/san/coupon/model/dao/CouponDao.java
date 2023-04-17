package moo.ng.san.coupon.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.coupon.model.vo.Coupon;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.vo.Member;

@Repository
public class CouponDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> selectAllMember() {
		List list = sqlSession.selectList("member.selectAllMember");
		return (ArrayList<Member>) list;
	}

	public Coupon selectOneCoupon(String couponTitle) {
		Coupon c = sqlSession.selectOne("coupon.selectOneCoupon",couponTitle);
		return c;
	}

	public int insertIssueCoupon(IssueCoupon ic) {
		int result = sqlSession.insert("issueCoupon.insertIssueCoupon", ic);
		return result;
	}

	public ArrayList<IssueCoupon> selectAllIssueCoupon() {
		List list = sqlSession.selectList("issueCoupon.selectAllIssueCoupon");
		return (ArrayList<IssueCoupon>) list;
	}

	public int updateIssueCoupon(int issueNo) {
		int result = sqlSession.update("issueCoupon.updateIssueCoupon",issueNo);
		return result;
	}

	public ArrayList<IssueCoupon> selectAllIssueCoupon(int memberNo) {
		List couponList = sqlSession.selectList("issueCoupon.selectMemberIssueCoupon",memberNo);
		return (ArrayList<IssueCoupon>) couponList;
	}

	public ArrayList<Point> selectAllPoint(int memberNo) {
		List pointList = sqlSession.selectList("point.selectAllPoint",memberNo);
		return (ArrayList<Point>)pointList;
	}
	
}
