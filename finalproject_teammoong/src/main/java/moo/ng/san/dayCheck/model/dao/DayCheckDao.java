package moo.ng.san.dayCheck.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.dayCheck.vo.DayCheck;
import moo.ng.san.member.model.vo.Member;

@Repository
public class DayCheckDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public DayCheck selectDayCheck(Member memberNo) {
		DayCheck dc = sqlSession.selectOne("dayCheck.selectDayCheck",memberNo);
		return dc;
	}

	public int insertDayCheck(DayCheck dc) {
		int result = sqlSession.insert("dayCheck.insertDayCheck",dc);
		return result;
	}

	public int updateMemberPoint(DayCheck dc) {
		int result = sqlSession.update("member.updateMemberPoint",dc);
		return result;
	}
}
