package kr.co.healthner.admincontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.admin.model.service.AdminServiceImpl;

@Controller
@RequestMapping("/healthner/admin")
public class AdminController {
	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl service;
	
	@RequestMapping("/adminMain.do")
	public String trainerIntro() {
		return "admin/adminMain";
	}
	
}
