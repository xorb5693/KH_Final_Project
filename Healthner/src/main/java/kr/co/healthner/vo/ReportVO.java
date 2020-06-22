package kr.co.healthner.vo;

import lombok.Data;

@Data
public class ReportVO {

	private int writeType;
	private int writeNo;
	private int ReportedNo;
	private int memberNo;
	private int reportCat;
	private String reportDetail;
}
