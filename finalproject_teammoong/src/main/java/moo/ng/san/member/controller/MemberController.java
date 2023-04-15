package moo.ng.san.member.controller;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import common.MsgVO;
import common.PhoneCertify;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.service.MemberService;
import moo.ng.san.member.model.vo.Member;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	@Autowired
	private PhoneCertify phoneCertify;
	@Autowired
	private FileManager upload; 
	
	
	@ResponseBody
	@RequestMapping(value = "/memberPhoneCheck.do")
	public String phoneCheck(String memberPhone) {
		return phoneCertify.PhoneCheck(memberPhone);
	}
	
	
	@RequestMapping(value = "/join.do")
	public String signIn(Member m, MultipartFile memberPropic, HttpServletRequest request ,Model model,HttpSession session) {

		String filePath="";
		if(!memberPropic.isEmpty()) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
			filePath = upload.upload(savePath, memberPropic); //업로드 완료
			m.setMemberPath(filePath);
		}else {
			filePath = "moongs.png";
			m.setMemberPath(filePath);
		}
		int result = service.insertMember(m);
		
		if(result>0) {
			m.setMemberPw(null);
			Member loginMember = service.selectOneMember(m);
			System.out.println(loginMember);
			session.setAttribute("m", loginMember);
			
			MsgVO msg = new MsgVO();
			msg.setTitle("가입을 환영합니다");
			msg.setMsg("뭉쳐야산다에서 저렴하게 구매해보세요 :)");
			msg.setLoc("/");
			model.addAttribute("msg", msg);
			return "common/msg";
		}
		return "redirect:/"; //오류페이지로 넘어가야함
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
	public String myPage(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("m");
		int memberNo = m.getMemberNo();
		Point point = service.selectTotalPoint(memberNo);
		model.addAttribute("p", point);
		return "member/myPage";
	}//myPage
	

	@RequestMapping(value = "/signUpFrm.do")
	public String joinMemberFrm(){
		return "member/signUpFrm";
	}//joinMemberFrm

	
	@RequestMapping(value = "/myPageMemberDelete.do")
	public String myPageMemberDelete() {
		return "member/myPageMemberDelete";
	}//myPageMemberDelete(회원탈퇴)

	
	
	
	@RequestMapping(value = "/updateMember.do")
	public String updateMember() {
		return "redirect:/myPage.do";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}//MemberController
