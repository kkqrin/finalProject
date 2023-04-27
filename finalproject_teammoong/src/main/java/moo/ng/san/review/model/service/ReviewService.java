package moo.ng.san.review.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.product.model.vo.Product;
import moo.ng.san.review.model.dao.ReviewDao;
import moo.ng.san.review.model.vo.FileVO;
import moo.ng.san.review.model.vo.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;

	public int insertReview(Review review, ArrayList<FileVO> fileList) {
		int result = dao.insertReview(review);
		if(result > 0) {
			int reviewNo = dao.selectReviewNo();
			for(FileVO file : fileList) {
				file.setReviewNo(reviewNo);
				result += dao.insertFile(file);
			}
		}
		return result; 
	}

	public ArrayList<Review> selectReviewListByProductNo(int productNo) {
		ArrayList<Review> list = dao.selectReviewListByProductNo(productNo);
		for(Review r : list) {
			ArrayList<String> ReviewFileList = dao.selectReviewFiles(r.getReviewNo());
			r.setFileList(ReviewFileList);
		}
		return list;
	}
}
