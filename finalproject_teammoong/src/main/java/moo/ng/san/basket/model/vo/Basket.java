package moo.ng.san.basket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Basket {
	private int basketNo;
	private int memberNo;
	private int productNo;
	
	private String thumbnail;
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int optionNo;
	private String optionDetailName;
	private int optionPrice;
	
	// 장바구니 안 상품 수량
	private int basketCount;
}
