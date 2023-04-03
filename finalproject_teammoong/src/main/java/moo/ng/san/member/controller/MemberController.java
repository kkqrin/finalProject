package moo.ng.san.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import moo.ng.san.member.model.service.MemberService;
import moo.ng.san.member.model.vo.Member;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	
	@RequestMapping(value = "/msgTest.do")
	public String msgTest() {
		return "common/msg";
	}
	
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session) {
		Member loginMember = service.selectOneMember(member);
		if(loginMember!=null) {
			session.setAttribute("m", loginMember);
		}
		return "redirect:/";
	}//login
	
	@RequestMapping(value = "/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}//logOut
	
}//MemberController
