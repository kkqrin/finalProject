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
	private ArrayList<DetailCategory> dCategoryList;
	// 무한 스크롤
	private int start;
	private int amount;
	// 상위 카테고리 번호, 이름
	private Category category;
}
