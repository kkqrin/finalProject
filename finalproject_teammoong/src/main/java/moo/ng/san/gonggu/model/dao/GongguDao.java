package moo.ng.san.gonggu.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.gonggu.model.vo.Gonggu;

@Repository
public class GongguDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Gonggu> selectGongguList(int productNo) {
		List list = sqlSession.selectList("gonggu.selectGongguList",productNo);
		return (ArrayList<Gonggu>)list;
	}
}
