package kr.co.healthner.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.healthner.mail.model.service.MailServiceImpl;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;

@Controller
@RequestMapping("/healthner/mail")
public class MailController {

	@Autowired
	@Qualifier("mailService")
	private MailServiceImpl service;
	
	@RequestMapping("/receiveList.do")
	public String receiveList(HttpSession session, Model model, int reqPage) {
		
		Member m = (Member)session.getAttribute("member");
		ArrayList<Member> memberList = service.selectMemberList(m);
		model.addAttribute("memberList", memberList);

		return "mail/receiveList";
	}
	
	@ResponseBody
	@RequestMapping("/selectMemberId.do")
	public String selectMemberId(String memberId) {
		
//		System.out.println(memberId);
		Member m = service.selectMemberId(memberId);
//		System.out.println(m);
		
		if (m == null) {
			return "0";
		} else {
			return String.valueOf(m.getMemberNo());
		}
	}
	
	@RequestMapping("/insert.do")
	public String insertMail(MailVO mail) {
		
		int result = service.insertMail(mail);
		
		if (result > 0) {
			System.out.println("쪽지 전송");
		} else {
			System.out.println("전송 실패");
		}
		return "redirect:/healthner/mail/receiveList.do?reqPage=1";
	}
}
