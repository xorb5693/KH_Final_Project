package kr.co.healthner.mail.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class MailData {

	private ArrayList<MailVO> list;
	private String pageNavi;
}
