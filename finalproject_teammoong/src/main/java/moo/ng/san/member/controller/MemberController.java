package moo.ng.san.member.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import common.PhoneCertify;
import moo.ng.san.member.model.service.MemberService;
import moo.ng.san.member.model.vo.Member;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	@Autowired
	PhoneCertify phoneCertify;
	
	@RequestMapping(value = "/msgTest.do")
	public String msgTest() {
		return "common/msg";
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberPhoneCheck.do")
	public String phoneCheck(String memberPhone) {
		return phoneCertify.PhoneCheck(memberPhone);
	}
	
	
	@RequestMapping(value = "/join.do")
	public String signIn(Member m) {
		return "";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value="/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/login.do")
	public String login(Member member, HttpSession session) {
		Member loginMember = service.selectOneMember(member);
		if(loginMember!=null) {
			session.setAttribute("m", loginMember);
			return "ok";
		}else {
			return "error";
		}
	}//login
	
	@RequestMapping(value = "/logout.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}//logOut
	
	
	@RequestMapping(value = "/myPage.do")
	public String myPage() {
		return "member/myPage";
	}//myPage
	

	@RequestMapping(value = "/signUpFrm.do")
	public String joinMemberFrm(){
		return "member/signUpFrm";
	}//joinMemberFrm

	@RequestMapping(value = "/myPageMemberInfo.do")
	public String myPageMemberInfo() {
		/*
		 * 세션에서 이름이 m인 객체를 꺼내서 Member타입으로 저장. 
		 * required=false : 이름이 m인 객체가 없으면 null을 꺼내옴
		 * --> required=false 가 없는 경우 이름이 m인 객체가 없으면 에러 발생
		 * */
		return "member/myPageMemberInfo";
	}//myPageMemberInfo(회원정보수정)
	
	
	@RequestMapping(value = "/myPageMemberDelete.do")
	public String myPageMemberDelete() {
		return "member/myPageMemberDelete";
	}//myPageMemberDelete(회원탈퇴)

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}//MemberController
