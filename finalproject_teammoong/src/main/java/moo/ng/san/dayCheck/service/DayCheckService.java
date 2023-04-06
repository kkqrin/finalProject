package moo.ng.san.dayCheck.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.dayCheck.model.dao.DayCheckDao;

@Service
public class DayCheckService {
	@Autowired
	private DayCheckDao dao;
}
