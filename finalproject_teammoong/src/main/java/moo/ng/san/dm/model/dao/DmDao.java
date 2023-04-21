package moo.ng.san.dm.model.dao;

import java.util.ArrayList;
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

	public ArrayList<DirectMessage> selectReceiveAllDm(String memberId) {
		List list = sqlSession.selectList("directMessage.selectReceiveAllDm", memberId);
		return (ArrayList<DirectMessage>)list;
	}
	
	
	
	
}//DmDao
