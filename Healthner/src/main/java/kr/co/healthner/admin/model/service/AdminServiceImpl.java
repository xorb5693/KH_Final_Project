package kr.co.healthner.admin.model.service;

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
	@Qualifier("AdminDao")
	AdminDaoImpl dao;


}
