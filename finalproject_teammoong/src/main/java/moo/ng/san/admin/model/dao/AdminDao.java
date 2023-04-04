package moo.ng.san.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import moo.ng.san.board.model.vo.Board;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.product.model.vo.Product;

@Repository
public class AdminDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public String selectAllMemberCount() {
		int result = sqlSession.selectOne("admin.selectAllMemberCount");
		return Integer.toString(result);
	}

	/*
	 * public String selectAllOrderCount() { int result =
	 * sqlSession.selectOne("admin.selectAllOrderCount"); return
	 * Integer.toString(result); }
	 */

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
	/*
	 * public String selectVariationOrder() { int beforeOrder =
	 * sqlSession.selectOne("admin.selectBeforeOrder"); int allOrder =
	 * sqlSession.selectOne("admin.selectAllOrder"); int result = allOrder -
	 * beforeOrder;
	 * 
	 * return Integer.toString(result); }
	 */

	public String selectVariationBoard() {
		int beforeBoard = sqlSession.selectOne("admin.selectBeforeBoard");
		int allBoard = sqlSession.selectOne("admin.selectAllBoardCount");
		int result = allBoard - beforeBoard;
		
		return Integer.toString(result);
	}

	public ArrayList<Member> selectAllMemberList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectAllMemberList",map);
		
		return (ArrayList<Member>)list;
	}

	public int selectMemberCount() {
		int totalCount = sqlSession.selectOne("admin.memberTotalCount");
		return totalCount;
	}

	public int updateMemberGrade(Member m) {
		int result = sqlSession.update("admin.updateMemberGrade",m);
		return result;
	}

	public ArrayList<Member> selectSearchMember(Member m) {
		List list = sqlSession.selectList("admin.selectSearchMember", m);

		return (ArrayList<Member>)list;
	}

	public int selectMonthCount() {
		int monthCount = sqlSession.selectOne("admin.selectMonthCount");
		return monthCount;
	}

	public ArrayList<Product> selectAllProductList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectAllProductList",map);
		
		return (ArrayList<Product>)list;
	}

	public int selectProductCount() {
		int totalCount = sqlSession.selectOne("admin.selectProductTotalCount");
		return totalCount;
	}

	public int updateProductStatus(Product p) {
		int result = sqlSession.update("admin.updateProductStatus",p);

		return result;
	}

	public ArrayList<Product> selectSearchMember(Product p) {
		List list = sqlSession.selectList("admin.selectSearchProduct", p);

		return (ArrayList<Product>)list;
	}
	
	/*
	 * public ArrayList<Order> selectAllOrderList(HashMap<String, Object> map) {
	 * List list = sqlSession.selectList("admin.selectAllOrderList",map);
	 * 
	 * return (ArrayList<Order>)list; }
	 */
	/*
	 * public int selectOrderCount() { int totalCount =
	 * sqlSession.selectOne("admin.selectOrderTotalCount"); return totalCount; }
	 */

	public int updateDeliveryStatus(Product p) {
		int result = sqlSession.update("admin.updateDeliveryStatus",p);
		
		return result;
	}

	/*
	 * public ArrayList<Order> selectSearchDelivery(Order o) { List list =
	 * sqlSession.selectList("admin.selectSearchDelivery",o);
	 * 
	 * return (ArrayList<Order>)list; }
	 */

	public String selectAllBoardSalesCount() {
		int result = sqlSession.selectOne("admin.selectAllBoardSalesCount");
		
		return Integer.toString(result);
	}

	public String selectMonthBoardSalesCount() {
		int result = sqlSession.selectOne("admin.selectMonthBoardSalesCount");
		
		return Integer.toString(result);
	}

	public ArrayList<Board> selectAllBoardList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectAllBoardList",map);
		
		return (ArrayList<Board>)list;
	}
	
	


	
	

}
