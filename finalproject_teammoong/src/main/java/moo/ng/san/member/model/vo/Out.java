package moo.ng.san.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Out {
	private String memberId;
	private int outReason;
	private String outContent;
}
