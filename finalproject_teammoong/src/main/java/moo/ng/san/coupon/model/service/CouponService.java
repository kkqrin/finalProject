package moo.ng.san.coupon.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.coupon.model.dao.CouponDao;
import moo.ng.san.coupon.model.vo.Coupon;
import moo.ng.san.coupon.model.vo.CouponPageData;
import moo.ng.san.coupon.model.vo.IssueCoupon;
import moo.ng.san.coupon.model.vo.PointPageData;
import moo.ng.san.dayCheck.model.vo.Point;
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

	public int updateIssueCoupon(int issueNo) {
		int result = dao.updateIssueCoupon(issueNo);
		return result;
	}

	public ArrayList<IssueCoupon> selectAllIssueCoupon() {
		ArrayList<IssueCoupon> couponList = dao.selectAllIssueCoupon();
		return couponList;
	}

	public PointPageData selectAllPoint(int reqPage, int memberNo) {
		int numPerPage = 10;
		int end = reqPage *numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		ArrayList<Point> pointList = dao.selectAllPoint(map);
		int totalCount = dao.selectPointCount(memberNo);
		
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage>5) {
			pageNo = reqPage-4;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href = '/pointSearch.do?reqPage="+(pageNo -1)+"&memberNo="+memberNo+"'class='btn-pagi ctrl'>[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='btn-pagi page-active'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/pointSearch.do?reqPage="+pageNo+"&memberNo="+memberNo+"'class='btn-pagi'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a href = '/pointSearch.do?reqPage="+pageNo+"&memberNo="+memberNo+"'class='btn-pagi ctrl'>[다음]</a>";
		}
		PointPageData ppd = new PointPageData(pointList, pageNavi);
		
		return ppd;
	}

	public CouponPageData selectIssueCouponList(int reqPage, int memberNo) {
		int numPerPage = 10;
		
		int end = reqPage *numPerPage;
		int start = end - numPerPage + 1;
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("memberNo", memberNo);
		ArrayList<IssueCoupon> couponList = dao.selectMemberIssueCoupon(map);
		int totalCount = dao.selectIssueCount(memberNo);
		
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage>5) {
			pageNo = reqPage-5;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href = '/couponSearch.do?reqPage="+(pageNo -1)+"&memberNo="+memberNo+"'class='btn-pagi ctrl'>[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='btn-pagi page-active'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/couponSearch.do?reqPage="+pageNo+"&memberNo="+memberNo+"'class='btn-pagi'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a href = '/couponSearch.do?reqPage="+pageNo+"'class='btn-pagi ctrl'>[다음]</a>";
		}
		CouponPageData cpd = new CouponPageData(couponList, pageNavi);
		return cpd;
	}

	public ArrayList<Point> selectAllPointMember(int memberNo) {
		ArrayList<Point> pointList = dao.selectAllPointMember(memberNo);
		return pointList;
	}

	public int insertPoint(int memberNo, int pointEa) {
		Point point = new Point();
		point.setMemberNo(memberNo);
		point.setPointEa(pointEa);
		int result = dao.insertPoint(point);
		return result;
	}

}
