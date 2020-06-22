package kr.co.healthner.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.member.model.dao.MemberDaoImpl;
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


	public int checkId(Member m) {
		return dao.checkId(m);
	}

}
