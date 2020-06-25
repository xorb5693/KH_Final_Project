package kr.co.healthner.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.healthner.common.CardHandler;
import kr.co.healthner.member.model.service.MemberServiceImpl;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.AttendancePrintData;
import kr.co.healthner.member.model.vo.EatLogVO;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.NutritionTableVO;

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
		Member member = service.checkId(m);
		if(member!=null) {
			return "1";
		}else {
			return "0";
		}
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
	
	@RequestMapping("/attendanceRead.do")
	public String attendanceRead(HttpSession session, Model model) {
		
		Member member = (Member)session.getAttribute("member");
		AttendancePrintData data = service.attendanceRead(member.getMemberNo());
		
//		System.out.println(data.getLastAttd());
//		System.out.println(data.getLastTime());
		System.out.println(data.getLabels());
		System.out.println(data.getAvgData());
		System.out.println(data.getMyData());
		model.addAttribute("data", data);
		
		return "member/attendanceRead";
	}
	
	@RequestMapping("/myEat.do")
	public String myEat(HttpSession session, Model model) {
		
		return "member/myEat";
	}
	
	@ResponseBody
	@RequestMapping(value = "/menuList.do", produces = "application/json; charset=utf-8")
	public String menuList(String keyword) {
//		NutritionTableVO menu
		ArrayList<NutritionTableVO> list = service.selectMenuList(keyword);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/eatLogInsert.do")
	public String eatLogInsert(EatLogVO eat) {
		
		service.insertEatLog(eat);
		return "redirect:/healthner/member/myEat.do"; 
	}
}
