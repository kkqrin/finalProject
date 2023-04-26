package moo.ng.san.gonggu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.gonggu.model.dao.GongguDao;
import moo.ng.san.gonggu.model.vo.DetailGonggu;
import moo.ng.san.gonggu.model.vo.Gonggu;
import moo.ng.san.gonggu.model.vo.GongguAllInfo;
import moo.ng.san.gonggu.model.vo.GongguPay;

@Service
public class GongguService {
	@Autowired
	private GongguDao dao;

	public ArrayList<GongguAllInfo> selectGongguList(int productNo) {
		ArrayList<GongguAllInfo> list = dao.selectGongguList(productNo);
		return list;
	}

	public int insertGonggu(Gonggu g, Point p, GongguPay gp, String btnDivision) {
		if(btnDivision.equals("main")) {
			System.out.println("여긴오면안된다..");
//		alert문구 : 상품아래의 뭉쳐야산다 대기자를 확인 하셨나요? 주문참여를 통하여 빠르게 공동구매를 진행 할 수 있습니다.
//		공구테이블 인서트(최초 1인에 한해서 공구테이블을 생성)
			int resultGongguNo = dao.insertGonggu(g);
//		디테일공구테이블 인서트(공구테이블이 생성되면서 공구주또한 인원수에 포함시키기위해 디테일 공구테이블에 인서트)
			DetailGonggu detailGonggu = new DetailGonggu();
			detailGonggu.setGongguNo(resultGongguNo);
			detailGonggu.setMemberNo(g.getMemberNo());
			
			int detailGongguNo = dao.insertDetailGonggu(detailGonggu);
			
			
			if(detailGongguNo > 0) {
				// 포인트 인서트
				int pointResult = dao.insertPoint(p);
				
				if(pointResult > 0) {
					// 페이 인서트
					gp.setDetailGongguNo(detailGongguNo);
					dao.insertGongguPay(gp);
				}
			}
			return resultGongguNo;
	
		} else if(btnDivision.equals("sub")) {
//			디테일공구테이블 인서트(공구테이블이 생성되면서 공구주또한 인원수에 포함시키기위해 디테일 공구테이블에 인서트)
				DetailGonggu detailGonggu = new DetailGonggu();
//				detailGonggu.setGongguNo(resultGongguNo);
				detailGonggu.setMemberNo(g.getMemberNo());
				detailGonggu.setGongguNo(g.getGongguNo());
				System.out.println("GongguService에서 if가sub일시 detailGonggu값 : "+detailGonggu);
				int detailGongguNo = dao.insertDetailGonggu(detailGonggu);
				
				if(detailGongguNo > 0) {
					// 포인트 인서트
					int pointResult = dao.insertPoint(p);
					
					if(pointResult > 0) {
						// 페이 인서트
						gp.setDetailGongguNo(detailGongguNo);
						dao.insertGongguPay(gp);
					}
				}
				return 0;
		}
		return 0;
	}
	
	public int selectGongguPayCount(int gongguNo) {
		int result = dao.selectGongguPayCount(gongguNo);
		return result;
	}

	public int updateGonggu(int gongguPayNo) {
		return dao.updateGonggu(gongguPayNo);
	}


	
}
