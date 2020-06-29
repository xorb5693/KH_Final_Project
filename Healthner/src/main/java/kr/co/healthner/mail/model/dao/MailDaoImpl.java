package kr.co.healthner.mail.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;

@Repository("mailDao")
public class MailDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public Member selectAdmin() {
		
		return sqlSession.selectOne("member.selectAdmin");
	}

	public List<Integer> selectMappingMemberNoList(Member m) {
		
		return sqlSession.selectList("member.selectMappingMemberNoList", m);
	}

	public Member selectMemberNick(int memberNo) {
		
		return sqlSession.selectOne("member.selectMemberNick", memberNo);
	}

	public Member selectMemberId(Member m) {
		
		return sqlSession.selectOne("member.selectMember", m);
	}

	public int insertMail(MailVO mail) {
		
		return sqlSession.insert("mail.insertMail", mail);
	}
}
