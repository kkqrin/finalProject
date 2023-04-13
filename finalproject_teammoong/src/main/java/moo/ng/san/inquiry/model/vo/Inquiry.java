package moo.ng.san.inquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Inquiry {
	private int inquiryNo;
	private int productNo;
	private String inquiryTitle;
	private String inquiryContent;
	private String inquiryWriter;
	private int inquiryStatus;
	private String inquiryDate;
}
