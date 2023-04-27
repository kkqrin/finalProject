package moo.ng.san.review.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.review.model.vo.FileVO;
import moo.ng.san.review.model.vo.Review;

@Repository
public class ReviewDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertReview(Review review) {
		int result = sqlSession.insert("review.insertReview",review);
		return result;
	}

	public ArrayList<Review> selectReviewListByProductNo(int productNo) {
		List list = sqlSession.selectList("review.selectReviewListByProductNo",productNo);
		return (ArrayList<Review>)list;
	}

	public int selectReviewNo() {
		int reviewNo = sqlSession.selectOne("review.selectReviewNo");
		return reviewNo;
	}

	public int insertFile(FileVO file) {
		int result = sqlSession.insert("review.insertFile",file);
		return result;
	}

	public ArrayList<String> selectReviewFiles(int reviewNo) {
		List list = sqlSession.selectList("review.selectReviewFile",reviewNo);
		return (ArrayList<String>)list;
	}
}
