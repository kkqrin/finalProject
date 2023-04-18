package moo.ng.san.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.notice.model.vo.FileVO;
import moo.ng.san.notice.model.vo.Notice;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertNotice(Notice n) {
		int result = sqlSession.insert("notice.insertNotice",n);
		return result;
	}

	public int insertFile(FileVO file) {
		int result = sqlSession.insert("notice.insertFile",file);
		return result;
	}

	public ArrayList<Notice> selectNoticeList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("notice.selectNoticeList",map);
		return (ArrayList<Notice>)list;
	}

	public int selectNoticeCount(HashMap<String, Object> map) {
		int totalCount = sqlSession.selectOne("notice.totalCount",map);
		return totalCount;
	}

	public Notice selectOneNotice(int noticeNo) {
		Notice n = sqlSession.selectOne("notice.selectOneNotice",noticeNo);
		return n;
	}

	public int noticeUpdate(Notice n) {
		int result = sqlSession.update("notice.noticeUpdate",n);
		return result;
	}
	public int deleteFile(int no) {
		int result = sqlSession.delete("notice.deleteFile",no);
		return result;
	}

	public int noticeDelete(int noticeNo) {
		int result = sqlSession.delete("notice.noticeDelete",noticeNo);
		return result;
	}

	public int updateReadCount(Notice n) {
		int result = sqlSession.update("notice.noticeReadCount",n);
		return result;
	}

	public FileVO selectOneFile(int fileNo) {
		FileVO f = sqlSession.selectOne("notice.selectOneFile",fileNo); 
		return f;
	}

}
