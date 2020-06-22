package kr.co.healthner.notice.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.notice.model.vo.Notice;

@Repository("noticeDao")
public class NoticeDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int noticeInsert(Notice m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("notice.noticeInsert",m);
	}

	public int totalNotice() {
		
		return sqlSession.selectOne("notice.totalCount");
	}

	public List noticeList(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("notice.noticeList",map);
	}

	public Notice noticeView(Notice m) {
		
		return sqlSession.selectOne("notice.noticeView",m);
	}

	public int noticeUpdate(Notice m) {
		// TODO Auto-generated method stub
		return sqlSession.update("notice.noticeUpdate",m);
	}

	public int noticeDelete(Notice m) {
		// TODO Auto-generated method stub
		return sqlSession.delete("notice.noticeDelete",m);
	}

	

}
