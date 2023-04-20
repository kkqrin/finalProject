package moo.ng.san.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.member.model.vo.Out;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		return m;
	}
	
	public Member selectOneMember(String memberId) {
		return sqlSession.selectOne("member.selectDupMember",memberId);
	}//아이디 중복확인을 위한
	

	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember", m);
	}

	public int insertFirstPoint(Member m) {
		return sqlSession.insert("point.insertFirstPoint", m.getMemberNo());
	}

	public Point selectTotalPoint(int memberNo) {
		return sqlSession.selectOne("point.selectTotalPoint",memberNo);
	}

	public int updateMember(Member member) {
		return sqlSession.update("member.updateMember", member);
	}

	public int updateNewPwMember(Member member) {
		return sqlSession.update("member.updateNewPwMember",member);
	}

	public int insertOutReason(Out o) {
		return sqlSession.insert("member.insertOutReason",o);
	}

	public int updateMemberStatus(String memberId) {
		return sqlSession.update("member.updateMemberStatus",memberId);
	}

	

}
