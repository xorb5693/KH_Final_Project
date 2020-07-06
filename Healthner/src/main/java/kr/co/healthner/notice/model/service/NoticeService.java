package kr.co.healthner.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.notice.model.dao.NoticeDao;
import kr.co.healthner.notice.model.vo.Notice;
import kr.co.healthner.notice.model.vo.NoticePageDate;

@Service("noticeService")
public class NoticeService {
	
	@Autowired
	@Qualifier("noticeDao")
	private NoticeDao dao;

	public int noticeInsert(Notice m) {
		// TODO Auto-generated method stub
		return dao.noticeInsert(m);
	}

	public NoticePageDate noticeList(int reqPage) {
		int numPerPage = 3;
		
		int totalCount = dao.totalNotice();
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
		List list = dao.noticeList(map);
		ArrayList<Notice> li = (ArrayList<Notice>)list;
		
		String pageNavi = "";
		int pageNaviSize = 3;
		int pageNo = ((reqPage -1) / pageNaviSize) * pageNaviSize +1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='noticeList.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		NoticePageDate npd = new NoticePageDate();
		npd.setList((ArrayList<Notice>)list);
		npd.setPageNavi(pageNavi);
		return npd;
	}

	public Notice noticeView(Notice m) {
		
		return dao.noticeView(m);
	}

	public int noticeUpdate(Notice m) {
		// TODO Auto-generated method stub
		return dao.noticeUpdate(m);
	}

	public int noticeDelete(Notice m) {
		// TODO Auto-generated method stub
		return dao.noticeDelete(m);
	}

	/*
	 * public List<Object> noticeTitleSearch(String searchTitle) { // TODO
	 * Auto-generated method stub return dao.noticeSearch(searchTitle); }
	 */

	public NoticePageDate noticeListSearch(int reqPage, String searchTitle) {
		int numPerPage = 3;
		
		int totalCount = dao.totalSearchNotice(searchTitle);
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
		List list = dao.noticeSearch(searchTitle);
		
		
		String pageNavi = "";
		int pageNaviSize = 3;
		int pageNo = ((reqPage -1) / pageNaviSize) * pageNaviSize +1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='noticeList.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		NoticePageDate npd = new NoticePageDate();
		npd.setList((ArrayList<Notice>)list);
		npd.setPageNavi(pageNavi);
		return npd;
	}



}
