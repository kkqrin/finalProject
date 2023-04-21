package moo.ng.san.dm.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import moo.ng.san.dm.model.service.DmService;
import moo.ng.san.dm.model.vo.DirectMessage;
import moo.ng.san.member.model.vo.Member;

@Controller
public class DmController {
	
	@Autowired
	private DmService service; 

	@RequestMapping(value = "/receiveDmList.do")
	public String myPageDmReceive(@SessionAttribute(required=false) Member m, Model model) {
		ArrayList<DirectMessage> list = service.selectReceiveAllDm(m.getMemberId());
		model.addAttribute("list", list);
		return "dm/receiveDmList";
	}
	
	@RequestMapping(value = "/sendDmList.do")
	public String myPageDmSend() {
		return "dm/sendDmList";
	}
	
	@RequestMapping(value = "/dmWriteFrm.do")
	public String myPageDmWriteFrm(Model model, @SessionAttribute(required=false) Member m) {
		model.addAttribute("memberId", m.getMemberId());
		return "dm/dmWriteFrm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertDm.do")
	public String insertDm(String dmSender, String dmReceiver, String dmContent) {
		DirectMessage dm = new DirectMessage();
		dm.setDmSender(dmSender);
		dm.setDmReceiver(dmReceiver);
		dm.setDmContent(dmContent);
		int result = service.insertDm(dm);
		if(result==1) {
			return "ok";
		}else {
			return "error";
		}
	}//insertDm
	
	
}//DmController
