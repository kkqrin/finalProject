package moo.ng.san.dm.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ArrayList<DirectMessage> selectAllDm(String memberId, String flag) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId",memberId);
		map.put("flag",flag);
		ArrayList<DirectMessage> list = dao.selectAllDm(map);
		return list;
	}

	
	
}//DmService
