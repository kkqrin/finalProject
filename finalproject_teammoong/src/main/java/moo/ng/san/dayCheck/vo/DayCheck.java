package moo.ng.san.dayCheck.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DayCheck {
	private int checkNo;
	private int memberNo;
	private int pointEa;
	private String checkDate;
}
