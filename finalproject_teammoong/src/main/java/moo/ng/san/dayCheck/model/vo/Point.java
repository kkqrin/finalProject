package moo.ng.san.dayCheck.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Point {
	private int pointNo;
	private int memberNo;
	private int pointEa;
	private String pointDate;
	private int pointStatus;
	private int orderNo;
}
