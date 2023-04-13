package moo.ng.san.inquiry.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.inquiry.model.vo.Inquiry;
import moo.ng.san.inquiry.model.vo.InquiryAdmin;

@Repository
public class InquiryDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Inquiry> selectInquiryList(int productNo) {
		List list = sqlSession.selectList("inquiry.selectInquiryList",productNo);
		return (ArrayList<Inquiry>)list;
	}
	@Transactional
	public int updateInquiry(Inquiry iq) {
		int result = sqlSession.update("inquiry.updateInquiry",iq);
		return result;
	}
	public int insertInquiry(Inquiry iq) {
		int result = sqlSession.insert("inquiry.insertInquiry",iq);
		return result;
	}
	public int adminInsert(InquiryAdmin iqa) {
		int result = sqlSession.insert("inquiry.adminInsert",iqa);
		return result;
	}
}
