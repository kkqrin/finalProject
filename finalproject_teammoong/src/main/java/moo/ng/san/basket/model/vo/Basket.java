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
}
