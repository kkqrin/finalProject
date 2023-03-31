package moo.ng.san.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.notice.model.dao.NoticeDao;
import moo.ng.san.notice.vo.FileVO;
import moo.ng.san.notice.vo.Notice;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao dao;

	public int insertNotice(Notice n, ArrayList<FileVO> fileList) {
		int result = dao.insertNotice(n);
		if(result > 0) {
			for(FileVO file : fileList) {
				file.setNoticeNo(n.getNoticeNo());
				result += dao.insertFile(file);
			}
		}
		return result;
	}
}
