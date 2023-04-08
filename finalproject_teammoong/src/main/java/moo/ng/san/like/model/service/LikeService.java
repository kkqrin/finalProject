package moo.ng.san.like.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.like.model.dao.LikeDao;
import moo.ng.san.like.model.vo.Like;

@Service
public class LikeService {
	@Autowired
	private LikeDao dao;

	public int insertLike(Like like) {
		int result = dao.insertLike(like);
		return result;
	}

	public Like selectProductLike(Like l) {
		Like like = dao.selectProductLike(l);
		return like;
	}
}
