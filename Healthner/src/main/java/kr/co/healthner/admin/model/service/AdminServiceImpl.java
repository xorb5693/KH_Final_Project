package kr.co.healthner.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.healthner.admin.model.dao.AdminDaoImpl;
import kr.co.healthner.member.model.dao.MemberDaoImpl;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.Member;

@Service("adminService")
public class AdminServiceImpl {
	
	@Autowired
	@Qualifier("adminDao")
	private AdminDaoImpl dao;

	public ArrayList<Member> memberList(String searchWord, String checkbox1, String checkbox2) {
		return dao.memberList(searchWord, checkbox1, checkbox2);
	}


}
