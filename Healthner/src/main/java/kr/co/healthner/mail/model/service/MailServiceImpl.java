package kr.co.healthner.mail.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.mail.model.dao.MailDaoImpl;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;

@Service("mailService")
public class MailServiceImpl {

	@Autowired
	@Qualifier("mailDao")
	private MailDaoImpl dao;

	public ArrayList<Member> selectMemberList(Member m) {
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		Member admin = dao.selectAdmin();
		memberList.add(admin);
		
		ArrayList<Integer> memberNoList = (ArrayList<Integer>)dao.selectMappingMemberNoList(m);
		
		for (int memberNo: memberNoList) {
			Member member = dao.selectMemberNick(memberNo);
			memberList.add(member);
		}
		
		return memberList;
	}

	public Member selectMemberId(String memberId) {
		
		Member m = new Member();
		m.setMemberId(memberId);
		return dao.selectMemberId(m);
	}

	public int insertMail(MailVO mail) {
		
		return dao.insertMail(mail);
	}
}
