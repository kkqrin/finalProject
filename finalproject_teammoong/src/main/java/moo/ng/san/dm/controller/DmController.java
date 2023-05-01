package moo.ng.san.dm.controller;

import java.util.ArrayList;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.google.gson.Gson;

import moo.ng.san.dm.model.service.DmService;
import moo.ng.san.dm.model.vo.DirectMessage;
import moo.ng.san.dm.model.vo.DmPageData;
import moo.ng.san.member.model.vo.Member;

@Controller
public class DmController {
	
	@Autowired
	private DmService service; 

	@RequestMapping(value = "/receiveDmList.do")
	public String receiveDmList(int reqPage, @SessionAttribute(required=false) Member m, Model model) {
		DirectMessage dm = new DirectMessage();
		dm.setDmReceiver(m.getMemberId());
		DmPageData dpd = service.selectDmList(reqPage,dm);
		model.addAttribute("list", dpd.getList());
		model.addAttribute("pageNavi", dpd.getPageNavi());
		return "dm/receiveDmList";
	}
	
	@RequestMapping(value = "/sendDmList.do")
	public String sendDmList(int reqPage, @SessionAttribute(required=false) Member m, Model model) {
		DirectMessage dm = new DirectMessage();
		dm.setDmSender(m.getMemberId());
		DmPageData dpd = service.selectDmList(reqPage,dm);
		model.addAttribute("list", dpd.getList());
		model.addAttribute("pageNavi", dpd.getPageNavi());
		return "dm/sendDmList";
	}
	
//	@ResponseBody
//	@RequestMapping(value = "/myDmList.do",produces = "application/json;charset=utf-8")
//	public String myPageDmReceive(DirectMessage dm) {
//		ArrayList<DirectMessage> list = service.selectAllDm(dm);
//		return new Gson().toJson(list);
//	}
	
	
	@ResponseBody
	@RequestMapping(value = "/dmView.do",produces = "application/json;charset=utf-8")
	public String dmView(int dmNo,String memberId) {
		DirectMessage dm = service.selectOneDm(dmNo,memberId);
		return new Gson().toJson(dm);
	}
	
	
	
	

	
	@RequestMapping(value = "/dmWriteFrm.do")
	public String myPageDmWriteFrm(Model model, @SessionAttribute(required=false) Member m) {
		model.addAttribute("memberId", m.getMemberId());
		model.addAttribute("receiver", "");
		return "dm/dmWriteFrm";
	}
	

	@ResponseBody
	@RequestMapping(value = "/insertDm.do")
	public String insertDm(String dmSender, String dmReceiver, String dmContent) {
		DirectMessage dm = new DirectMessage();
		dm.setDmSender(dmSender);
		dm.setDmReceiver(dmReceiver);
		dm.setDmContent(dmContent);
		System.out.println(dm);
		int result = service.insertDm(dm);
		if(result==1) {
			return "ok";
		}else {
			return "error";
		}
	}//insertDm
	
	
	@RequestMapping(value = "/dmReply.do")
	public String dmReply(Model model, @SessionAttribute(required=false) Member m, String receiver) {
		model.addAttribute("memberId", m.getMemberId());
		model.addAttribute("receiver", receiver);
		return "dm/dmWriteFrm";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/insertGroupDm.do")
	public String insertGroupDm(DirectMessage dm) {
		System.out.println("컨트롤러에서 받은 dm정보 : "+ dm);
		int result = service.insertGroupDm(dm);
		if(result>0) {
			return "ok";
		}else {
			return "error";
		}
	}//insertGroupDm
	
	
	
}//DmController
