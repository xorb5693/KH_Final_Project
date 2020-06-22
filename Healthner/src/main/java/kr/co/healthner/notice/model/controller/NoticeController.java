package kr.co.healthner.notice.model.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.notice.model.service.NoticeService;
import kr.co.healthner.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	NoticeService service;
	
	@RequestMapping(value="/notice.do")
	public String Notice() {
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
		m.setNotice_title(n.getNotice_title());
		
		session.setAttribute("title", m.getNotice_title());
		return "notice/su";
	}

}
