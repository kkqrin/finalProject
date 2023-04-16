package moo.ng.san.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Option {
	private int optionInfoNo;
	private int optionGroupNo;
	private int productNo;
	private String optionDetailName;
	private int optionPrice;
}
