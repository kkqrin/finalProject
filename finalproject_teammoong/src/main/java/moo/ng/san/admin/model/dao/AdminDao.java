package moo.ng.san.admin.model.dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import moo.ng.san.admin.model.vo.CouponData;
import moo.ng.san.admin.model.vo.SalesData;
import moo.ng.san.askItem.model.vo.AskItem;
import moo.ng.san.board.model.vo.Board;
import moo.ng.san.board.model.vo.BoardJoin;
import moo.ng.san.board.model.vo.BoardOption;
import moo.ng.san.board.model.vo.Notify;
import moo.ng.san.member.model.vo.Member;
import moo.ng.san.order.model.vo.Order;
import moo.ng.san.product.model.vo.Product;

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
	
	
	//이전 버전. 
	/*
	public String selectVariationOrder(LocalDate firstDayOfMonth, LocalDate lastDayOfMonth) {
		int beforeOrder = sqlSession.selectOne("admin.selectBeforeOrder");
		int allOrder = sqlSession.selectOne("admin.selectAllOrder");
		int result = allOrder - beforeOrder;
		
		return Integer.toString(result);
	}
	*/

	public String selectVariationBoardCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("admin.selectVariationBoardCount",map);
		
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

	public ArrayList<Product> selectSearchProduct(Product p) {
		List list = sqlSession.selectList("admin.selectSearchProduct", p);

		return (ArrayList<Product>)list;
	}
	
	public ArrayList<Order> selectAllOrderList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectAllOrderList",map);
		
		return (ArrayList<Order>)list;
	}
	
	public int selectOrderCount() {
		int totalCount = sqlSession.selectOne("admin.selectOrderTotalCount");
		return totalCount;
	}

	public int updateDeliveryStatus(Product p) {
		int result = sqlSession.update("admin.updateDeliveryStatus",p);
		
		return result;
	}

	public ArrayList<Order> selectSearchDelivery(Order o) {
		List list = sqlSession.selectList("admin.selectSearchDelivery",o);
		
		return (ArrayList<Order>)list;
	}

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

	public int selectBoardCount() {
		int totalCount = sqlSession.selectOne("admin.selectAllBoardCount");
		
		return totalCount;
	}

	public ArrayList<Board> selectReportBoardList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectReportBoardList",map);
		
		return (ArrayList<Board>)list;
	}

	public int selectReportBoardCount() {
		int totalCount = sqlSession.selectOne("admin.selectReportBoardCount");
		
		return totalCount;
	}

	public int updateReportMember(Member m) {
		int result = sqlSession.update("admin.updateReportMember",m);
		return result;
	}

	public ArrayList<Board> selectReportMember(Board b) {
		List list = sqlSession.selectList("admin.selectReportMember",b);
		// TODO Auto-generated method stub
		return (ArrayList<Board>)list;
	}

	public int updateChangeMemberStatus(HashMap<String, Object> map) {
		int result = sqlSession.update("admin.updateChangeMemberStatus",map);
		
		return result;
	}

	public int updateChangeProductStatus(HashMap<String, Object> map) {
		int result = sqlSession.update("admin.updateChangeProductStatus",map);
		
		return result;
	}

	public ArrayList<BoardOption> selectAllBoardListBoardOption(int boardNo) {
		List list = sqlSession.selectList("admin.selectAllBoardListBoardOption",boardNo);
		
		return (ArrayList<BoardOption>)list;
	}
	public ArrayList<Board> selectSearchBoard(Board b) {
		List list = sqlSession.selectList("admin.selectSearchBoard",b);
		
		return (ArrayList<Board>)list;
	}
	
	public ArrayList<BoardOption> selectSearchBoardOption(int boardNo) {
		List list = sqlSession.selectList("admin.selectSearchBoardOption",boardNo);
		
		return (ArrayList<BoardOption>)list;
	}

	public ArrayList<BoardOption> selectFindBoardOption(String detailName) {
		List list = sqlSession.selectList("admin.selectFindBoardOption",detailName);
		
		return (ArrayList<BoardOption>)list;
	}
	
	public ArrayList<Board> selectSearchBoard(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectFindSearchBoardNo",map);
		
		return (ArrayList<Board>)list;
	}

	public ArrayList<Notify> selectReportNotifyList(int boardNo) {
		List list = sqlSession.selectList("admin.selectReportNotifyList",boardNo);
		
		return (ArrayList<Notify>)list;
	}

	public ArrayList<CouponData> selectAllCouponList() {
		List list = sqlSession.selectList("admin.selectAllCouponList");
		
		return (ArrayList<CouponData>)list;
	}

	public ArrayList<CouponData> selectUseMoongList(int memberNo) {
		List list = sqlSession.selectList("admin.selectUseMoongList", memberNo);
		
		return (ArrayList<CouponData>)list;
	}

	public SalesData selectCountMonthSalesData(HashMap<String, Object> map) {
		SalesData sd = sqlSession.selectOne("admin.selectCountMonthSalesData",map);
		
		return sd;
	}

	public SalesData selectCountMonthCategorySalesData(int i) {
		SalesData sd = sqlSession.selectOne("admin.selectCountMonthCategorySalesData",i);
		
		return sd;
	}

	public ArrayList<SalesData> selectMonthSalesData(int monthNo) {
		List list = sqlSession.selectList("admin.selectMonthSalesData",monthNo);
		
		return (ArrayList<SalesData>)list;
	}

	public ArrayList<SalesData> selectGenderSalesData() {
		List list = sqlSession.selectList("admin.selectGenderSalesData");

		return (ArrayList<SalesData>)list;
	}

	public Member ajaxMemberView(int memberNo) {
		Member m = sqlSession.selectOne("admin.ajaxMemberView",memberNo);
		// TODO Auto-generated method stub
		return m;
	}

	public String selectVariationMemberCount() {
		int memberCount = sqlSession.selectOne("admin.selectVariationMemberCount");
		// TODO Auto-generated method stub
		return Integer.toString(memberCount);
	}

	/* 예전버전
	 * public String selectVariationOrderCount() { String orderCount =
	 * sqlSession.selectOne("admin.selectVariationOrderCount"); // TODO
	 * Auto-generated method stub return null; }
	 */

	public String selectVariationOrderCount(HashMap<String, Object> map) {
		int orderCount = sqlSession.selectOne("admin.selectVariationOrderCount", map);
		
		return Integer.toString(orderCount);
	}

	public String selectVariationSalesCount(HashMap<String, Object> map) {
		int result = sqlSession.selectOne("admin.selectVariationSalesCount",map);
		// TODO Auto-generated method stub
		return Integer.toString(result);
	}

	public ArrayList<AskItem> selectAskItemList(HashMap<String, Object> map) {
		List list = sqlSession.selectList("admin.selectAskItemList",map);
		// TODO Auto-generated method stub
		return (ArrayList<AskItem>)list;
	}

	public int selectAskItemCount() {
		int count = sqlSession.selectOne("admin.selectAskItemCount");
		// TODO Auto-generated method stub
		return count;
	}




	


	
	

}
