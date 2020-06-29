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

	public ArrayList<Member> memberList(String searchWord, int checkbox1, int checkbox2) {
		MemberSearch ms = new MemberSearch();
		ms.setSearchWord(searchWord);
		ms.setCheckbox1(checkbox1);
		ms.setCheckbox2(checkbox2);
		return (ArrayList<Member>)dao.memberList(ms);
	}


}
