package moo.ng.san.dayCheck.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DayCheckDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
