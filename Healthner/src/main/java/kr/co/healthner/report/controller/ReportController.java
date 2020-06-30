package kr.co.healthner.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.report.model.service.ReportService;
import kr.co.healthner.vo.ReportVO;

@Controller
public class ReportController {
	
	@Autowired
	@Qualifier("reportService")
	private ReportService service;
	
	@RequestMapping(value="/insertReport.do")
	public String insertReport(ReportVO rv) {
		int result = service.insertReport(rv);
		int boardNo = rv.getWriteNo();
		if(result>0) {
			System.out.println("report등록 성공");
		}else {
			System.out.println("report등록 실패");
		}
		
		return "redirect:/boardView.do?boardNo="+boardNo;
	}

}
