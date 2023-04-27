package moo.ng.san.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.review.model.dao.ReviewDao;
import moo.ng.san.review.model.vo.Review;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;

	public int insertReview(Review review) {
		return dao.insertReview(review);
	}
}
