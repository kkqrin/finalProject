package moo.ng.san.askItem.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DocuVO {
	private int docuNo;
	private int corpNo;
	private String docuName;
	private String docupath;
}
