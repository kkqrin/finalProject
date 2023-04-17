package moo.ng.san.inquiry.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import moo.ng.san.inquiry.model.service.InquiryService;
import moo.ng.san.inquiry.model.vo.Inquiry;
import moo.ng.san.inquiry.model.vo.InquiryAdmin;

@Controller
public class InquiryController {
	@Autowired
	private InquiryService service;
	@ResponseBody
	@RequestMapping(value="/updateInquiry.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public int updateInquiry(Inquiry iq) {
		int result = service.updateInquiry(iq);
		if(result > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	@ResponseBody
	@RequestMapping(value="/insertInquiry.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public int insertInquiry(Inquiry iq) {
		int result = service.insertInquiry(iq);
		if(result > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	@ResponseBody
	@RequestMapping(value="/adminInsert.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public int adminInsert(InquiryAdmin iqa) {
		int result = service.adminInsert(iqa);
		if(result > 0) {
			return 1;
		} else {
			return 0;
		}
	}
	@ResponseBody
	@RequestMapping(value="/selectAdminInquiry.do", method=RequestMethod.POST, produces = "application/json; charset=utf8")
	public InquiryAdmin selectAllAdminInquiryByInquiryNo(int inquiryNo){
		InquiryAdmin iqa = service.selectAllAdminInquiryByInquiryNo(inquiryNo);
		return iqa;
	}
}
