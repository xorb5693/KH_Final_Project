package kr.co.healthner.vo;

import lombok.Data;

@Data
public class EatLogVO {

	private int menuNo;
	private String foodName;
	private String eatDate;
	private String eatTime;
	private int memberNo;
	private int kcal;
}
