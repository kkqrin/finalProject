package moo.ng.san.like.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.like.model.vo.Like;

@Repository
public class LikeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Transactional
	public int insertLike(Like like) {
		int result = sqlSession.insert("like.insertLike",like);
		return result;
	}

	public Like selectProductLike(Like l) {
		Like like = sqlSession.selectOne("like.selectProductLike",l);
		return like;
	}
	
	@Transactional
	public int deleteLike(Like l) {
		int result = sqlSession.delete("like.deleteLike",l);
		return result;
	}

	
}
