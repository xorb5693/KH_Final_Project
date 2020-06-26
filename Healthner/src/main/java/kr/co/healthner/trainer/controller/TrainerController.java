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
import kr.co.healthner.trainer.model.service.TrainerServiceImpl;
import kr.co.healthner.trainer.model.vo.BmiVO;
import kr.co.healthner.trainer.model.vo.MemberMappingInfoVO;
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
		return "trainer/trainer";
	}
	
	//회원 리스트 가져오기
	@RequestMapping("/customerList.do")
	public String customerList(Model model, HttpSession session) {
		//트레이너번호를 가져오기위한 세션
		Member member = new Member();
		member = (Member)session.getAttribute("member");		
		int trainerNo = member.getMemberNo();
		
		//트레이너번호로 매칭된 회원 정보 가져오기
		List<MemberMappingInfoVO> list = service.selectMapperInfo(trainerNo);
		System.out.println("회원 정보 : " + list);
		model.addAttribute("list", list);
		return "trainer/customerList";
	}
	
	@RequestMapping("/customerInfo.do")
	public String customerInfo() {
		return "trainer/customerInfo";
	}
	
	//인바디목록으로 보내기
	@RequestMapping("/inbodyList.do")
	public String inbodyList() {
		return "trainer/inbodyList";
	}
	
	//인바디 글쓰기
	@RequestMapping("/inbodyInputFrm.do")
	public String inbodyInputFrm(BmiVO bmi) {
		int result = service.insertBmi(bmi);
		if(result > 0) {
			System.out.println("수정 성공");
		} else {
			System.out.println("수정 실패");
		}
		return "trainer/inbodyInputFrm";
	}
	
	//트레이너intro를 위한 모든 트레이너 정보 가져오기
	@RequestMapping("/trainer.do")
	public String trainers(Model model) {
		List<TrainerVO> list = service.selectAllTrainers();
		model.addAttribute("list", list);
		return "trainer/trainer";
	}
	
}
