package moo.ng.san.dayCheck.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dayCheck.model.dao.DayCheckDao;
import moo.ng.san.dayCheck.model.vo.DayCheck;
import moo.ng.san.dayCheck.model.vo.Point;
import moo.ng.san.member.model.vo.Member;

@Service
public class DayCheckService {
	@Autowired
	private DayCheckDao dao;

	public ArrayList<DayCheck> selectDayCheck(int memberNo) {
		ArrayList<DayCheck> dc = dao.selectDayCheck(memberNo);
		return (ArrayList<DayCheck>) dc;
	}

	public int insertDayCheck(int memberNo) {
		int result = dao.insertDayCheck(memberNo);
		
		if(result>0) {
			int result2 = dao.insertPoint(memberNo);
			return result2;
		}
		
		return result;
	}
}
