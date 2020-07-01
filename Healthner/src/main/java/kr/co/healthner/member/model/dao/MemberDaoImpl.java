package kr.co.healthner.member.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.member.model.vo.AttendanceAvgtimeVO;
import kr.co.healthner.member.model.vo.AttendanceVO;
import kr.co.healthner.member.model.vo.EatLogVO;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.member.model.vo.MenuCommentVO;
import kr.co.healthner.member.model.vo.NutritionTableVO;
import kr.co.healthner.trainer.model.vo.ProfessionalCategoryVO;
import kr.co.healthner.trainer.model.vo.TrainerVO;

@Repository("memberDao")
public class MemberDaoImpl {
	@Autowired
	SqlSessionTemplate session;

	public Member selectMember(Member m) {
		return session.selectOne("member.selectMember",m);
	}

	public int insertMember(Member m) {
		return session.insert("member.insertMember", m);
	}

	public Member checkId(Member m) {
		return session.selectOne("member.checkId", m);
	}
	

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member selectAduino(String cardNo) {
		
		return sqlSession.selectOne("member.selectAduino", cardNo);
	}

	public int aduinoAttendance(int memberNo) {
		
		return sqlSession.insert("attendance.insertAttendance", memberNo);
	}

	//전날 헬스장에 온 멤버들의 번호
	public List<Integer> lastDayAttendanceList() {
		
		return sqlSession.selectList("attendance.lastDayAttendanceList");
	}

	//해당 멤버가 전날 헬스장에서 출결을 몇번 찍었는지 확인
	public int selectAttendanceCount(int memberNo) {
		
		return sqlSession.selectOne("attendance.selectAttendanceCount", memberNo);
	}

	//만약 출결 횟수가 홀수인 경우 즉, 출결을 하지 않고 간 경우 자동으로 1회 입력
	public int insertLastAttendance(int memberNo) {
		
		return sqlSession.insert("attendance.insertLastAttendance", memberNo);
	}

	public List<AttendanceVO> selectAttendanceList(int memberNo) {
		
		return sqlSession.selectList("attendance.selectAttendanceList", memberNo);
	}

	//그날 평균 시간 입력
	public int insertAvg(int avg) {
		
		return sqlSession.insert("attendance.insertAvg", avg);
	}

	public List<AttendanceAvgtimeVO> selectWeekAttendAvg() {
		
		return sqlSession.selectList("attendance.selectWeekAttendAvg");
	}

	public List<AttendanceVO> selectAttendanceTimeList(HashMap<String, Integer> map) {
		
		return sqlSession.selectList("attendance.selectAttendanceTimeList", map);
	}

	public String lastAtt(int memberNo) {
		
		return sqlSession.selectOne("attendance.lastAtt", memberNo);
	}

	public List<NutritionTableVO> selectMenuList(String keyword) {
		
		return sqlSession.selectList("eat.selectMenuList", keyword);
	}

	public int insertEatLog(EatLogVO eat) {
		
		return sqlSession.insert("eat.insertEatLog", eat);
	}

	public int selectEatLogCount(HashMap<String, Integer> map) {
		
		return sqlSession.selectOne("eat.selectEatLogCount", map);
	}

	public List<EatLogVO> selectEatLogList(HashMap<String, Integer> map) {
		
		return sqlSession.selectList("eat.selectEatLogList", map);
	}

	public String selectMemberName(int memberNo) {
		
		return sqlSession.selectOne("member.selectMemberName", memberNo);
	}

	public int insertMenuComment(MenuCommentVO comment) {
		
		return sqlSession.insert("eat.insertMenuComment", comment);
	}

	public List<MenuCommentVO> menuCommentList(int menuNo) {

		return sqlSession.selectList("eat.menuCommentList", menuNo);
	}

	public int deleteMenuComment(int cmtNo) {
		
		return sqlSession.delete("eat.menuCommentDelete", cmtNo);
	}

	public int modifyMenuComment(MenuCommentVO comment) {
		
		return sqlSession.update("eat.modifyMenuComment", comment);
	}
	
	public List<MemberMappingVO> selectMappingList(int memberNo) {

		return sqlSession.selectList("member.selectMappingList", memberNo);
	}

	public TrainerVO selectTrainerInfo(int trainerNo) {

		return sqlSession.selectOne("trainer.selectTrainerInfo", trainerNo);
	}

	public List<ProfessionalCategoryVO> selectCategoryList() {

		return sqlSession.selectList("trainer.selectCategoryList");
	}

	public int insertPostscript(MemberMappingVO mapping) {

		return sqlSession.update("member.insertPostscript", mapping);
	}

}