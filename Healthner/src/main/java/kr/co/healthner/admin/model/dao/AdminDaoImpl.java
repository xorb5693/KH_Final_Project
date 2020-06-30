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

	// 혜진_200629_회원관리 페이지_팝업창_전체 회원 리스트의 수를 세어옴
	public int totalCount(MemberSearch ms) {
		return sqlSession.selectOne("admin.totalCount", ms);
	}
	
	// 혜진_200630_회원관리 페이지_팝업창_카드 정보를 수정함
	public int cardModify(Member m) {
		return sqlSession.update("admin.cardModify", m);
	}
	

}