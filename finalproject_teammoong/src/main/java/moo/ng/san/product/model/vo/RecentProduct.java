package moo.ng.san.product.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RecentProduct {
	private int recentNo;
	private int memberNo;
	private int productNo;
	private String thumbnail;
}
