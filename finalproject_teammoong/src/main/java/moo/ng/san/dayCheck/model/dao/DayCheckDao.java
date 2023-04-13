package moo.ng.san.dayCheck.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.dayCheck.model.vo.DayCheck;

@Repository
public class DayCheckDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<DayCheck> selectDayCheck(int memberNo) {
		List dc = sqlSession.selectList("dayCheck.selectDayCheck",memberNo);
		return (ArrayList<DayCheck>)dc;
	}

	public int insertDayCheck(int memberNo) {
		int result = sqlSession.insert("dayCheck.insertDayCheck",memberNo);
		return result;
	}

	public int insertPoint(int memberNo) {
		int result = sqlSession.insert("point.insertPoint",memberNo);
		return result;
	}
}
