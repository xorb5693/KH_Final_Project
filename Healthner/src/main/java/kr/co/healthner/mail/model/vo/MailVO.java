package kr.co.healthner.mail.model.vo;

import lombok.Data;

@Data
public class MailVO {

	private int mailNo;
	private int sender;
	private int receiver;
	private String mailContent;
	private String writeDate;
	private int readCount;
	private String memberNick;
	private String memberId;
}
