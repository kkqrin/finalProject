package moo.ng.san.dm.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.dm.model.vo.DirectMessage;

@Repository
public class DmDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertDm(DirectMessage dm) {
		return sqlSession.insert("directMessage.insertDm",dm);
	}

	public ArrayList<DirectMessage> selectAllDm(DirectMessage dm) {
		List list = sqlSession.selectList("directMessage.selectAllDm", dm);
		return (ArrayList<DirectMessage>)list;
	}

	public int selectDmCount(String memberId) {
		return sqlSession.selectOne("directMessage.selectDmCount",memberId);
	}

	public DirectMessage selectOneDm(int dmNo) {
		return sqlSession.selectOne("directMessage.selectOneDm",dmNo);
	}

	public void updateReadChk(int dmNo) {
		sqlSession.update("directMessage.updateReadChk",dmNo);
	}


	
	
	
}//DmDao
