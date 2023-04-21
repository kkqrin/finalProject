package moo.ng.san.review.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.review.model.dao.ReviewDao;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao dao;
}
