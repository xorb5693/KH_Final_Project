package kr.co.healthner.notice.model.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.notice.model.service.NoticeService;
import kr.co.healthner.notice.model.vo.Notice;
import kr.co.healthner.notice.model.vo.NoticePageDate;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	NoticeService service;
	
	@RequestMapping(value="/notice.do")
	public String Notice(int reqPage , Model model) { // 공지사항 전체목록
		
		return "notice/notice";
	}
	@RequestMapping(value="/noticeWriteFrm.do")
	public String NoticeWriteFrm() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeUp.do")
	public String noticeWrite(HttpSession session  , String ck4 , Notice n) {
		session.setAttribute("img",ck4 );
		Notice m = new Notice();
		m.setNoticeTitle(n.getNoticeTitle());
		m.setNoticeContent(n.getNoticeContent());
		m.setNoticeFilename(ck4);
		int result = service.noticeInsert(m);
		if(result >0) {
			return "notice/notice";
		}else {
			return "notice/notice";
		}
//		session.setAttribute("title", m.getNoticeTitle());
//		session.setAttribute("content", m.getNoticeContent());
//		return "notice/su";
	}
	
	@RequestMapping(value="/noticeList.do") // 공지사항 전체목록출력
	public String noticeList(int reqPage,Model model) {
		NoticePageDate nd = service.noticeList(reqPage);
		System.out.println(nd.getPageNavi());
		model.addAttribute("list",nd.getList());
		model.addAttribute("navi",nd.getPageNavi());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeView.do") // 게시글 상세보기
	public String noticeView(int noticeNo, Notice m, Model model) {
		m.setNoticeNo(noticeNo);
		Notice n = service.noticeView(m);
		model.addAttribute("n",n);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/noticeModify.do")// 게시판 수정
	public String noticeModify(int noticeNo, Notice m, Model model) {
		m.setNoticeNo(noticeNo);
		Notice n = service.noticeView(m);
		model.addAttribute("n",n);
		return "notice/noticeModify";
	}
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(Notice m) {
		int result = service.noticeUpdate(m);
		if(result>0) {
			System.out.println("수정성공");
			
		}else {
			System.out.println("수정실패ㅔ");
			
		}
		return "redirect:/noticeList.do?reqPage=1";
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(int noticeNo , Notice m) {
		m.setNoticeNo(noticeNo);
		int result = service.noticeDelete(m);
		if(result>0) {
			
			System.out.println("게시갈삭제성공");
		}else {
			System.out.println("게시글삭제실패");
		}
		return "redirect:/noticeList.do?reqPage=1";	
	}
	
	
	@RequestMapping(value="/boardWriteFrm") public String boardWriteFrm() {
		return "board/boardWrite"; }
	 

}
