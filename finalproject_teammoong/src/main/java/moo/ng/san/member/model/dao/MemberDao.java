package moo.ng.san.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.vo.Member;

@Repository
public class MemberDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public Member selectOneMember(Member member) {
		Member m = sqlSession.selectOne("member.selectOneMember",member);
		return m;
	}

	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember", m);
	}

	public int insertFirstPoint(Member m) {
		return sqlSession.insert("point.insertFirstPoint", m.getMemberNo());
	}

	public Point selectTotalPoint(int memberNo) {
		return sqlSession.selectOne("point.selectTotalPoint",memberNo);
	}

}
