package kr.co.healthner.member.model.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.healthner.member.model.dao.MemberDaoImpl;
import kr.co.healthner.member.model.vo.AttendanceAvgtimeVO;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.AttendanceLastDate;
import kr.co.healthner.member.model.vo.AttendancePrintData;
import kr.co.healthner.member.model.vo.AttendanceVO;
import kr.co.healthner.member.model.vo.EatLogData;
import kr.co.healthner.member.model.vo.EatLogVO;
import kr.co.healthner.member.model.vo.MappingTrainerData;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.member.model.vo.MenuCommentVO;
import kr.co.healthner.member.model.vo.NutritionTableVO;
import kr.co.healthner.trainer.model.vo.ProfessionalCategoryVO;
import kr.co.healthner.trainer.model.vo.TrainerVO;

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
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Calendar calendar = Calendar.getInstance();
		HashMap<String, String> map = new HashMap<String, String>();
		
		for (int i = 0; i < list.size(); i++) {
			
			int memberNo = list.get(i);
			AttendanceLastDate count = dao.selectAttendanceCount(memberNo);
			System.out.println(count.getCount());
			
			if (count.getCount() % 2 != 0) {
				try {
					calendar.setTime(fm.parse(count.getStrAttendDate()));
					int hour = calendar.get(Calendar.HOUR_OF_DAY);
					System.out.println(hour);
					
					if (hour == 23) {
						dao.insertLastAttendance(memberNo);
					} else {
						map.put("memberNo", String.valueOf(memberNo));
						map.put("time", count.getStrAttendDate());
						dao.insertLastAttendance(map);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
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


	public Member checkNick(Member m) {
		return dao.checkNick(m);
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
		String lastAttd = dao.lastAtt(memberNo);
		String memberName = dao.selectMemberName(memberNo);
		data.setLastAttd(lastAttd);
		data.setLabels(labels);
		data.setAvgData(avgData);
		data.setMyData(myData);
		data.setMemberName(memberName);
		
		return data;
	}

	public ArrayList<NutritionTableVO> selectMenuList(String keyword) {
		
		List<NutritionTableVO> list = dao.selectMenuList(keyword);
		return (ArrayList<NutritionTableVO>)list;
	}

	public int insertEatLog(EatLogVO eat) {
		
		return dao.insertEatLog(eat);
	}


	public EatLogData selectEatLogList(int memberNo, int reqPage) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		
		//한 페이지당 식사 기록 수
		int numPerPage = 10;
		
		//총 식사 기룩
		int totalCount = dao.selectEatLogCount(map);
		//총 페이지 수
		int totalPage;
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		map.put("start", start);
		map.put("end", end);
		ArrayList<EatLogVO> list = (ArrayList<EatLogVO>)dao.selectEatLogList(map);
		
		StringBuffer pageNavi = new StringBuffer();
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/member/myEat.do?memberNo=" + memberNo + "&reqPage=" + (pageNo - 1) + "'>이전</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			
			if (pageNo == reqPage) {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			} else {
				pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/member/myEat.do?memberNo=" + memberNo + "&reqPage=" + pageNo + "'>" + pageNo + "</a>");
			}
			
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/member/myEat.do?memberNo=" + memberNo + "&reqPage=" + pageNo + "'>다음</a>");
		}
		
		EatLogData data = new EatLogData();
		String memberName = dao.selectMemberName(memberNo);
		data.setList(list);
		data.setPageNavi(pageNavi.toString());
		data.setMemberName(memberName);
		
		return data;
	}


	public int insertMenuComment(MenuCommentVO comment) {
		
		return dao.insertMenuComment(comment);
	}


	public ArrayList<MenuCommentVO> menuCommentList(int menuNo) {
		
		return (ArrayList<MenuCommentVO>)dao.menuCommentList(menuNo);
	}


	public int deleteMenuComment(int cmtNo) {
		
		return dao.deleteMenuComment(cmtNo);
	}


	public int modifyMenuComment(MenuCommentVO comment) {
		
		return dao.modifyMenuComment(comment);
	}
	
	public ArrayList<MappingTrainerData> myTrainer(int memberNo) {

		ArrayList<MemberMappingVO> mappings = (ArrayList<MemberMappingVO>)dao.selectMappingList(memberNo);
		ArrayList<MappingTrainerData> list = new ArrayList<MappingTrainerData>();
		ArrayList<ProfessionalCategoryVO> categorys = (ArrayList<ProfessionalCategoryVO>)dao.selectCategoryList();
		HashMap<Integer, String> categoryMap = new HashMap<Integer, String>();

		for (ProfessionalCategoryVO category : categorys) {

			categoryMap.put(category.getCategoryNo(), category.getCategoryName());
		}

		for (MemberMappingVO mapping : mappings) {

			TrainerVO trainer = dao.selectTrainerInfo(mapping.getTrainerNo());
			trainer.setCatFirstName(categoryMap.get(trainer.getCatFirst()));
			trainer.setCatSecondName(categoryMap.get(trainer.getCatSecond()));
			trainer.setCatThirdName(categoryMap.get(trainer.getCatThird()));

			MappingTrainerData data = new MappingTrainerData();
			data.setMapping(mapping);
			data.setTrainer(trainer);

			list.add(data);
		}

		return list;
	}


	public int insertPostscript(MemberMappingVO mapping) {

		return dao.insertPostscript(mapping);
	}


	public Member selectArduino(String cardNo) {
		
		return dao.selectAduino(cardNo);
	}


	public int insertCard(String memberId, String card) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memberId", memberId);
		map.put("card", card);
		
		return dao.insertCard(map);
	}


	public int deleteCard(String memberId) {
		
		return dao.deleteCard(memberId);
    }
        public int verifyMail(String memberId) {
		return dao.verifyMail(memberId);
	}


		public Member retrieveId(Member m) {
			Member member = dao.retrieveId(m);
			return member;
		}


		public Member retrievePw(Member m) {
			return dao.retrievePw(m);
		}


		public int resetPwMember(Member m) {
			return dao.resetPwMember(m);
		}
}
