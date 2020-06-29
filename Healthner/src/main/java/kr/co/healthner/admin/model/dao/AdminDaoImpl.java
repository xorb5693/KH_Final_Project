package kr.co.healthner.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.member.model.vo.Member;

@Repository("adminDao")
public class AdminDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 혜진_200629_start 전달, end 계산하여 함께 전달
	public List memberList(MemberSearch ms) {
		return sqlSession.selectList("admin.memberList", ms);
	}
	
	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	public Member oneMemberSearch(String memberId) {
		return sqlSession.selectOne("admin.oneMemberSearch",memberId);
	}
	

}