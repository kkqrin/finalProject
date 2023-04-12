package moo.ng.san.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.notice.model.dao.NoticeDao;
import moo.ng.san.notice.vo.FileVO;
import moo.ng.san.notice.vo.Notice;
import moo.ng.san.notice.vo.NoticePageData;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public int insertNotice(Notice n, ArrayList<FileVO> fileList) {
		int result = dao.insertNotice(n);
		if(result > 0) {
			for(FileVO file : fileList) {
				file.setNoticeNo(n.getNoticeNo());
				result += dao.insertFile(file);
			}
		}
		return result;
	}

	public NoticePageData selectNoticeList(int reqPage) {
		int numPerPage = 10;
		
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		ArrayList<Notice> list = dao.selectNoticeList(map);
		int totalCount = dao.selectNoticeCount();
		
		int totalPage = (int)Math.ceil(totalCount/(double)numPerPage);
		
		int pageNaviSize = 5;
		
		int pageNo = 1;
		if(reqPage>5) {
			pageNo = reqPage-4;
		}
		
		String pageNavi = "";
		if(pageNo != 1) {
			pageNavi += "<a href = '/noticeList.do?reqPage="+(pageNo -1)+"'class='btn-pagi ctrl'>[이전]</a>";
		}
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) {
				pageNavi += "<span class='btn-pagi page-active'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a href='/noticeList.do?reqPage="+pageNo+"'class='btn-pagi'>"+pageNo+"</a>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}
		}
		if(pageNo <=totalPage) {
			pageNavi += "<a href = '/noticeList.do?reqPage="+pageNo+"'class='btn-pagi ctrl'>[다음]</a>";
		}
		NoticePageData npd = new NoticePageData(list, pageNavi);
		return npd;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = dao.selectOneNotice(noticeNo);
		
		return n;
	}

	public int noticeUpdate(Notice n, ArrayList<FileVO> fileList, int[] fileNo) {
		int result = dao.noticeUpdate(n);
		if(result > 0) {
			if(fileNo != null) {
				for(int no : fileNo) {
					result += dao.deleteFile(no);
				}
			}
			for(FileVO file : fileList) {
				file.setNoticeNo(n.getNoticeNo());
				result += dao.insertFile(file);
			}
		}
		return result;
	}

	public int noticeDelete(int noticeNo) {
		int result = dao.noticeDelete(noticeNo);
		return result;
	}

	public int updateReadCount(Notice n) {
		int result =dao.updateReadCount(n);
		return result;
	}

	public FileVO getFile(int fileNo) {
		FileVO f = dao.selectOneFile(fileNo);
		return f;
	}
}
