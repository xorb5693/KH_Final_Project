package kr.co.healthner.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.healthner.common.CardHandler;
import kr.co.healthner.member.model.service.MemberServiceImpl;
import kr.co.healthner.member.model.vo.AttendanceData;

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
}
