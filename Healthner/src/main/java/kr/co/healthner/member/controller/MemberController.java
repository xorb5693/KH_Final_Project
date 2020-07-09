package kr.co.healthner.member.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

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
			Member m = service.selectArduino(cardNo);
			if (m == null) {
				cardHandler.cardResponse(cardNo);
			} else {
				cardHandler.cardOverlap(cardNo, m.getMemberId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "$" + cardNo;
	}
	
	@ResponseBody
	@RequestMapping(value="/login.do", produces = "html/text;charset=utf-8")
	public String selectMember(Member m, HttpSession session) {
		Member member = new Member();
		member = service.selectMember(m);
		if(member != null) {
			if(member.getEmailVerification()==1) {
				session.setAttribute("member", member);
				return "success";				
			}else {
				return "mail";
			}
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/join.do")
	public String insertMember(Member m,HttpServletRequest request,Model model, MultipartFile file) {
		// send mail
		long timeout = System.currentTimeMillis()/1000;
		
		mailService.sendMail(m,request,timeout);
		model.addAttribute("memberId", m.getMemberId());
		
		
		// upload profile Image
		String savePath = request.getSession().getServletContext().getRealPath("/resources/profile/"); // 저장 경로
		// 업로드한 파일의 실제 파일명
		String originalFilename = file.getOriginalFilename(); 
		// 확장자를 제되한 파일명
		String onlyFilename = originalFilename.substring(0,originalFilename.lastIndexOf("."));
		// 확장자 -> txt
		String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
		String filepath = onlyFilename+"_"+System.currentTimeMillis()+extension;
		String fullpath = savePath + filepath;
		if(!file.isEmpty()) {
			try {
				byte [] bytes = file.getBytes();
				BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
				bos.write(bytes);
				bos.close();
				System.out.println("파일 업로드 완료");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		m.setMemberProfile(filepath);
		
		
		
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
		request.setAttribute("eatMemberNo", memberNo);
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
	public String insertMenuComment(HttpServletRequest request, MenuCommentVO comment, int memberNo) {
		
		HttpSession session = request.getSession();
		comment.setWriterNo(((Member)session.getAttribute("member")).getMemberNo());
		int result = service.insertMenuComment(comment);
		
		return "redirect:/healthner/member/myEat.do?memberNo=" + memberNo + "&reqPage=1";
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
	
	@ResponseBody
	@RequestMapping("/inserCard.do")
	public String insertCard(String memberId, String card) {
		
		int result = service.insertCard(memberId, card);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping("/deleteCard.do")
	public String deleteCard(String memberId) {
		
		int result = service.deleteCard(memberId);
		
		return String.valueOf(result);
	}

	@RequestMapping("/verifyMail.do")
	public String verifyMail(String memberId,String email,long timeout,Model model) {
		long endtime = System.currentTimeMillis()/1000;
		if(endtime-timeout<24*60*60) {
			int result = service.verifyMail(memberId);			
			if(result>0) {
				return "member/verifyDone";
			}else {
				return "member/verifyFail";
			}
		}else {
			model.addAttribute("memberId", memberId);
			model.addAttribute("email", email);
			return "member/timeout";
		}
	}
	
	@RequestMapping("/retrieveFrm.do")
	public String recoverFrm() {
		return "member/retrieveFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/retrieveId.do", produces="application/json; charset=utf-8")
	public String retrieveId(String memberName, String email) {
		Member m = new Member();
		m.setEmail(email);
		m.setMemberName(memberName);
		Member member = service.retrieveId(m);
		return new Gson().toJson(member);
		
	}
	
	@ResponseBody
	@RequestMapping(value="/retrievePw.do", produces="application/json; charset=utf-8")
	public String retrievePw(String memberId, String email, HttpServletRequest request) {
		Member m = new Member();
		m.setEmail(email);
		m.setMemberId(memberId);
		System.out.println(m.getEmail());
		System.out.println(m.getMemberId());
		Member member = service.retrievePw(m);
		if(member != null) {
			long timeout = System.currentTimeMillis()/1000;
			mailService.resetPw(member,timeout, request);
		}
		return new Gson().toJson(member); 
	}
	
	@RequestMapping("/resetPwFrm.do")
	public String resetPwFrm(Member m, long timeout, Model model) {
		long endTimeout = System.currentTimeMillis()/1000;
		model.addAttribute("memberId",m.getMemberId());
		System.out.println(endTimeout-timeout);
		if(endTimeout-timeout>60*30) {
			// Timedout
			model.addAttribute("resetPw", "reset");
			model.addAttribute("memberId", m.getMemberId());
			model.addAttribute("email", m.getEmail());
			return "member/timeout";
		}else {
			return "member/resetPwFrm";
		}
	}
	
	@RequestMapping("/resetPw.do")
	public String resetPw(Member m,Model model) {
		int result = service.resetPwMember(m);
		return "redirect:/";
	}
	
	@RequestMapping("/resend.do")
	public String resend(String email, String memberId, String type,HttpServletRequest request) {
		Member m = new Member();
		m.setMemberId(memberId);
		Member member = service.selectMember(m);
		long timeout = System.currentTimeMillis()/1000;
		if(type.equals("email")) {
			mailService.sendMail(member,request,timeout);
		}else {
			mailService.resetPw(member,timeout,request);
		}
		return "redirect:/";
	}
	
	@RequestMapping("/about.do")
	public String aboutFrm() {
		return "member/about";
	}
	
	@RequestMapping("/pricing.do")
	public String pricing() {
		return "member/pricing";
	}
	
	@RequestMapping("/payment.do")
	public String paymentFrm(int amount,Model model) {
		model.addAttribute("amount", amount);
		return "member/paymentFrm";
	}
	
	@ResponseBody
	@RequestMapping(value="/quit.do", produces = "html/text; charset=utf-8")
	public String quit(HttpSession session) {
		Member m = (Member)session.getAttribute("member");
		int result = service.quit(m);
		if(result>0) {
			session.invalidate();
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/checkPw.do", produces = "html/text; charset=utf-8")
	public String checkPwMember(Member m) {
		Member member = new Member();
		member = service.checkPwMember(m);
		if(member!=null) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping("/changePw.do")
	public String changePwMember(Member m,Model model) {
		int result = service.changePwMember(m);
		if(result>0) {
			model.addAttribute("msg", "success");
		}else {
			model.addAttribute("msg", "fail");
		}
		return "member/mypage";
	}
	
	
}
