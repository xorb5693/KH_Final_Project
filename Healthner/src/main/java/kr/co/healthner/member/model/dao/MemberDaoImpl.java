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
	

	@Autowired
	SqlSessionTemplate sqlSession;
	
	public Member selectAduino(String cardNo) {
		
		return sqlSession.selectOne("member.selectAduino", cardNo);
	}

	public int aduinoAttendance(int memberNo) {
		
		return sqlSession.insert("attendance.insertAttendance", memberNo);
	}

}