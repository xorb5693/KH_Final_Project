package kr.co.healthner.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.member.model.service.MemberServiceImpl;
import kr.co.healthner.member.model.vo.Member;

@Controller
@RequestMapping("/healthner/member")
public class MemberController {
	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl service;
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping("/registerFrm.do")
	public String registerFrm() {
		return "member/registerFrm";
	}
	
	@RequestMapping("/login.do")
	public String selectMember(Member m, HttpSession session) {
		Member member = new Member();
		member = service.selectMember(m);
		if(member != null) {
			session.setAttribute("member", member);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/join.do")
	public String insertMember(Member m) {
		int result = service.insertMember(m);
		return "redirect:/";
	}
	
	@RequestMapping("/selectId.do")
	public int checkId(Member m) {
		int result = service.checkId(m);
		return result;
	}
	
	
	
}
