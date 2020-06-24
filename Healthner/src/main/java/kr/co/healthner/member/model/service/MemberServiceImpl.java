package kr.co.healthner.member.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.healthner.member.model.dao.MemberDaoImpl;
import kr.co.healthner.member.model.vo.AttendanceAvgtimeVO;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.AttendancePrintData;
import kr.co.healthner.member.model.vo.AttendanceVO;
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


	public Member checkId(Member m) {
		return dao.checkId(m);
	}
	

	@Transactional
	public AttendanceData aduinoAttendance(String cardNo) {
		
		Member m = dao.selectAduino(cardNo);
		if (m != null && m.getExpireDate() != null) {
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

	public void insertLastAttendance() {
		
		ArrayList<Integer> list = (ArrayList<Integer>)dao.lastDayAttendanceList();
		
		for (int i = 0; i < list.size(); i++) {
			
			int memberNo = list.get(i);
			int count = dao.selectAttendanceCount(memberNo);
			System.out.println(count);
			
			if (count % 2 != 0) {
				dao.insertLastAttendance(memberNo);
			}
		}
	}

	@Transactional
	public void attendanceAvg() {
		ArrayList<Integer> list = (ArrayList<Integer>)dao.lastDayAttendanceList();
		int sum = 0;
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for (int i = 0; i < list.size(); i++) {
			
			int memberNo = list.get(i);
			
			ArrayList<AttendanceVO> attList = (ArrayList<AttendanceVO>)dao.selectAttendanceList(memberNo);
//			System.out.println(memberNo + " : " + attList.size());
			
			for (int j = 0; j < attList.size(); j += 2) {
				try {
//					System.out.println(fm.parse(attList.get(j + 1).getStrAttendDate()).getTime());
//					System.out.println(fm.parse(attList.get(j).getStrAttendDate()).getTime());
					long time = (fm.parse(attList.get(j + 1).getStrAttendDate()).getTime() - fm.parse(attList.get(j).getStrAttendDate()).getTime()) / 1000 / 60;
//					System.out.println("Time : " + time);
					sum += time;
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
		
		if (list.size() != 0) {
			int avg = sum / list.size();
			dao.insertAvg(avg);
		} else {
			dao.insertAvg(0);
		}
	}

	public AttendancePrintData attendanceRead(int memberNo) {
		
		ArrayList<AttendanceAvgtimeVO> avgs = (ArrayList<AttendanceAvgtimeVO>)dao.selectWeekAttendAvg();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		AttendancePrintData data = new AttendancePrintData();
		String labels = "";
		String avgData = "";
		String myData = "";
		
		for (int i = 0; i < 7; i++) {
			map.put("start", i);
			map.put("end", (i + 1));
			ArrayList<AttendanceVO> attList = (ArrayList<AttendanceVO>)dao.selectAttendanceTimeList(map);
			int sum = 0;
			
			//해당 날짜별 운동 시간
			for (int j = 0; j < attList.size(); j += 2) {
				try {
					long time = (fm.parse(attList.get(j + 1).getStrAttendDate()).getTime() - fm.parse(attList.get(j).getStrAttendDate()).getTime()) / 1000 / 60;
					sum += time;
				} catch (ParseException e) {
					e.printStackTrace();
				}
				
			}
			if (i == 0) {
				data.setLastTime(sum);
			} else {
				labels = ", " + labels;
				avgData = ", " + avgData;
				myData = ", " + myData;
			}
			
			labels = "'" + avgs.get(i).getAvgDate().toString() + "'" + labels;
			avgData = avgs.get(i).getAvgTime() + avgData;
			myData = sum + myData;
		}
		
		//그래프 그리기용 데이터 클래스
		//저장되는 정보는 위에서 만들어진 AttendanceAvgData의 list와 해당 계정의 마지막 출결일이다.
		String lastAttd = dao.lastAtt(memberNo);
		data.setLastAttd(lastAttd);
		data.setLabels(labels);
		data.setAvgData(avgData);
		data.setMyData(myData);
		
		return data;
	}
}
