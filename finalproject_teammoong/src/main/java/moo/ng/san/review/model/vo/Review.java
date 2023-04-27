package moo.ng.san.review.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Review {
	private int reviewNo;
	private String reviewWriter;
	private int productNo;
	private int optionInfoNo;
	private double rating;
	private int reviewLike;
	private String reviewDate;
	private String reviewContent;
}
