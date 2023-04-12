package moo.ng.san.askItem.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.askItem.model.dao.AskItemDao;
import moo.ng.san.askItem.model.vo.AskItem;
import moo.ng.san.askItem.model.vo.DocuVO;

@Service
public class AskItemService {
	@Autowired
	private AskItemDao dao;

	public int insertAskItem(AskItem a, ArrayList<DocuVO> fileList) {
		int result = dao.insetAskItem(a);
		if(result>0) {
			for(DocuVO file : fileList) {
				file.setCorpNo(a.getCorpNo());
				result +=dao.insertFile(file);
			}
		}
		return result;
	}
	
	public int askItemDelete(int corpNo) {
		int result = dao.askItemDelete(corpNo);
		return result;
	}
	public DocuVO getFile(int docuNo) {
		DocuVO d = dao.selectOneFile(docuNo);
		return d;
	}

}
