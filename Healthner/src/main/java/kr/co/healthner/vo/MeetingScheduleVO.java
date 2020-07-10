package kr.co.healthner.vo;

import lombok.Data;

@Data
public class MeetingScheduleVO {

	private int meetingSeq;
	private String name;
	private String phone;
	private String email;
	private float bmi;
	private int responseFin;
}
