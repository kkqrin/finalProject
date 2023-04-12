package moo.ng.san.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.category.model.vo.Category;
import moo.ng.san.category.model.vo.DetailCategory;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductPageData {
	private ArrayList<Product> list;
	private ArrayList<DetailCategory> detailCategoryList;
	// 무한 스크롤
	private int start;
	private int amount;
	private int detailCategoryNo;
	
	// 상위 카테고리 번호, 이름
	private Category category;
	// 하위 카테고리
	private DetailCategory detailCategory;
}
