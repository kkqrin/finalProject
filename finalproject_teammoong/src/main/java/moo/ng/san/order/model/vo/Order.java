package moo.ng.san.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int orderNo;
	private int memberNo;
	private int productNo;
	private int totalPrice;
	private String orderDate;
	private int orderStatus;
	private String deliReceiver;
	private String deliPhone;
	private String deliAddr;
	private String deliRequest;
	
	
	private String thumbnail;
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int optionNo;
	private String optionDetailName;
	private int optionPrice;
	
	private int basketCount;
}
