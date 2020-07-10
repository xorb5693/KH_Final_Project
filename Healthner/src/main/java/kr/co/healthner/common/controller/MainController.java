package kr.co.healthner.common.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.trainer.model.service.TrainerServiceImpl;
import kr.co.healthner.vo.TrainerCommentVO;

@Controller
public class MainController {
	@Autowired
	@Qualifier("trainerService")
	private TrainerServiceImpl serviceTrainer;
	
	@RequestMapping("/main.do")
	public String main(Model model) {
		ArrayList<TrainerCommentVO> arr = serviceTrainer.trainerComment();
		System.out.println(arr.size());
		System.out.println(arr.get(0).getMemberNick());
		model.addAttribute("trainerComment", arr);
		return"common/realIndex";
	}
	
}
