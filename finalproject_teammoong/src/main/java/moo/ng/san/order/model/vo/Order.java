package moo.ng.san.order.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.pay.model.vo.OrderDetail;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int orderNo;
	private int memberNo;
	private int productNo;

	private String orderDate;
	private int orderStatus;
	private String deliReceiver;
	private String deliPhone;
	private String deliAddr;
	private String deliRequest;
	
	
	private String thumbnail;
	private String productName;
	private int productPrice;
	private int productCost;
	private int productDiscount;
	private int optionNo;
	private String optionDetailName;
	private int optionPrice;
	
	private int basketCount;
	
	private int totalPrice;
	private int orderPrice;
	private String deliAddr1;
	private String deliAddr2;
	
	private ArrayList<OrderDetail> orderDetail;
	private String memberId;
	private String memberPhone;
	private int orderDetailCnt;
	private int orderDetailPrice;
	private int orderDetailCost;
	private int deliveryNo;
	private int deliveryStatus;
	private int orderDetailNo;
	private int issueNo;
	
	private int orderProductCount; // 주문당 주문상세 행 개수 (상품건수)
	
	private int issueNo; // 주문시 사용된 쿠폰 여부 확인용
	private int minusPointEa; // 사용된 적립금
	private int plusPointEa; // 적립된 적립금

	private int orderSalePrice; // 상품테이블의 productPrice와 productDiscount 계산한 값
}
