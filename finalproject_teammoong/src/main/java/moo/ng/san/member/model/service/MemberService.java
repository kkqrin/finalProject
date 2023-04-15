package moo.ng.san.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.dao.MemberDao;
import moo.ng.san.member.model.vo.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao dao;
	
	
	public Member selectOneMember(Member member) {
		return dao.selectOneMember(member);
	}//selectOneMember

	@Transactional
	public int insertMember(Member m) {
		int result = 0;
		result = dao.insertMember(m);
		if(result>0) {
			result += dao.insertFirstPoint(m);
		}
		return result;
	}//insertMember

	public Point selectTotalPoint(int memberNo) {
		return dao.selectTotalPoint(memberNo);
	}

	@Transactional
	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	
}//MemberService
