package kr.co.healthner.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.board.model.dao.BoardDao;
import kr.co.healthner.vo.BoardVO;

@Service
public class BoardService {
	
	@Autowired
	@Qualifier("boardDao")
	private BoardDao dao;

	public int boardInsert(BoardVO bv) {
		// TODO Auto-generated method stub
		return dao.boardInsert(bv);
	}
	
	
}
