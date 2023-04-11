package moo.ng.san.askItem.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.askItem.model.dao.AskItemDao;

@Service
public class AskItemService {
	@Autowired
	private AskItemDao dao;
	

}
