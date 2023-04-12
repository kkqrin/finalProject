package moo.ng.san.category.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetailCategory {
	private int detailCategoryNo;	
	private String detailCategoryName;
	private int categoryNo;
	private String categoryName;
}
