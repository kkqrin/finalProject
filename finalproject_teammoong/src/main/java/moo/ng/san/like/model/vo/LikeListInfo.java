package moo.ng.san.like.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class LikeListInfo {
	private int productNo;
	private String productName;
	private int productPrice;
	private int productDiscount;
	private int likeNo;
	private int memberNo;
	private ArrayList<String> fileList;
}
