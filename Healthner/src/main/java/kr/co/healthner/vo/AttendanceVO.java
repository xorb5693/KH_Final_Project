package kr.co.healthner.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AttendanceVO {

	private int memberNo;
	private Date attentDate;
}
