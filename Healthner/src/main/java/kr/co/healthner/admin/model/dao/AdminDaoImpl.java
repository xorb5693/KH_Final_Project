package kr.co.healthner.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.admin.model.vo.MemberSearch;

@Repository("adminDao")
public class AdminDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List memberList(MemberSearch ms) {
		return sqlSession.selectList("admin.memberList", ms);
	}
	

}