package moo.ng.san.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private int productNo;
	private int detailCategoryNo;
	private String productName;
	private int productEa;
	private int productPrice;
	private int productStatus;
	private int productCost;
	private int gongguNumber;
	private String productContent;
	private int productDiscount;
	private String thumbnail;
	private ArrayList<String> fileList;
	
	//공구때문에 추가된 VO
	private int gongguNo;
	private int detailGongguNo;
	private int gongguPayNo;
	private int memberNo;
	
	private int presentCnt; // 현재 남은 수량
	
	private int purchasedVolume; // 구매량
	
	private String categoryName;
}
