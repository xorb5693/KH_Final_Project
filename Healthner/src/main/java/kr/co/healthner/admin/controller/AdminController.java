package kr.co.healthner.admin.controller;

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

import com.google.gson.Gson;

import kr.co.healthner.admin.model.service.AdminServiceImpl;
import kr.co.healthner.admin.model.vo.PTmapping;
import kr.co.healthner.admin.model.vo.TotalpageList;
import kr.co.healthner.mail.model.vo.MailData;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.vo.ProductVO;

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
	public String mail(HttpSession session, Model model, int reqPage) {
		
		Member m = (Member)session.getAttribute("member");
		
		MailData data = service.receiveMailData(reqPage, m.getMemberNo());
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		
		return "admin/mail";
	}

	// 혜진_200624_관리자 페이지에서 8번 예약 문의 관리 페이지로 이동
	@RequestMapping("/inquiryMgt.do")
	public String inquiryMgt() {
		return "admin/inquiryMgt";
	}

	// 혜진_200626_관리자 페이지_회원관리 메뉴_카드 웹소켓용 팝업 이동
	@RequestMapping("/addCard.do")
	public String memberList(String memberId, Model model) {
		model.addAttribute("memberId", memberId);
		return "admin/memberDetail";
	}

//---------------------------------------------------------------------------------------- (상단)이동/(하단)function

	// 혜진_200624_관리자 페이지_회원관리 메뉴_검색 조건에 따라 회원 조회
	// 혜진_200625_VO추가하여 mapper에 전달할 값 정리
	// 혜진_200629_더보기 기능을 위해 vo 객체 추가, start 전달
	@RequestMapping(value="/memberList.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String memberList(String searchWord, int checkbox1, int checkbox2, int start) {
		TotalpageList tl = service.memberList(searchWord, checkbox1, checkbox2, start);
		return new Gson().toJson(tl);
	}
	
	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	@RequestMapping("/oneMemberSearch.do")
	@ResponseBody
	public Member oneMemberSearch(String memberId) {
		Member m = service.oneMemberSearch(memberId);
		return m;
	}
	
	// 혜진_200630_회원관리 페이지_팝업창_카드 정보 수정 반영
	@RequestMapping("/cardModify.do")
	@ResponseBody
	public String cardModify(String memberId, String card) {
		service.cardModify(memberId, card);
		return card;
	}
	
	// 혜진_200630_트레이너 페이지_전체 리스트 조회
	@RequestMapping(value="/trainerlist.do", produces="application/json; charset=utf-8")
	@ResponseBody
	public String trainerList(String searchWord, int memberType, int start) {
		TotalpageList tl = service.trainerList(searchWord, memberType, start);
		return new Gson().toJson(tl);
	}
	
	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 멤버 타입 변환
	@RequestMapping(value="/approveTrainer.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String approveTrainer(String memberId) {
		int result = service.approveTrainer(memberId);
		System.out.println("result"+result);
		System.out.println("memberId"+memberId);
		if(result>0) {
			return "승인되었습니다";
		}else {
			return "실패하였습니다";
		}
	}
	
	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 회원 삭제
	@RequestMapping(value="/rejectTrainer.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String rejectTrainer(String memberId) {
		int result = service.rejectTrainer(memberId);
		System.out.println("result"+result);
		System.out.println("memberId"+memberId);
		if(result>0) {
		return "삭제하였습니다";
		}else {
			return "실패하였습니다";
		}
	}
	
	// 혜진_200703_PT Mapping 페이지_조회
	@RequestMapping(value="/ptTrainerList.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String ptTrainerList(String searchWord, int memberType, int start, int checkbox1) {
		TotalpageList tl = service.ptMapping(searchWord, memberType, start, checkbox1);
		return new Gson().toJson(tl);
	}
	
	// 태규_200703_쪽지 관련 페이지 메소드들
	@RequestMapping("/sendMail.do")
	public String sendMail(HttpSession session, Model model, int reqPage) {
		
		Member m = (Member)session.getAttribute("member");
		
		MailData data = service.sendMailData(reqPage, m.getMemberNo());
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
//		System.out.println(data.getPageNavi());

		return "admin/sendMail";
	}
	
	// 태규_200703_쪽지 관련 페이지 메소드들
	@RequestMapping("/adminInsertMail.do")
	public String insertMail(MailVO mail, int readType) {
		
		int result = service.insertMail(mail);
		
		if (result > 0) {
			System.out.println("쪽지 전송");
		} else {
			System.out.println("전송 실패");
		}
		
		if (readType == 0) {
			return "redirect:/mail.do?reqPage=1";
		} else {
			return "redirect:/sendMail.do?reqPage=1";
		}
	}
	
	// 태규_200703_쪽지 관련 페이지 메소드들
	@RequestMapping("/adminDeleteMail.do")
	public String deleteMail(int deleteNo[], int readType) {
		
		int result = service.deleteMail(deleteNo);
		
		if (result > 0) {
			
		} else {
			
		}
		
		if (readType == 0) {
			return "redirect:/mail.do?reqPage=1";
		} else {
			return "redirect:/sendMail.do?reqPage=1";
		}
	}
	
	//태규_200708_물품 등록 페이지 이동
	@RequestMapping("/productInsertFrm.do")
	public String productInsertFrm() {
		
		return "admin/productInsertFrm";
	}
	
	//태규_200708_물품 등록
	@RequestMapping("/productInsert.do")
	public String productInsert(HttpServletRequest request, ProductVO product, MultipartFile file) {
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/thumbnail/");
		
		//업로드할 파일 오리지널 이름
		String originFileName = file.getOriginalFilename();
		
		//업로드할 파일 이름과 확장자를 나눠 두 문자열 사이 중복을 제거할 구분자 입력
		String thumbnail = originFileName.substring(0, originFileName.lastIndexOf(".")) + "_" + System.currentTimeMillis() 
							+ originFileName.substring(originFileName.lastIndexOf("."));
		
		//실제 파일이 저장될 경로와 파일명
		String fullpath = savePath + thumbnail;
		
		//파일 저장
		try {
			product.setThumbnail(thumbnail);
			byte[] bytes = file.getBytes();
			
			BufferedOutputStream bos = new BufferedOutputStream(new FileOutputStream(new File(fullpath)));
			bos.write(bytes);
			bos.close();
			
			System.out.println("파일전송 완료");
			
		} catch (IOException e) {
			
			e.printStackTrace();
		} 
		
		int result = service.productInsert(product);
		
		if (result > 0) {
			System.out.println("물품 등록");
		} else {
			System.out.println("물품 등록 실패");
		}
		
		return "redirect:/productMgt.do";
    }
    
	// 혜진_200706_mapping데이터 삭제
	@RequestMapping("/mappingDelete.do")
	@ResponseBody
	public int mappingDelete(int mpSeq) {
		int result = service.mappingDelete(mpSeq);
		return result;
	}
	
	//혜진_200706_mapping신규 등록_회원 찾기
	@RequestMapping(value="/mappingDetail.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String mappingFind(String searchWord, int memberType) {
		TotalpageList tl = service.mappingFind(searchWord, memberType);
		return new Gson().toJson(tl);
	}
	
	//혜진_200707_mapping신규등록_신규 mapping 등록
	@RequestMapping("/inputNewMapping.do")
	@ResponseBody
	public int inputNewMapping(int PTmax, int PTleft, int memberNo, int trainerNo) {
		int result = service.inputNewMapping(PTmax,PTleft,memberNo,trainerNo);
		return result;
	}
	
	//혜진_200707_mapping 데이터 수정
	@RequestMapping("/mappingCheck.do")
	@ResponseBody
	public PTmapping mappingCheck(int mpSeq) {
		PTmapping ptm = service.mappingCheck(mpSeq);
		return ptm;
	}
}
