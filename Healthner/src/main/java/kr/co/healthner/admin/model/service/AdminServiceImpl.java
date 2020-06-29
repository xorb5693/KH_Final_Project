package kr.co.healthner.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.admin.model.dao.AdminDaoImpl;
import kr.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.member.model.vo.Member;

@Service("adminService")
public class AdminServiceImpl {

	@Autowired
	@Qualifier("adminDao")
	private AdminDaoImpl dao;

	// 혜진_200629_start 전달, end 계산하여 함께 전달
	public ArrayList<Member> memberList(String searchWord, int checkbox1, int checkbox2, int start) {
		int length = 10;
		int end = start + length-1;
		MemberSearch ms = new MemberSearch();
		ms.setSearchWord(searchWord);
		ms.setCheckbox1(checkbox1);
		ms.setCheckbox2(checkbox2);
		ms.setStart(start);
		ms.setEnd(end);
		System.out.println("start:"+start);
		System.out.println("end:"+end);
		return (ArrayList<Member>) dao.memberList(ms);
	}
	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	public Member oneMemberSearch(String memberId) {
		return dao.oneMemberSearch(memberId);
	}

}
