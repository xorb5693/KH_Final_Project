package kr.co.healthner.member.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.healthner.common.CardHandler;
import kr.co.healthner.member.model.service.MemberMailServiceImpl;
import kr.co.healthner.member.model.service.MemberServiceImpl;
import kr.co.healthner.member.model.vo.AttendanceData;
import kr.co.healthner.member.model.vo.AttendancePrintData;
import kr.co.healthner.member.model.vo.EatLogData;
import kr.co.healthner.member.model.vo.EatLogVO;
import kr.co.healthner.member.model.vo.MappingTrainerData;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.member.model.vo.MenuCommentVO;
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
	
	@Autowired
	@Qualifier("memberMail")
	private MemberMailServiceImpl mailService;
	
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
	public String insertMember(Member m,HttpServletRequest request) {
		// send mail
		mailService.sendMail(m,request);
		
		// upload profile Image
		
		// insert Member
		int result = service.insertMember(m);
		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectId.do", produces = "html/text;charset=utf-8")
	public String checkId(Member m) {
		Member member = service.checkId(m);
		if(member!=null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/checkNick.do", produces = "html/text;charset=utf-8")
	public String checkNick(Member m) {
		System.out.println(m.getMemberNick());
		Member member = service.checkNick(m);
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
	public String attendanceRead(HttpServletRequest request) {

		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		AttendancePrintData data = service.attendanceRead(memberNo);
		
//		System.out.println(data.getLabels());
//		System.out.println(data.getAvgData());
//		System.out.println(data.getMyData());
		request.setAttribute("data", data);
		
		return "member/attendanceRead";
	}
	
	@RequestMapping("/myEat.do")
	public String myEat(HttpServletRequest request) {
		
		int reqPage = 0;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (Exception e) {
			reqPage = 1;
		}
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		EatLogData data = service.selectEatLogList(memberNo, reqPage);
		request.setAttribute("list", data.getList());
		request.setAttribute("pageNavi", data.getPageNavi());
		request.setAttribute("memberName", data.getMemberName());
//		System.out.println(data.getPageNavi());
		return "member/myEat";
	}
	
	@ResponseBody
	@RequestMapping(value = "/menuList.do", produces = "application/json; charset=utf-8")
	public String menuList(String keyword) {
		
		ArrayList<NutritionTableVO> list = service.selectMenuList(keyword);
		return new Gson().toJson(list);
	}
	
	@RequestMapping("/eatLogInsert.do")
	public String eatLogInsert(EatLogVO eat) {
		
		service.insertEatLog(eat);
		return "redirect:/healthner/member/myEat.do?memberNo=" + eat.getMemberNo() + "&reqPage=1"; 
	}
	
	@RequestMapping("/insertMenuComment.do")
	public String insertMenuComment(HttpServletRequest request, MenuCommentVO comment) {
		
		HttpSession session = request.getSession();
		comment.setWriterNo(((Member)session.getAttribute("member")).getMemberNo());
		int result = service.insertMenuComment(comment);
		
		return "redirect:/healthner/member/myEat.do?memberNo=" + comment.getWriterNo() + "&reqPage=1";
	}
	
	@ResponseBody
	@RequestMapping(value="/commentList.do", produces = "application/json; charset=utf-8")
	public String menuCommentList(int menuNo) {
		
		ArrayList<MenuCommentVO> list = service.menuCommentList(menuNo);
		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping("/commentDelete.do")
	public String menuCommentDelete(int cmtNo) {
		
		int result = service.deleteMenuComment(cmtNo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("/commentModify.do")
	public String menuCommentModify(MenuCommentVO comment) {
		
		int result = service.modifyMenuComment(comment);
		return String.valueOf(result);
	}

	@RequestMapping("/myTrainer.do")
	public String myTrainer(HttpSession session, Model model) {

		Member member = (Member)session.getAttribute("member");
		ArrayList<MappingTrainerData> list = service.myTrainer(member.getMemberNo());
		model.addAttribute("list", list);
		return "member/myTrainer";
	}

	@RequestMapping("/insertPostscript.do")
	public String insertPostscript(MemberMappingVO mapping) {

		service.insertPostscript(mapping);		
		return "redirect:/healthner/member/myTrainer.do";
	}
	
	@RequestMapping("/verifyMail.do")
	public String verifyMail(String memberId) {
		int result = service.verifyMail(memberId);
		return null;
	}
	
}
