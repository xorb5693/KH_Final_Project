package kr.co.healthner.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.vo.BoardCommentVO;
import kr.co.healthner.vo.BoardVO;

@Repository("boardDao")
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSession;

	public int boardInsert(BoardVO bv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert",bv);
	}

	public List BoardList(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",map);
	}

	public int totalBoard() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.totalCount");
	}

	public BoardVO boardView(BoardVO b) {
		
		return sqlSession.selectOne("board.boardView",b);
	}

	public int boardUpdate(BoardVO b) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.boardUpdate",b);
	}

	public int boardDelete(BoardVO b) {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.boardDelete",b);
	}

	public int commentInsert(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return sqlSession.insert("comment.commentInsert",bc);
	}

	public List commentSelect(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("comment.commentSelect",map);
	}

	public int deleteComment(BoardCommentVO b) {
		// TODO Auto-generated method stub
		return sqlSession.delete("comment.commentDelete",b);
	}

	public int commentUpdate(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return sqlSession.update("comment.commentUpdate",bc);
	}



	public int totalSearchList(HashMap<String, String> map2) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.totalSearchList",map2);
	}

	public List BoardSearchTitleList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardSearchList",map);
	}

	public int selectBanList(int memberNo) {
		
		return sqlSession.selectOne("notice.selectBanList", memberNo);
	}

}
