package kr.co.healthner.trainer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.trainer.model.service.TrainerServiceImpl;

@Controller
@RequestMapping("/healthner/trainer")
public class TrainerController {
	@Autowired
	@Qualifier("trainerService")
	private TrainerServiceImpl service;
	
	@RequestMapping("/trainerIntro.do")
	public String trainerIntro() {
		return "trainer/trainerIntro";
	}
	
	@RequestMapping("/trainerInputFrm.do")
	public String trainerInputFrm() {
		return "trainer/trainerInputFrm";
	}
	
	@RequestMapping("/customerList.do")
	public String customerList() {
		return "trainer/customerList";
	}
}
