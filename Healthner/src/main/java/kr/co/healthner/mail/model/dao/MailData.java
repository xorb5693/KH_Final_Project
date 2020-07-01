package kr.co.healthner.mail.model.dao;

import java.util.ArrayList;

import kr.co.healthner.mail.model.vo.MailVO;
import lombok.Data;

@Data
public class MailData {

	private ArrayList<MailVO> list;
	private String pageNavi;
}
