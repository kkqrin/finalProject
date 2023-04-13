package moo.ng.san.inquiry.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.inquiry.model.dao.InquiryDao;
import moo.ng.san.inquiry.model.vo.Inquiry;
import moo.ng.san.inquiry.model.vo.InquiryAdmin;

@Service
public class InquiryService {
	@Autowired
	private InquiryDao dao;

	public ArrayList<Inquiry> selectInquiryList(int productNo) {
		
		return dao.selectInquiryList(productNo);
	}

	public int updateInquiry(Inquiry iq) {
		return dao.updateInquiry(iq);
	}

	public int insertInquiry(Inquiry iq) {
		return dao.insertInquiry(iq);
	}

	public int adminInsert(InquiryAdmin iqa) {
		return dao.adminInsert(iqa);
	}
}
