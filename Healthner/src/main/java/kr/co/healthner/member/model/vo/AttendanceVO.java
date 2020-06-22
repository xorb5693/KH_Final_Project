package kr.co.healthner.member.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class AttendanceVO {

	private int memberNo;
	private Date attentDate;
}
