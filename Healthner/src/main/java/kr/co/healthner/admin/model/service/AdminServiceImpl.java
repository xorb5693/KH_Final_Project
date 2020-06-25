package kr.co.healthner.admin.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kh.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.admin.model.dao.AdminDaoImpl;
import kr.co.healthner.member.model.vo.Member;

@Service("adminService")
public class AdminServiceImpl {
	
	@Autowired
	@Qualifier("adminDao")
	private AdminDaoImpl dao;

	public ArrayList<Member> memberList(MemberSearch ms) {
		return (ArrayList<Member>)dao.memberList(ms);
	}


}
