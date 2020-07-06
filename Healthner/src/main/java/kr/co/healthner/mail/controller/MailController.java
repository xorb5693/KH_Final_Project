package kr.co.healthner.mail.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.healthner.mail.model.service.MailServiceImpl;
import kr.co.healthner.mail.model.vo.MailData;
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
		
		MailData data = service.receiveMailData(reqPage, m.getMemberNo());
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
//		System.out.println(data.getPageNavi());

		return "mail/receiveList";
	}
	
	@RequestMapping("/sendList.do")
	public String sendList(HttpSession session, Model model, int reqPage) {
		
		Member m = (Member)session.getAttribute("member");
		ArrayList<Member> memberList = service.selectMemberList(m);
		model.addAttribute("memberList", memberList);
		
		MailData data = service.sendMailData(reqPage, m.getMemberNo());
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
//		System.out.println(data.getPageNavi());

		return "mail/sendList";
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
	public String insertMail(MailVO mail, int readType) {
		
		int result = service.insertMail(mail);
		
		if (result > 0) {
			System.out.println("쪽지 전송");
		} else {
			System.out.println("전송 실패");
		}
		
		if (readType == 0) {
			return "redirect:/healthner/mail/receiveList.do?reqPage=1";
		} else {
			return "redirect:/healthner/mail/sendList.do?reqPage=1";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/readMail.do", produces = "application/json; charset=utf-8")
	public String readMail(int mailNo, int readType) {
		
		//readType = 0 : 수신자가 쪽지를 읽는 상황, readType = 1 : 송신자가 쪽지를 읽는 상황
		MailVO mail = service.readMail(mailNo, readType);
		
		return new Gson().toJson(mail);
	}
	
	@RequestMapping("/deleteMail.do")
	public String deleteMail(int deleteNo[], int readType) {
		
		int result = service.deleteMail(deleteNo);
		
		if (result > 0) {
			
		} else {
			
		}
		
		if (readType == 0) {
			return "redirect:/healthner/mail/receiveList.do?reqPage=1";
		} else {
			return "redirect:/healthner/mail/sendList.do?reqPage=1";
		}
	}
}
