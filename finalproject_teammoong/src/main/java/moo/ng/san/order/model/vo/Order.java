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
	
	private String thumbnail;
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int optionNo;
	private String optionDetailName;
	private int optionPrice;
	
	private int basketCount;
	private int totalPrice;
	private String deliReceiver;
	private String deliPhone;
	private String deliAddr;
	private String deliAddr1;
	private String deliAddr2;
	private String deliRequest;
	private ArrayList<OrderDetail> orderDetail;
}
