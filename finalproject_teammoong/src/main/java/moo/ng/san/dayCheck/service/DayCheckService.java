package moo.ng.san.dayCheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dayCheck.model.dao.DayCheckDao;
import moo.ng.san.dayCheck.vo.DayCheck;
import moo.ng.san.member.model.vo.Member;

@Service
public class DayCheckService {
	@Autowired
	private DayCheckDao dao;

	public DayCheck selectDayCheck(Member memberNo) {
		DayCheck dc = dao.selectDayCheck(memberNo);
		return dc;
	}

	public int insertDayCheck(DayCheck dc) {
		int result = dao.insertDayCheck(dc);
		if(result>0) {
			int memberPoint = dc.getPointNo();
			
			int result2 = dao.updateMemberPoint(dc);
			if(result2>0) {
				return result2;				
			}
		}
		
		return 0;
	}
}
