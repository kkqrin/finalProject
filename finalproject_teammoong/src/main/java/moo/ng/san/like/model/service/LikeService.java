package moo.ng.san.like.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.like.model.dao.LikeDao;
import moo.ng.san.like.model.vo.Like;
import moo.ng.san.like.model.vo.LikeListInfo;
import moo.ng.san.product.model.vo.Product;

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

	public int deleteLike(Like l) {
		return dao.deleteLike(l);
	}

	public ArrayList<LikeListInfo> selectLikeList(int memberNo) {
		ArrayList<LikeListInfo> list = dao.selectLikeList(memberNo);
		for(LikeListInfo lli : list) {
			ArrayList<String> likeFileList = dao.selectLikeFiles(lli.getProductNo());
			lli.setFileList(likeFileList);
		}
		return list;
	}

	public int deleteLikeByMyLikeList(Like like) {
		return dao.deleteLikeByMyLikeList(like);
	}
}
