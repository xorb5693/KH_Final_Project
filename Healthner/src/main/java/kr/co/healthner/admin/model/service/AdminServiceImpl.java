package kr.co.healthner.admin.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.admin.model.dao.AdminDaoImpl;
import kr.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.admin.model.vo.TotalpageList;
import kr.co.healthner.member.model.vo.Member;

@Service("adminService")
public class AdminServiceImpl {

	@Autowired
	@Qualifier("adminDao")
	private AdminDaoImpl dao;


	// 혜진_200629_start 전달, end 계산하여 함께 전달
	public TotalpageList memberList(String searchWord, int checkbox1, int checkbox2, int start) {
		// 전체 게시글 갯수 카운트
		MemberSearch ms = new MemberSearch();
		ms.setSearchWord(searchWord);
		ms.setCheckbox1(checkbox1);
		ms.setCheckbox2(checkbox2);
		ms.setMemberType(1);
		int totalCount = dao.totalCount(ms);
		// 넘버링
		int length = 5;
		int end = start + length - 1;
		ms.setStart(start);
		ms.setEnd(end);
		ArrayList<Member> list = (ArrayList<Member>) dao.memberList(ms);

		// 태규_200630_expiredate가 null인 경우 공백처리
		for (Member m : list) {
			if (m.getExpireDate() == null) {
				m.setExpireDate(" ");
			}
		}
		TotalpageList tl = new TotalpageList();
		tl.setList(list);
		tl.setTotalCount(totalCount);
		return tl;
	}

	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	public Member oneMemberSearch(String memberId) {
		return dao.oneMemberSearch(memberId);
	}

	// 혜진_200630_회원관리 페이지_팝업창_카드 정보를 수정함_카드 정보와 member정보를 묶어 보내기
	public int cardModify(String memberId, String card) {
		Member m = new Member();
		m.setMemberId(memberId);
		m.setCard(card);
		return dao.cardModify(m);
	}

	// 혜진_200630_트레이너 페이지_정보 조회
	public TotalpageList trainerList(String searchWord, int memberType, int start) {
		// 전체 게시글 갯수 카운트
		MemberSearch ms = new MemberSearch();
		ms.setSearchWord(searchWord);
		ms.setMemberType(memberType);
		int totalCount = dao.totalCount(ms);
		// 넘버링
		int length = 5;
		int end = start + length - 1;
		ms.setStart(start);
		ms.setEnd(end);
		ArrayList<Member> list = (ArrayList<Member>) dao.trainerList(ms);
		for (Member m : list) {
			if (m.getExpireDate() == null) {
				m.setExpireDate(" ");
			}
		}
		TotalpageList tl = new TotalpageList();
		tl.setList(list);
		tl.setTotalCount(totalCount);
		return tl;
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 멤버 타입 변환
	public int approveTrainer(String memberId) {
		return dao.approveTrainer(memberId);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 회원 삭제
	public int rejectTrainer(String memberId) {
		return dao.rejectTrainer(memberId);
	}

}
