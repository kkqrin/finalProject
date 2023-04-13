package moo.ng.san.askItem.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import moo.ng.san.askItem.model.dao.AskItemDao;
import moo.ng.san.askItem.model.vo.AskItem;
import moo.ng.san.askItem.model.vo.AskItemCategory;
import moo.ng.san.askItem.model.vo.DocuVO;

@Service
public class AskItemService {
	@Autowired
	private AskItemDao dao;

	public int insertAskItem(AskItem a, ArrayList<AskItemCategory> categories, ArrayList<DocuVO> fileList) {
		int result = dao.insertAskItem(a);
		if(result>0) {
			for(DocuVO file : fileList) {
				file.setCorpNo(a.getCorpNo());
				result +=dao.insertDocu(file);
			}
			for(AskItemCategory category : categories) {
				category.setCorpNo(a.getCorpNo());
				result +=dao.insertCategory(category);
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
