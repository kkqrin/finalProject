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
		
//		int countNumber = dao.selectCount();
//		for(Gonggu g : list) {
//		}
		return list;
	}

	public int insertGonggu(Gonggu g, Point p, GongguPay gp) {
//		alert문구 : 상품아래의 뭉쳐야산다 대기자를 확인 하셨나요? 주문참여를 통하여 빠르게 공동구매를 진행 할 수 있습니다.
//		공구테이블 인서트(최초 1인에 한해서 공구테이블을 생성)
		int resultGongguNo = dao.insertGonggu(g);
		g.setGongguNo(resultGongguNo);
//		디테일공구테이블 인서트(공구테이블이 생성되면서 공구주또한 인원수에 포함시키기위해 디테일 공구테이블에 인서트)
		if(resultGongguNo > 0) {
			Gonggu gonggu = dao.selectInsertGonggu(resultGongguNo);
			System.out.println("gongguService에서 gonggu값"+gonggu);
			int DetailGongguResult = dao.insertDetailGonggu(gonggu);
			int pointResult = dao.insertPoint(p);
			if(pointResult > 0) {
				gp.setGongguNo(gonggu.getGongguNo());
				int gongguPayResult = dao.insertGongguPay(gp);
			}
		}
		int DetailGongguResult = dao.insertDetailGonggu(g);
		return resultGongguNo;
		/* Gonggu gonggu = dao.selectInsertGonggu(resultGngguNo); */
		//System.out.println("gongguService에서 gonggu값"+gonggu);
		
	}
	
	public int selectGongguPayCount(int gongguNo) {
		int result = dao.selectGongguPayCount(gongguNo);
		return result;
	}


	
}
