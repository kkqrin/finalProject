package moo.ng.san.like.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Like {
	private int likeNo;
	private int memberNo;
	private int productNo;
}
