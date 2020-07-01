package kr.co.healthner.member.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class EatLogData {

	private ArrayList<EatLogVO> list;
	private String pageNavi;
	private String memberName;
}
