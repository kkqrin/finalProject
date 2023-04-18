package moo.ng.san.gonggu.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DetailGonggu {
	private int detailGongguNo;
	private int gongguNo;
	private int memberNo;
	private int countNumber;
}
