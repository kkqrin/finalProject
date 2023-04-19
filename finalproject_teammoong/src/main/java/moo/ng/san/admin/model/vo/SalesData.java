package moo.ng.san.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SalesData {
	private int monthNo;
	private int categoryNo;
	private int totalSales;
	private int totalCost;
	
}
