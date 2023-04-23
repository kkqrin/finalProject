package moo.ng.san.gonggu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.gonggu.model.dao.GongguDao;
import moo.ng.san.gonggu.model.vo.DetailGonggu;
import moo.ng.san.gonggu.model.vo.Gonggu;

@Service
public class GongguService {
	@Autowired
	private GongguDao dao;

	public ArrayList<Gonggu> selectGongguList(int productNo) {
		ArrayList<Gonggu> list = dao.selectGongguList(productNo);
//		int countNumber = dao.selectCount();
//		for(Gonggu g : list) {
//		}
		return list;
	}

	public int insertGonggu(Gonggu g) {
//		alert문구 : 상품아래의 뭉쳐야산다 대기자를 확인 하셨나요? 주문참여를 통하여 빠르게 공동구매를 진행 할 수 있습니다.
					
//		공구테이블 인서트(최초 1인에 한해서 공구테이블을 생성)
		int resultGngguNo = dao.insertGonggu(g);
		g.setGongguNo(resultGngguNo);
//		디테일공구테이블 인서트(공구테이블이 생성되면서 공구주또한 인원수에 포함시키기위해 디테일 공구테이블에 인서트)
		/* Gonggu gonggu = dao.selectInsertGonggu(resultGngguNo); */
		//System.out.println("gongguService에서 gonggu값"+gonggu);
		int DetailGongguResult = dao.insertDetailGonggu(g);
		
		return resultGngguNo;
	}

	
}
