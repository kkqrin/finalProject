package moo.ng.san.askItem.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.askItem.model.vo.AskItem;
import moo.ng.san.askItem.model.vo.AskItemCategory;
import moo.ng.san.askItem.model.vo.DocuVO;

@Repository
public class AskItemDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertAskItem(AskItem a) {
		int result = sqlSession.insert("askItem.insertAskItem",a);
		return result;
	}

	public int insertDocu(DocuVO file) {
		int result = sqlSession.insert("askItem.insertDocu",file);
		return result;
	}

	public int askItemDelete(int corpNo) {
		int result = sqlSession.delete("askItem.askItemDelete",corpNo);
		return result;
	}

	public DocuVO selectOneFile(int docuNo) {
		DocuVO d = sqlSession.selectOne("askItem.selectOneFile",docuNo);
		return d;
	}

	public int insertCategory(AskItemCategory category) {
		int result = sqlSession.insert("askItem.insertCategory",category);
		return result;
	}

}
