package kr.co.healthner.vo;

import lombok.Data;

@Data
public class MailVO {

	private int mailNo;
	private int sender;
	private int receiver;
	private String mailContent;
	private String writeDate;
	private int readCount;
}
