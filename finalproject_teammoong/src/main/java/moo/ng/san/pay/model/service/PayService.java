package moo.ng.san.pay.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.pay.model.dao.PayDao;

@Service
public class PayService {
	@Autowired
	private PayDao dao;

}
