package moo.ng.san.like.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.like.model.vo.Like;

@Repository
public class LikeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertLike(Like like) {
		int result = sqlSession.insert("like.insertLike",like);
		return result;
	}

	public Like selectProductLike(Like l) {
		Like like = sqlSession.selectOne("like.selectProductLike",l);
		System.out.println("likeDao에서 select값"+like);
		return like;
	}

	
}
