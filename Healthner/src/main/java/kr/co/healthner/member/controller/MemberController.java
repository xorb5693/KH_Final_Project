package kr.co.healthner.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.healthner.common.CardHandler;
import kr.co.healthner.member.model.service.MemberServiceImpl;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.Member;

@Controller
@RequestMapping("/healthner/member")
public class MemberController {
	@Autowired
	@Qualifier("memberService")
	private MemberServiceImpl service;
	
	@Autowired
	@Qualifier("cardHandler")
	private CardHandler cardHandler;
	
	@RequestMapping("/loginFrm.do")
	public String loginFrm() {
		return "member/loginFrm";
	}
	
	@RequestMapping("/registerFrm.do")
	public String registerFrm() {
		return "member/registerFrm";
	}

	@ResponseBody
	@RequestMapping("/arduinoInsert.do")
	public String arduinoInsert(String card) {
		card.replace(" ", "");
		String cardNo = card.replaceAll(" ", ".").substring(1);
		System.out.println("Insert : " + cardNo);
		try {
			cardHandler.cardResponse(cardNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "$" + cardNo;
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
	public String checkId(Member m) {
		String result = service.checkId(m);
		return result;
	}
		
	@ResponseBody
	@RequestMapping("/arduinoAttendance.do")
	public String arduinoAttendance(String card) {
		card.replace(" ", "");
		String cardNo = card.replaceAll(" ", ".").substring(1);
		System.out.println("Attendance : " + cardNo);
		AttendanceData data = service.aduinoAttendance(cardNo);
		
		if (data == null) {
			return "$Find Not User";
		} else if (data.getResult() > 0) {
			return "$" + data.getMember().getMemberId();
		} else {
			return "$not found";
		}
	}
	
	@RequestMapping("/mypageFrm.do")
	public String myPage() {
		return "member/mypage";
	}
}
