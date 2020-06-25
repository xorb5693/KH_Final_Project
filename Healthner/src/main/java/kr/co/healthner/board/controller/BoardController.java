package kr.co.healthner.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.board.model.service.BoardService;
import kr.co.healthner.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("boardService")
	private BoardService service;
	
	@RequestMapping(value="/boardTest.do")
	public String boardTest() {
		
		System.out.println("ㅁㄴㅇㅁㄴㅇ");
		return "board/boardTestSuccess";
	}
	
	
	@RequestMapping(value="/boardUp.do")
	public String boardUp(HttpSession session, String ck4 , BoardVO b) {
		int memberNo = 0;
		BoardVO bv = new BoardVO();
		bv.setBoardContent(b.getBoardContent());
		bv.setBoardTitle(b.getBoardTitle());
		bv.setBoardFilename(ck4);
		bv.setBoardWriter(memberNo);
		int result = service.boardInsert(bv);
		if(result >0) {
			System.out.println("자게글쓰기성공");
			return "notice/notice";
		}else {
			System.out.println("자게글쓰기실패");
			return "notice/notice";
		}
	}

}
