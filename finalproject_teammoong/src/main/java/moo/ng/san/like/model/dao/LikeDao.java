package moo.ng.san.like.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import moo.ng.san.like.model.vo.Like;
import moo.ng.san.like.model.vo.LikeListInfo;

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

	public ArrayList<LikeListInfo> selectLikeList(int memberNo) {
		List list = sqlSession.selectList("like.selectLikeList",memberNo);
		return (ArrayList<LikeListInfo>)list;
	}

	public ArrayList<String> selectLikeFiles(int productNo) {
		List list = sqlSession.selectList("like.selecLikeFilelist",productNo);
		return (ArrayList<String>)list;
	}

	public int deleteLikeByMyLikeList(Like like) {
		int result = sqlSession.delete("like.deleteLikeByMyLikeList",like);
		return result;
	}

	
}
