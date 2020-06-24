package kr.co.heathner.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.heathner.board.model.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("boardService")
	private BoardService service;
	
	@RequestMapping(value="/boardWriteFrm.do")
	public String boardWriteFrm() {
		return "board/boardWrite";
	}

}
