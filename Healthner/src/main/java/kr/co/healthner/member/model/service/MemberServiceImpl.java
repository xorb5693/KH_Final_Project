package kr.co.healthner.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.healthner.member.model.dao.MemberDaoImpl;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.Member;

import kr.co.healthner.member.model.dao.MemberDaoImpl;
import kr.co.healthner.member.model.vo.Member;

@Service("memberService")
public class MemberServiceImpl {
	@Autowired
	@Qualifier("memberDao")
	MemberDaoImpl dao;
	
	
	public Member selectMember(Member m) {
		return dao.selectMember(m);
	}


	public int insertMember(Member m) {
		return dao.insertMember(m);
	}


	public String checkId(Member m) {
		return dao.checkId(m);
	}
	

	@Transactional
	public AttendanceData aduinoAttendance(String cardNo) {
		
		Member m = dao.selectAduino(cardNo);
		if (m != null) {
//			System.out.println(m.getMemberNo());
			int result = dao.aduinoAttendance(m.getMemberNo());
			AttendanceData data = new AttendanceData();
			data.setMember(m);
			data.setResult(result);
			
			return data;
			
		} else {
			return null;
		}
	}

}
