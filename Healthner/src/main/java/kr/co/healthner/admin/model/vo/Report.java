package kr.co.healthner.admin.model.vo;

import lombok.Data;

@Data
public class Report {
	private int rnum;
	private int writeNo;
	private int writeType;
	private int reportedNo;
	private String reportedId;
	private String reportedName;
	private int memberNo;
	private String memberId;
	private String reportName;
	private int reportCat;
	private String categoryName;
	private String reportDetail;
	private String boardTitle;
	private String commentContent;
	private int reportCnt;
	private String searchWord;
	private int start;
	private int end;
	private int sorting;
	private int boardCnt;
	private int commentCnt;
	private int totalReportRec;
	private int memberType;
	private int inBanListCheck;
}
