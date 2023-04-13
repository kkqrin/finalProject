package moo.ng.san.inquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InquiryAdmin {
	private int iqAdminNo;
	private int inquiryNo;
	private String iqAdminContent;
	private String iqAdminDate;
}
