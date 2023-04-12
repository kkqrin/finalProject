package moo.ng.san.basket.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.basket.model.dao.BasketDao;

@Service
public class BasketService {
	@Autowired
	private BasketDao dao;
}
