package moo.ng.san.coupon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
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

	public ArrayList<IssueCoupon> selectMemberIssueCoupon(HashMap<String, Object> map) {
		List couponList = sqlSession.selectList("issueCoupon.selectMemberIssueCoupon",map);
		return (ArrayList<IssueCoupon>) couponList;
	}

	public ArrayList<Point> selectAllPoint(HashMap<String, Object> map) {
		List pointList = sqlSession.selectList("point.selectAllPoint",map);
		return (ArrayList<Point>)pointList;
	}

	public int selectIssueCount(int memberNo) {
		int totalCount = sqlSession.selectOne("issueCoupon.totalCount",memberNo);
		return totalCount;
	}

	public int selectPointCount(int memberNo) {
		int totalCount = sqlSession.selectOne("point.totalCount", memberNo);
		return totalCount;
	}

	public ArrayList<Point> selectAllPointMember(int memberNo) {
		List list = sqlSession.selectList("point.selectAllPointMember",memberNo);
		System.out.println(list);
		return (ArrayList<Point>) list;
	}

	public int insertPoint(Point point) {
		int result = sqlSession.insert("point.insertChargePoint", point);
		return result;
	}
	
}
