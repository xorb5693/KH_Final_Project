package kr.co.healthner.board.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.board.model.service.BoardService;
import kr.co.healthner.board.model.vo.BoardPageDate;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.notice.model.vo.Notice;
import kr.co.healthner.notice.model.vo.NoticePageDate;
import kr.co.healthner.vo.BoardCommentVO;
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
		int memberNo = 2;
		BoardVO bv = new BoardVO();
		bv.setBoardContent(b.getBoardContent());
		bv.setBoardTitle(b.getBoardTitle());
		bv.setBoardFilename(b.getBoardContent());
		bv.setBoardWriter(memberNo);
		int result = service.boardInsert(bv);
		if(result >0) {
			System.out.println("자게글쓰기성공");
			return "redirect:/boardList.do?reqPage=1";
		}else {
			System.out.println("자게글쓰기실패");
			return "notice/notice";
		}
	}
	
	@RequestMapping(value="/boardList.do") // 자유게시판 전체목록출력
	public String boardList(int reqPage,Model model) {
		BoardPageDate nd = service.boardList(reqPage);		
		
		System.out.println(nd.getPageNavi());
		model.addAttribute("list",nd.getList());
		model.addAttribute("navi",nd.getPageNavi());
		return "board/boardList";
	}
	
	
	
	@RequestMapping(value="/boardModify.do")
	public String boardModify(int boardNo, BoardVO b, Model model) {
		b.setBoardNo(boardNo);
		BoardVO bb = service.boardView(b);
		model.addAttribute("b",bb);
		
		return "board/boardModify";
	}
	
	@RequestMapping(value="/boardUpdate.do")
	public String boardUpdate(BoardVO b) {
		int result = service.boardUpdate(b);
		if(result >0) {
			System.out.println("게시판수정완료");
		}else {
			System.out.println("게시판수정실패");
		}
		return "redirect:/boardList.do?reqPage=1";
		
		
	}
	
	@RequestMapping(value="boardDelete.do")
	public String boardDelete(int boardNo , BoardVO b) {
		b.setBoardNo(boardNo);
		int result = service.boardDelete(b);
		if(result >0) {
			System.out.println("게시글삭제완료");
		}else {
			System.out.println("게시글삭제실패");
		}
		return "redirect:/boardList.do?reqPage=1";
	}
	@RequestMapping(value="commentDelete.do")
	public String DeleteComment(int commentNo,int ref ) {
		
		BoardCommentVO b = new BoardCommentVO();
		b.setCommentNo(commentNo);
		int result = service.deleteComment(b);
		return "redirect:/boardView.do?boardNo="+ref;
	}
	
	@RequestMapping(value="/boardCommentInsert.do")
	public String boardCommentInsert(BoardCommentVO bc, int boardNo) {
//		System.out.println("테스트용");
//		System.out.println("글쓴이 : "+bc.getCommentWriter());
//		System.out.println(bc.getRef());
//		System.out.println(bc.getCommentLevel());
//		System.out.println(bc.getCommentRef());
		
		int result = service.commentInsert(bc);
		if(result>0) {
			System.out.println("댓글작성성공");
		}else {
			System.out.println("댓글작성실패");
		}
		return "redirect:/boardView.do?boardNo="+boardNo;
	}
	
	@RequestMapping(value="commentUpdate.do")
	public String CommentUpdate(BoardCommentVO bc) {
		int boardNo = bc.getRef();
		System.out.println("댓글수정 테스트");
		System.out.println(boardNo);
		
		int result = service.commentUpdate(bc);
		
		
		return "redirect:/boardView.do?boardNo="+boardNo;
		
	}
	
	
	@RequestMapping(value="/boardView.do")
	public String boardView(int boardNo,BoardVO b, Model model , BoardCommentVO bc) {
		b.setBoardNo(boardNo);
		bc.setRef(boardNo);
		System.out.println("ref 테스트" +bc.getRef());
		List bcc = service.commentSelect(bc);
		BoardVO bb = service.boardView(b);
		model.addAttribute("b",bb);
		model.addAttribute("list",bcc);
		
		return "board/boardView";
	}
	
	@RequestMapping(value="/boardSearchList.do") // 자유게시판 전체목록출력
	public String boardSearchList(int reqPage,Model model,String boardType , String searchString) {
		System.out.println(boardType);
		System.out.println(searchString);
		BoardPageDate nd = service.boardSearchList(reqPage,boardType,searchString);
		
		
//		System.out.println(nd.getPageNavi());
		model.addAttribute("list",nd.getList());
		model.addAttribute("keyword",searchString);
		model.addAttribute("navi",nd.getPageNavi());
		return "board/boardList";
		
	}
	
	
	
	
	
	

}
