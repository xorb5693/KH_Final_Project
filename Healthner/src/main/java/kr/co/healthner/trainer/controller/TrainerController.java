package kr.co.healthner.trainer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.trainer.model.service.TrainerServiceImpl;
import kr.co.healthner.trainer.model.vo.BmiData;
import kr.co.healthner.trainer.model.vo.BmiVO;
import kr.co.healthner.trainer.model.vo.CustomerData;
import kr.co.healthner.trainer.model.vo.TrainerVO;

@Controller
@SessionAttributes("id")
@RequestMapping("/healthner/trainer")
public class TrainerController {
	@Autowired
	@Qualifier("trainerService")
	private TrainerServiceImpl service;
	
	//트레이너 인풋창을 위한 한명 불러오기
	@RequestMapping("/trainerInputFrm.do")
	public String trainerInputFrm(Model model, HttpSession session) {
		//화면에 정보 띄우기
		Member member = new Member();
		member = (Member)session.getAttribute("member");
		String id = member.getMemberId();
		System.out.println("세션아이디 : "+id);
		TrainerVO list = service.selectOneTrainer(id);		
		System.out.println(list);
		model.addAttribute("list", list);
		return "trainer/trainerInputFrm";
	}
	
	//트레이너 수정
	@RequestMapping(value="/trainerInput.do")
	public String trainerInputFrm(HttpServletRequest request, TrainerVO tUpdate) {
		int result = service.updateTrainerInfo(tUpdate);
		if(result > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		return "redirect:/healthner/trainer/trainer.do";
	}
	
	//회원 리스트 가져오기
	@RequestMapping("/customerList.do")
	public String customerList(HttpSession session, HttpServletRequest request) {
		int reqPage = 0;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (Exception e) {
			reqPage = 1;
		}
		//트레이너번호를 가져오기위한 세션
		Member member = new Member();
		member = (Member)session.getAttribute("member");
		int trainerNo = member.getMemberNo();
		
		CustomerData data = service.selectMapperInfo(trainerNo, reqPage);
		
		request.setAttribute("list", data.getList());
		request.setAttribute("pageNavi", data.getPageNavi());
		//트레이너번호로 매칭된 회원 정보 가져오기
		System.out.println("회원 정보 : " + data.getList());
		return "trainer/customerList";
	}
	
	//트레이너가 회원 PT 카운트 증가감소 시키기
	@RequestMapping(value="/customerCntUpdate.do")
	public String customerCntUpdate(int mappingSeq, String check) {
//		int trainingCnt = mmv.getTrainingCnt();
//		int memberNo = mmv.getMemberNo();
//		System.out.println("트레이너 카운트 : " + trainingCnt);
//		System.out.println("회원 번호 : " + memberNo);
		int result = service.customerCntUpdate(mappingSeq, check);
		if(result > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}	
		return "redirect:/healthner/trainer/customerList.do";
	}
	
	//해당 회원 정보로 이동
	@RequestMapping("/customerInfo.do")
	public String customerInfo(Model model, int memberNo) {
		Member member = new Member();
		member = service.selectOneMember(memberNo);
		System.out.println(member);
		model.addAttribute("member", member);
		System.out.println("회원번호 " + memberNo + "의 customerInfo 페이지");
		return "trainer/customerInfo";
		 
	}
	
	//인바디목록으로 보내기
	@RequestMapping("/inbodyList.do")
	public String inbodyList(Model model, int memberNo, HttpServletRequest request) {
		int reqPage = 0;
		try {
			reqPage = Integer.parseInt(request.getParameter("reqPage"));
		} catch (Exception e) {
			reqPage = 1;
		}
		BmiData data = service.selectOneMemberBmi(memberNo, reqPage);
		model.addAttribute("memberNo", memberNo);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		System.out.println("회원번호 " + memberNo + "의 inbodyList 페이지");
		System.out.println("회원번호" + memberNo + "의 정보 입니다." + data);
		return "trainer/inbodyList";
	}
	
	//인바디 글쓰기
	@RequestMapping("/inbodyInputFrm.do")
	public String inbodyInputFrm(Model model, int memberNo) {
		Member member = new Member();
		member = service.selectOneMember(memberNo);
		System.out.println(member);
		model.addAttribute("member", member);
		return "trainer/inbodyInputFrm";
	}
	
	@RequestMapping("/insertInbody.do")
	public String insertInbody(BmiVO bmi) {
		int memberNo = bmi.getMemberNo();
		int result = service.insertInbody(bmi);
		if(result > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		return "redirect:/healthner/trainer/inbodyList.do?memberNo=" + memberNo;
	}
	
	//트레이너intro를 위한 모든 트레이너 정보 가져오기
	@RequestMapping("/trainer.do")
	public String trainers(Model model) {
		List<TrainerVO> list = service.selectAllTrainers();
		System.out.println(list);
		model.addAttribute("list", list);
		return "trainer/trainer";
	}
	
	@RequestMapping("/customerGraph.do")
	public String customerGraph(Model model, int memberNo) {
		BmiVO prevBmi = service.selectPrevBmi(memberNo);
		BmiVO recentBmi = service.selectBmi(memberNo);
		System.out.println(prevBmi);
		System.out.println(recentBmi);
		model.addAttribute("prevBmi", prevBmi);
		model.addAttribute("recentBmi", recentBmi);
		return "trainer/customerGraph";
	}
	
	@RequestMapping(value="/inbodyGraph.do")
	public String inbodyGraph(Model model, BmiVO bmi) {
		BmiVO recentBmi = service.selectOneGraph(bmi);
		System.out.println("그래프에 들어갈 내용 : " + recentBmi);
		model.addAttribute("recentBmi", recentBmi);
		return "trainer/inbodyGraph";
	}
}
