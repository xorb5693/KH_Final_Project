package kr.co.healthner.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.admin.model.vo.PTmapping;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;

@Repository("adminDao")
public class AdminDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 혜진_200629_회원관리 페이지_전체 리스트 조회 start 전달, end 계산하여 함께 전달
	public List memberList(MemberSearch ms) {
		return sqlSession.selectList("admin.memberList", ms);
	}

	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	public Member oneMemberSearch(String memberId) {
		return sqlSession.selectOne("admin.oneMemberSearch", memberId);
	}

	// 혜진_200629_회원관리 페이지&트레이너 페이지_전체 회원 리스트의 수를 세어옴
	public int totalCount(MemberSearch ms) {
		return sqlSession.selectOne("admin.totalCount", ms);
	}

	// 혜진_200630_회원관리 페이지_팝업창_카드 정보를 수정함
	public int cardModify(Member m) {
		return sqlSession.update("admin.cardModify", m);
	}

	// 혜진_200630_트레이너 페이지_전체 리스트 조회
	public List trainerList(MemberSearch ms) {
		return sqlSession.selectList("admin.trainerList", ms);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 멤버 타입 변환
	public int approveTrainer(String memberId) {
		return sqlSession.update("admin.trainerApprove", memberId);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 회원 삭제
	public int rejectTrainer(String memberId) {
		return sqlSession.delete("admin.trainerReject", memberId);
	}

	// 혜진_200702_PT Mapping 페이지_Mapping조회
	public List ptMapping(PTmapping ms) {
		return sqlSession.selectList("admin.ptmapping", ms);
	}

	public int insertMail(MailVO mail) {
		
		return sqlSession.insert("mail.insertMail", mail);
	}
	

	// 혜진_200702_PT Mapping 페이지_Mapping 전체 갯수 조회
	public int ptTotalCount(PTmapping ms) {
		return sqlSession.selectOne("admin.ptTotalCount", ms);
	}
	
	// 태규_200703_메일
	public int deleteMail(int[] deleteNo) {
		
		return sqlSession.delete("mail.deleteMail", deleteNo);
	}

	public int selectTotalReciveCount(HashMap<String, Integer> map) {

		return sqlSession.selectOne("mail.selectTotalReciveCount", map);
	}

	public List<MailVO> selectReceiveMailList(HashMap<String, Integer> map) {


		return sqlSession.selectList("mail.selectReceiveMailList", map);
	}

	public int selectTotalSendCount(HashMap<String, Integer> map) {

		return sqlSession.selectOne("mail.selectTotalSendCount", map);
	}

	public List<MailVO> selectSendMailList(HashMap<String, Integer> map) {

		return sqlSession.selectList("mail.selectSendMailList", map);
	}
}