package moo.ng.san.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.member.model.dao.MemberDao;
import moo.ng.san.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	
	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}//selectOneMember


	public void memberPhoneCheck(String memberPhone) {
		
	}//memberPhoneCheck

	
}//MemberService
