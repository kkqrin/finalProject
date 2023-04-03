package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.product.model.vo.Product;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminProductPageData {
	private ArrayList<Product> list;
	private String pageNavi;
	
}
