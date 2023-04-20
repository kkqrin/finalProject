package moo.ng.san.pay.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Pay {
	private int payNo;
	private int memberNo;
	private int productNo;
	private String payDate;
	private int payStatus;
}
