package kr.co.healthner.vo;

import lombok.Data;

@Data
public class BoardVO {
	
	private int boardType;
	private int boardNo;
	private int boardWriter;
	private String boardTitle;
	private String boardContent;
	private String boardDate;
	private String boardFilename;
	private int report;
	private String memberNick;
}
