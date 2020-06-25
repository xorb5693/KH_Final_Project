package kr.co.healthner.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.healthner.admin.model.service.AdminServiceImpl;
import kr.co.healthner.member.model.vo.Member;

@Controller
//@RequestMapping("/healthner/admin")
public class AdminController {
	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl service;
	
	// 혜진_200622_관리자 메인 페이지로 이동(홈에서 이동)
	@RequestMapping("/adminMain.do")
	public String trainerIntro() {
		return "admin/adminMain";
	}

	// 혜진_200623_관리자 페이지에서 1번 회원 관리 페이지로 이동_회원 정보 조회/카드 정보 관리 페이지
	@RequestMapping("/memberMgt.do")
	public String memberMgt() {
		return "admin/memberMgt";
	}

	// 혜진_200624_관리자 페이지에서 2번 트레이너 관리페이지로 이동
	@RequestMapping("/trainerMgt.do")
	public String trainerMgt() {
		return "admin/trainerMgt";
	}

	// 혜진_200624_관리자 페이지에서 3번 PT관리 페이지로 이동
	@RequestMapping("/ptMapping.do")
	public String ptMapping() {
		return "admin/ptMapping";
	}

	// 혜진_200624_관리자 페이지에서 4번 신고관리 페이지로 이동
	@RequestMapping("/reportMgt.do")
	public String reportMgt() {
		return "admin/reportMgt";
	}

	// 혜진_200624_관리자 페이지에서 5번 회원 자격 정지 페이지로 이동
	@RequestMapping("/penaltyMgt.do")
	public String penaltyMgt() {
		return "admin/penaltyMgt";
	}

	// 혜진_200624_관리자 페이지에서 6번 상품관리 페이지로 이동
	@RequestMapping("/productMgt.do")
	public String productMgt() {
		return "admin/productMgt";
	}

	// 혜진_200624_관리자 페이지에서 7번 쪽지함 페이지로 이동
	@RequestMapping("/mail.do")
	public String mail() {
		return "admin/mail";
	}

	// 혜진_200624_관리자 페이지에서 8번 예약 문의 관리 페이지로 이동
	@RequestMapping("/inquiryMgt.do")
	public String inquiryMgt() {
		return "admin/inquiryMgt";
	}

	// 혜진_200624_관리자 페이지_회원관리 메뉴_검색 조건에 따라 회원 조회
	@RequestMapping("/memberList.do")
	@ResponseBody
	public String memberList(String searchWord, String checkbox1, String checkbox2 ) {
		ArrayList<Member> list = new ArrayList<Member>();
		list = service.memberList(searchWord, checkbox1, checkbox2);
		return list;
	}
}
