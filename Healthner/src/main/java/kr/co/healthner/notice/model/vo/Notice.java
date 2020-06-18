package kr.co.healthner.notice.model.vo;

import lombok.Data;

@Data
public class Notice {
	private int notice_no;
	private String notice_title;
	private String notice_content;
	private String notice_date;
	private String notice_filename;
	
}
