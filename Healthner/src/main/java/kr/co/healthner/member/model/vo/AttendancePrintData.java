package kr.co.healthner.member.model.vo;

import lombok.Data;

@Data
public class AttendancePrintData {

	private String labels;
	private String avgData;
	private String myData;
	private String lastAttd;
	private int lastTime;
	private String memberName;
}
