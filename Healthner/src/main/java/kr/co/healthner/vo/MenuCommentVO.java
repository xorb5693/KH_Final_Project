package kr.co.healthner.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MenuCommentVO {

	private int cmtNo;
	private int menuNo;
	private Date cmtDate;
	private String cmtContent;
}