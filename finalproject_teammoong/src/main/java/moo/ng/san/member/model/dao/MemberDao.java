package moo.ng.san.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOrder;
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
		return sqlSession.insert("member.insertFirstPoint", m.getMemberNo());
	}

	public Point selectTotalPoint(int memberNo) {
		return sqlSession.selectOne("member.selectTotalPoint",memberNo);
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

	public ArrayList<String> selectBoardImg(String memberId) {
		List list = sqlSession.selectList("member.selectMyBoardImg",memberId);
		return (ArrayList<String>)list;
	}

	public int selectBoardCount(String memberId) {
		return sqlSession.selectOne("member.myTotalCount",memberId);
	}

	public ArrayList<Board> selectMyBoardList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("member.selectMyBoardList",map);
		return (ArrayList<Board>)list;
	}

	public void updateMemberNewPhone(Member member) {
		sqlSession.update("member.updateMemberNewPhone",member);
	}

	public ArrayList<BoardJoin> selectMyJoiner(int boardNo) {
		List list = sqlSession.selectList("member.selectMyJoiner",boardNo);
		return (ArrayList<BoardJoin>)list;
	}

	public ArrayList<BoardOrder> selectJoinerOrder(int joinNo) {
		List list = sqlSession.selectList("member.selectJoinerOrder",joinNo);
		return (ArrayList<BoardOrder>)list;
	}

	

}
