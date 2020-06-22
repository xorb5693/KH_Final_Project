package kr.co.healthner.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AttendanceAvgtimeVO {

	private Date avgDate;
	private int avgTime;
}
