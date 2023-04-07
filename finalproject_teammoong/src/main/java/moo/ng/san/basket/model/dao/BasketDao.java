package moo.ng.san.basket.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BasketDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
}
