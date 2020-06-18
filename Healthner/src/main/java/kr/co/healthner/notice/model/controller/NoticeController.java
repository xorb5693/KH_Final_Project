package kr.co.healthner.notice.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.notice.model.service.NoticeService;

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

}
