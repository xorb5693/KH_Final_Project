package kr.co.heathner.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.heathner.board.model.dao.BoardDao;

@Service
public class BoardService {
	
	@Autowired
	@Qualifier("boardDao")
	private BoardDao dao;
	
	
}
