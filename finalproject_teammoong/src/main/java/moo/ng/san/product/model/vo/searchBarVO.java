package moo.ng.san.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class searchBarVO {
	private int selectBox;
	private String searchKeyword;
}
