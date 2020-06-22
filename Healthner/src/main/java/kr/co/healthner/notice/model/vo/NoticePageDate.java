package kr.co.healthner.notice.model.vo;

import java.util.ArrayList;

import lombok.Data;
@Data
public class NoticePageDate {
	private ArrayList<Notice> list;
	private String pageNavi;

}
