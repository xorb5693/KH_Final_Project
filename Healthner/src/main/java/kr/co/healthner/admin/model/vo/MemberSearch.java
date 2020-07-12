package kr.co.healthner.admin.model.vo;

import lombok.Data;

@Data
public class MemberSearch {
	private int rnum;
	private String searchWord;
	private int checkbox1;
	private int checkbox2;
	private int start;
	private int end;
	private int memberType;
}
