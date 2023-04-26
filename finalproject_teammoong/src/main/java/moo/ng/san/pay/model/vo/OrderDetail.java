package moo.ng.san.pay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDetail {
	private int orderDetailNo;
	private int orderNo;
	private int productNo;
	private int optionInfoNo;
	private int orderDetailCnt;
	private int orderDetailCost;
	private int orderSalePrice;
	private String productName;
}
