package kr.co.healthner.admin.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.member.model.vo.Member;

@Repository("adminDao")
public class AdminDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

}