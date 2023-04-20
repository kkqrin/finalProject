package moo.ng.san.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import common.FileManager;
import common.MsgVO;
import common.PhoneCertify;
import lombok.val;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.service.MemberService;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.member.model.vo.Out;
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
	private FileManager fm; 
	@Autowired
	private JavaMailSender mailSender;
	
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
			filePath = fm.upload(savePath, memberPropic); //업로드 완료
			m.setMemberPath(filePath);
		}else {
			filePath = "moongs.png";
			m.setMemberPath(filePath);
		}
		int result = service.insertMember(m);
		
		if(result>0) {
			m.setMemberPw(null);
			Member loginMember = service.selectOneMember(m);
			session.setAttribute("m", loginMember);
			System.out.println(loginMember);
			MsgVO msg = new MsgVO();
			msg.setTitle("가입을 환영합니다");
			msg.setMsg("뭉쳐야산다에서 저렴하게 구매해보세요 :)");
			msg.setLoc("/");
			model.addAttribute("msg", msg);
			return "common/msg";
		}
		return "redirect:/"; //오류페이지로 넘어가야함
	}
	
	
	@RequestMapping(value = "/goToMsg.do")
	public String goToMsg(Model model) {
		MsgVO msg = new MsgVO();
		msg.setTitle("비밀번호가 변경되었습니다");
		msg.setMsg("변경된 비밀번호로 로그인해주세요");
		msg.setLoc("/");
		model.addAttribute("msg", msg);
		return "common/msg";
	}//goToMsg
	
	
	
	
	
	
	
	
	
	
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
	public String myPage(@SessionAttribute(required=false) Member m, Model model) {
		int memberNo = m.getMemberNo();
		Point point = service.selectTotalPoint(memberNo);
		model.addAttribute("p", point);
		return "member/myPage";
	}//myPage
	

	@RequestMapping(value = "/signUpFrm.do")
	public String joinMemberFrm(){
		return "member/signUpFrm";
	}//joinMemberFrm
	
	
	
	@RequestMapping(value = "/searchIdFrm.do")
	public String searchIdFrm(){
		return "member/searchIdFrm";
	}//searchIdFrm

	
	@RequestMapping(value = "/searchPwFrm.do")
	public String searchPwFrm() {
		return "member/searchPwFrm";
	}//searchPwFrm
	
	
	@RequestMapping(value = "/myPageMemberDelete.do")
	public String myPageMemberDelete() {
		return "member/myPageDeleteMember";
	}//myPageMemberDelete(회원탈퇴)

	
	
	
	@RequestMapping(value = "/updateMember.do")
	public String updateMember(Member member, MultipartFile memberPropic, HttpServletRequest request, @SessionAttribute(required=false) Member m) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/member/");
		String filePath="";

		if(!memberPropic.isEmpty()) {
			filePath = fm.upload(savePath, memberPropic); //업로드 완료
			member.setMemberPath(filePath);
		}
		
		int result = service.updateMember(member);
		
		String memberPath = m.getMemberPath();
		
		if(result>0 || (result>0 && filePath!="")) { //이미지까지 수정하거나, 그냥 수정만 하거나
			m.setMemberPhone(member.getMemberPhone());
			m.setMemberEmail(member.getMemberEmail());
			m.setMemberZoneCode(member.getMemberZoneCode());
			m.setMemberAddr(member.getMemberAddr());
			m.setMemberBank(member.getMemberBank());
			m.setMemberAccount(member.getMemberAccount());
			m.setMemberAgree(member.getMemberAgree());
			
			if(member.getMemberBday()!=null && member.getMemberBday().length()>0) { //생일을 새로 추가했을 경우
				String year = member.getMemberBday().substring(0,4);
				String month = member.getMemberBday().substring(4,6);
				String day = member.getMemberBday().substring(6,8);
				m.setMemberBday(year+"년"+month+"월"+day+"일");
			}
			if(!memberPropic.isEmpty() && !memberPath.equals("moongs.png")) { //이미지까지 수정하고, 기본 이미지에서 수정하는 경우가 아닌 경우
				m.setMemberPath(filePath);
				fm.deleteFile(savePath, memberPath);
			}else if(!memberPropic.isEmpty() && memberPath.equals("moongs.png")) {
				m.setMemberPath(filePath);
			}
		
		}
		
		return "redirect:/myPage.do";
	}//updateMember
	
	
	@RequestMapping(value = "/updateNewPwMemberFrm.do")
	public String updateNewPwMemberFrm(String hideMemberId,Model model) {
		model.addAttribute("memberId", hideMemberId);
		return "member/updatePwFrm";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/updateNewPwMember.do")
	public String updateNewPwMember(String memberId, String memberPw, String memberNewPw) {
			Member member = new Member();
			member.setMemberId(memberId);
		if(memberPw!=null) {//마이페이지 [회원정보수정]을 통해 수정하는 경우
			member.setMemberPw(memberPw);
			Member m = service.selectOneMember(member);
			if(m==null) {
				return "fail";
			}
		}
			// && [비밀번호 찾기]를 통해 수정하는 경우
			member.setMemberPw(memberNewPw);
			service.updateNewPwMember(member);
			return "ok";
	}//updateNewPwMember
	
	
	@ResponseBody
	@RequestMapping(value = "/idDoubleCheck.do")
	public String idDoubleCheck(String memberId) {
		Member m = service.selectOneMember(memberId);
		if(m!=null) {
			return "dup";
		}else {
			return "ok";
		}
	}//idDoubleCheck
	
	
	@ResponseBody
	@RequestMapping(value = "/selectMemberId.do")
	public String selectMemberId(String memberName, String memberPhone, String memberEmail, String memberId) {
		Member member = new Member();
		if(memberName!=null && memberPhone!=null) {
			member.setMemberName(memberName);
			member.setMemberPhone(memberPhone);
		}else if(memberName!=null && memberEmail!=null) {
			member.setMemberName(memberName);
			member.setMemberEmail(memberEmail);
		}else if(memberId!=null && memberPhone!=null) {
			member.setMemberId(memberId);
			member.setMemberPhone(memberPhone);
		}else if(memberId!=null && memberEmail!=null) {
			member.setMemberId(memberId);
			member.setMemberEmail(memberEmail);
		}
		Member m = service.selectOneMember(member);
		if(m!=null) {
			return m.getMemberId();
		}else {
			return "none";
		}
	}//selectMemberId
	
	
	
	@ResponseBody
	@RequestMapping(value = "/sendEmailMember.do")
	public String sendEmailMember(String memberEmail) {
		String code = service.sendMail(memberEmail);
		return code;
	}//sendEmailMember
	
	
	
	@ResponseBody
	@RequestMapping(value = "/chkBeforeOutMember.do")
	public String chkBeforeOutMember(String memberId, String memberPw) {
		Member member = new Member();
		member.setMemberId(memberId);
		member.setMemberPw(memberPw);
		Member m = service.selectOneMember(member);
		if(m!=null) {
			return "ok";
		}
		return "null";
	}//chkBeforeOutMember
	
	@RequestMapping(value = "/updateMemberOut.do")
	public String updateMemberOut(String memberId, int outReason, String outContent, Model model, HttpSession session) {
		Out o = new Out(memberId, outReason, outContent);
		int result = service.processOutMember(o);
		if(result>1) {
			session.invalidate();
			MsgVO msg = new MsgVO();
			msg.setTitle("탈퇴처리가 완료되었습니다");
			msg.setMsg("그동안 뭉쳐야산다를 이용해주셔서 감사합니다.");
			msg.setLoc("/");
			model.addAttribute("msg", msg);
			return "common/msg";
		}else {
			session.invalidate();
			MsgVO msg = new MsgVO();
			msg.setTitle("탈퇴처리중 오류가 발생하였습니다");
			msg.setMsg("탈퇴 실패. 관리자에게 문의해주세요");
			msg.setLoc("/");
			model.addAttribute("msg", msg);
			return "common/msg";
		}
	}//updateMemberOut
	
	
}//MemberController
