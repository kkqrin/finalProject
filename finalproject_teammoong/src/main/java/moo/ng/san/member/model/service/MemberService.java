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


	public int insertMember(Member m, String filePath) {
		int result = 0;
		
		m.setMemberPath(filePath);
		result = dao.insertMember(m);
		
		if(result>0) {
			
		}
		
		return result;
	}//insertMember

	
}//MemberService
