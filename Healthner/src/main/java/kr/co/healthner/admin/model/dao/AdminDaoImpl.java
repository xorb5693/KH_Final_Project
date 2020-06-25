package kr.co.healthner.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.member.model.vo.Member;

@Repository("adminDao")
public class AdminDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Member> memberList(String searchWord, String checkbox1, String checkbox2) {
		return sqlSession.memberList("admin.memberList", searchWord, checkbox1, checkbox2);
	}
	

}