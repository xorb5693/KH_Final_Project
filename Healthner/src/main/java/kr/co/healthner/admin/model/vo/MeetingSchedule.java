package kr.co.healthner.admin.model.vo;

import lombok.Data;

@Data
public class MeetingSchedule {
	private int meetingSeq;
	private int rnum;
	private String name;
	private String phone;
	private String email;
	private int responseFin;
	private float bmi;
	private int start;
	private int end;
	private int sorting;
}
