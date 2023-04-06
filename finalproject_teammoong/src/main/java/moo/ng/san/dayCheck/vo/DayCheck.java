package moo.ng.san.dayCheck.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DayCheck {
	public int checkNo;
	public int memberNo;
	public int pointNo;
	public String checkDate;
	public String today;
}
