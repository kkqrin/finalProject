package moo.ng.san.dm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dm.model.dao.DmDao;
import moo.ng.san.dm.model.vo.DirectMessage;

@Service
public class DmService {

	@Autowired
	private DmDao dao;

	public int insertDm(DirectMessage dm) {
		return dao.insertDm(dm);
	}

	public ArrayList<DirectMessage> selectAllDm(DirectMessage dm) {
		ArrayList<DirectMessage> list = dao.selectAllDm(dm);
		return list;
	}

	public int selectDmCount(String memberId) {
		return dao.selectDmCount(memberId);
	}


}//DmService
