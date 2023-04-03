package kr.or.admin.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.or.admin.model.service.Board;
import kr.or.admin.model.service.Member;
import kr.or.admin.model.service.Order;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String selectAllMemberCount() {
		int result = sqlSession.selectOne("admin.selectAllMemberCount");
		return Integer.toString(result);
	}

	public String selectAllOrderCount() {
		int result = sqlSession.selectOne("admin.selectAllOrderCount");
		return Integer.toString(result);
	}

	public String selectAllBoardCount() {
		int result = sqlSession.selectOne("admin.selectAllBoardCount");
		return Integer.toString(result);
	}
	
	public String selectAllSalesCount() {
		int result = sqlSession.selectOne("admin.selectAllSalesCount");
		return Integer.toString(result);
	}
	
	public String selectBestSalesCount() {
		int result = sqlSession.selectOne("admin.selectBestSalesCount");
		return Integer.toString(result);
	}
	
	public String selectEventCount() {
		int result = sqlSession.selectOne("admin.selectEventCount");
		return Integer.toString(result);
	}
	
	

	public String selectVariationMember() {
		int beforeMember = sqlSession.selectOne("admin.selectBeforeMember");
		int allMember = sqlSession.selectOne("admin.selectAllMemberCount");
		
		int result = allMember-beforeMember;
		return Integer.toString(result);

	}

	public String selectVariationOrder() {
		int beforeOrder = sqlSession.selectOne("admin.selectBeforeOrder");
		int allOrder = sqlSession.selectOne("admin.selectAllOrder");
		int result = allOrder - beforeOrder;
		
		return Integer.toString(result);
	}

	public String selectVariationBoard() {
		int beforeBoard = sqlSession.selectOne("admin.selectBeforeBoard");
		int allBoard = sqlSession.selectOne("admin.selectAllBoardCount");
		int result = allBoard - beforeBoard;
		
		return Integer.toString(result);
	}


	
	

}
