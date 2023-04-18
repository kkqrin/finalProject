package moo.ng.san.gonggu.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.gonggu.model.dao.GongguDao;
import moo.ng.san.gonggu.model.vo.Gonggu;

@Service
public class GongguService {
	@Autowired
	private GongguDao dao;

	public ArrayList<Gonggu> selectGongguList(int productNo) {
		return dao.selectGongguList(productNo);
	}

	
}
