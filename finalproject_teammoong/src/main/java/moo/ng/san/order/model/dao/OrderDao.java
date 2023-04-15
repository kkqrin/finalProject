package moo.ng.san.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.coupon.model.vo.IssueCoupon;

@Repository
public class OrderDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<IssueCoupon> selectMemberCouponList(int memberNo) {
		List list = sqlSession.selectList("issueCoupon.selectMemberCouponList", memberNo);
		
		return (ArrayList<IssueCoupon>) list;
	}

	public int selectMemberCouponCount(int memberNo) {
		int couponCount = sqlSession.selectOne("issueCoupon.selectMemberCouponCount", memberNo);
		
		return couponCount;
	}
	
}
