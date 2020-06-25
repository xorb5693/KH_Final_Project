package kr.co.healthner.board.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.vo.BoardVO;

@Repository("boardDao")
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int boardInsert(BoardVO bv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert",bv);
	}

}
