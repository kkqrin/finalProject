package moo.ng.san.admin.model.vo;

import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import moo.ng.san.member.model.vo.Member;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AdminMemberPageData {
	private ArrayList<Member> list;
	private String pageNavi;
}
