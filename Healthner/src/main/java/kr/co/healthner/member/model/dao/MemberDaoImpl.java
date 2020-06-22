package kr.co.healthner.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.member.model.vo.Member;

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

	public String checkId(Member m) {
		return session.selectOne("member.checkId", m);
	}
	
	
}