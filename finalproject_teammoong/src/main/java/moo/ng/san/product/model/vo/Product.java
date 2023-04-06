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
	private int dCategoryNo;
	private String productName;
	private int productEa;
	private int productPrice;
	private int productStatus;
	private int productCost;
	private int gongguNumber;
	private String productContent;
	private int productDiscount;
	/*
	 * 파일이미지용 arraylist 추가예정
	 * */
}
