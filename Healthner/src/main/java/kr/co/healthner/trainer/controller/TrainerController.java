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
	@Qualifier("trainerSerivce")
	private TrainerServiceImpl service;
	
	@RequestMapping("/trainerIntroFrm.do")
	public String trainerIntroFrm() {
		return "trainer/trainerIntroFrm";
	}
}
