package kr.co.healthner.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MenuCommentVO {

	private int cmtNo;
	private int menuNo;
	private Date cmtDate;
	private String cmtContent;
	private int writerNo;
	private String memberNick;
}
