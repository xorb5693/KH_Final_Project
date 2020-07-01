package kr.co.healthner.member.model.vo;

import lombok.Data;

@Data
public class EatLogVO {

	private int menuNo;
	private String foodName;
	private String eatDate;
	private String eatTime;
	private int memberNo;
	private float kcal;
}
