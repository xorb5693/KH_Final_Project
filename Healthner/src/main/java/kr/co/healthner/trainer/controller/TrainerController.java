package kr.co.healthner.trainer.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.trainer.model.service.TrainerServiceImpl;

@Controller
@RequestMapping("/healthner/trainer")
public class TrainerController {
	@Autowired
	@Qualifier("trainerService")
	private TrainerServiceImpl service;
	
	@RequestMapping("/trainer.do")
	public String trainer() {
		return "trainer/trainer";
	}
	
	@RequestMapping("/trainerInputFrm.do")
	public String trainerInputFrm() {
		return "trainer/trainerInputFrm";
	}
	
	@RequestMapping("/customerList.do")
	public String customerList() {
		return "trainer/customerList";
	}
	
	@RequestMapping("/customerInfo.do")
	public String customerInfo() {
		return "trainer/customerInfo";
	}
	
//	@RequestMapping("/trainer.do")
//	public String trainerIntro(Model model) {
//		List<Member> list = service.selectAllTrainers();
//		model.addAttribute("list", list);
//		return "trainer/trainerIntro";
//	}
	
}
