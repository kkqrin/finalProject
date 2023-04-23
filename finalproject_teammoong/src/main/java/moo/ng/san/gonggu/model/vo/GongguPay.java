package moo.ng.san.gonggu.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class GongguPay {
	private int gongguPayNO;
	private int gongguNo;
	private int productNo;
	private String gongguPayDate;
	private String gongguPayStatus;
}
