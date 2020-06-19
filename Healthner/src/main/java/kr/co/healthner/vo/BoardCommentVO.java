package kr.co.healthner.vo;

import lombok.Data;

@Data
public class BoardCommentVO {

	private int commentNo;
	private int commentWriter;
	private String commentContent;
	private String commentDate;
	private int commentLevel;
	private int ref;
	private int commentRef;
}
