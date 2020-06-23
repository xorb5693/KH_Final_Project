package kr.co.healthner.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import kr.co.healthner.member.model.service.MemberServiceImpl;

@Component
public class AttendanceAvgScheduled {

	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl service;
	
	@Scheduled(cron = "30 25 15 * * *")
	public void attendanceAvg() {
		service.insertLastAttendance();
		service.attendanceAvg();
	}
}
