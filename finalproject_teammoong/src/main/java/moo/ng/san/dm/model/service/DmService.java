package moo.ng.san.dm.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dm.model.dao.DmDao;
import moo.ng.san.dm.model.vo.DirectMessage;
import moo.ng.san.dm.model.vo.DmPageData;
import moo.ng.san.notice.model.vo.Notice;
import moo.ng.san.notice.model.vo.NoticePageData;

@Service
public class DmService {

	@Autowired
	private DmDao dao;

	public int insertDm(DirectMessage dm) {
		return dao.insertDm(dm);
	}

	

	public int insertGroupDm(DirectMessage dm) {
		int result = 0;
		for(int i = 0 ; i < dm.getDmReceivers().length ; i++) {
			dm.setDmReceiver(dm.getDmReceivers()[i]);
			result += dao.insertDm(dm);
		}
		return result;
	}//insertGroupDm
	
	

	public int selectDmCount(String memberId) {
		return dao.selectDmCount(memberId);
	}

	public DirectMessage selectOneDm(int dmNo, String memberId) {
		DirectMessage dm = dao.selectOneDm(dmNo);
		if(dm.getDmReadChk()==0 && !memberId.equals(dm.getDmSender())) {
			dao.updateReadChk(dmNo);
		}
		return dm;
	}

	public DmPageData selectDmList(int reqPage, DirectMessage dm) {
		int numPerPage = 10; //한 페이지에서 보여줄 게시물 수
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("dm",dm);
		
		ArrayList<DirectMessage> list = dao.selectDmList(map);
		int totalCount = dao.selectDmTotalCount(dm);
		
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage>5) {
			pageNo = reqPage-4;
		}
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a class='btn-pagi ctrl' href='/receiveDmList.do?reqPage="+(pageNo-1)+">[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='btn-pagi page-active'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class='btn-pagi' href='/receiveDmList.do?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
				pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo<=totalPage) {
			pageNavi += "<a class='btn-pagi ctrl' href='/receiveDmList.do?reqPage="+pageNo+">[다음]</a>";
		}
		DmPageData dpd = new DmPageData(list, pageNavi);
		return dpd;
	}




}//DmService
