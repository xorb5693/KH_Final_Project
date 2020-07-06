package kr.co.healthner.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.board.model.dao.BoardDao;
import kr.co.healthner.board.model.vo.BoardPageDate;
import kr.co.healthner.notice.model.vo.Notice;
import kr.co.healthner.notice.model.vo.NoticePageDate;
import kr.co.healthner.vo.BoardCommentVO;
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

	public BoardPageDate boardList(int reqPage) {
		int numPerPage = 10;
		
		int totalCount = dao.totalBoard();
		System.out.println(totalCount);
		//총 페이지수 연산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage +1;
		}
		// 조회해올 게시물 시작번호와 끝번호 연산
		
		int start = (reqPage - 1)* numPerPage+1;
		int end = (reqPage)* numPerPage;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end", end);
		List list = dao.BoardList(map);
		ArrayList<BoardVO> li = (ArrayList<BoardVO>)list;
		
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage -1) / pageNaviSize) * pageNaviSize +1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='boardList.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/boardList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/boardList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		BoardPageDate npd = new BoardPageDate();
		npd.setList((ArrayList<BoardVO>)list);
		npd.setPageNavi(pageNavi);
		return npd;

	}

	public BoardVO boardView(BoardVO b) {
		// TODO Auto-generated method stub
		return dao.boardView(b);
	}

	public int boardUpdate(BoardVO b) {
		// TODO Auto-generated method stub
		return dao.boardUpdate(b);
	}

	public int boardDelete(BoardVO b) {
		// TODO Auto-generated method stub
		return dao.boardDelete(b);
	}

	public int commentInsert(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return dao.commentInsert(bc);
	}

	public List commentSelect(BoardCommentVO bb) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("ref", bb.getRef());
		List list = dao.commentSelect(map);
		return list;
	}

	public int deleteComment(BoardCommentVO b) {
		// TODO Auto-generated method stub
		return dao.deleteComment(b);
	}

	public int commentUpdate(BoardCommentVO bc) {
		// TODO Auto-generated method stub
		return dao.commentUpdate(bc);
	}
	
	
}
