package kr.co.healthner.admin.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import kr.co.healthner.admin.model.service.AdminServiceImpl;
import kr.co.healthner.admin.model.vo.MeetingSchedule;
import kr.co.healthner.admin.model.vo.PTmapping;
import kr.co.healthner.admin.model.vo.Report;
import kr.co.healthner.admin.model.vo.TotalpageList;
import kr.co.healthner.mail.model.vo.MailData;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.shop.model.vo.PurchaseData;
import kr.co.healthner.shop.model.vo.PurchasePageData;
import kr.co.healthner.shop.model.vo.ShopPageDate;
import kr.co.healthner.vo.ProductVO;
import kr.co.healthner.vo.PurchaseVO;

@Controller
@RequestMapping("/healthner/admin")
public class AdminController {
	@Autowired
	@Qualifier("adminService")
	private AdminServiceImpl service;

	// 혜진_200712_로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 혜진_200622_관리자 메인 페이지로 이동(홈에서 이동)
	@RequestMapping("/adminMain.do")
	public String trainerIntro(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/adminMain";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200623_관리자 페이지에서 1번 회원 관리 페이지로 이동_회원 정보 조회/카드 정보 관리 페이지
	@RequestMapping("/memberMgt.do")
	public String memberMgt(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/memberMgt";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200624_관리자 페이지에서 2번 트레이너 관리페이지로 이동
	@RequestMapping("/trainerMgt.do")
	public String trainerMgt(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/trainerMgt";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200624_관리자 페이지에서 3번 PT관리 페이지로 이동
	@RequestMapping("/ptMapping.do")
	public String ptMapping(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/ptMapping";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200624_관리자 페이지에서 4번 신고관리 페이지로 이동
	@RequestMapping("/reportMgt.do")
	public String reportMgt(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/reportMgt";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200624_관리자 페이지에서 5번 회원 자격 정지 페이지로 이동
	@RequestMapping("/penaltyMgt.do")
	public String penaltyMgt(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/penaltyMgt";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200624_관리자 페이지에서 6번 상품관리 페이지로 이동
	@RequestMapping("/productMgt.do")
	public String productMgt(Model model, int reqPage, HttpSession session) {
		ShopPageDate data = service.productData(reqPage);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/productMgt";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200624_관리자 페이지에서 7번 쪽지함 페이지로 이동
	@RequestMapping("/mail.do")
	public String mail(HttpSession session, Model model, int reqPage) {

		Member m = (Member) session.getAttribute("member");

		MailData data = service.receiveMailData(reqPage, m.getMemberNo());
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());

		return "admin/mail";
	}

	// 혜진_200624_관리자 페이지에서 8번 예약 문의 관리 페이지로 이동
	@RequestMapping("/inquiryMgt.do")
	public String inquiryMgt(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/inquiryMgt";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 혜진_200626_관리자 페이지_회원관리 메뉴_카드 웹소켓용 팝업 이동
	@RequestMapping("/addCard.do")
	public String memberList(String memberId, Model model, HttpSession session) {
		model.addAttribute("memberId", memberId);
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/memberDetail";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

//---------------------------------------------------------------------------------------- (상단)이동/(하단)function

	// 혜진_200624_관리자 페이지_회원관리 메뉴_검색 조건에 따라 회원 조회
	// 혜진_200625_VO추가하여 mapper에 전달할 값 정리
	// 혜진_200629_더보기 기능을 위해 vo 객체 추가, start 전달
	@RequestMapping(value = "/memberList.do", produces = "application/json; charset=utf-8")
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
	@RequestMapping(value = "/trainerlist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String trainerList(String searchWord, int memberType, int start) {
		TotalpageList tl = service.trainerList(searchWord, memberType, start);
		return new Gson().toJson(tl);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 멤버 타입 변환
	@RequestMapping(value = "/approveTrainer.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String approveTrainer(String memberId) {
		int result = service.approveTrainer(memberId);
		System.out.println("result" + result);
		System.out.println("memberId" + memberId);
		if (result > 0) {
			return "승인되었습니다";
		} else {
			return "실패하였습니다";
		}
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 회원 삭제
	@RequestMapping(value = "/rejectTrainer.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String rejectTrainer(String memberId) {
		int result = service.rejectTrainer(memberId);
		System.out.println("result" + result);
		System.out.println("memberId" + memberId);
		if (result > 0) {
			return "삭제하였습니다";
		} else {
			return "실패하였습니다";
		}
	}

	// 혜진_200703_PT Mapping 페이지_조회
	@RequestMapping(value = "/ptTrainerList.do", produces = "text/html;charset=utf-8")
	@ResponseBody
	public String ptTrainerList(String searchWord, int memberType, int start, int checkbox1) {
		TotalpageList tl = service.ptMapping(searchWord, memberType, start, checkbox1);
		return new Gson().toJson(tl);
	}

	// 태규_200703_쪽지 관련 페이지 메소드들
	@RequestMapping("/sendMail.do")
	public String sendMail(HttpSession session, Model model, int reqPage) {

		Member m = (Member) session.getAttribute("member");

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
			return "redirect:/healthner/admin/mail.do?reqPage=1";
		} else {
			return "redirect:/healthner/admin/sendMail.do?reqPage=1";
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
			return "redirect:/healthner/admin/mail.do?reqPage=1";
		} else {
			return "redirect:/healthner/admin/sendMail.do?reqPage=1";
		}
	}

	// 태규_200708_물품 등록 페이지 이동
	@RequestMapping("/productInsertFrm.do")
	public String productInsertFrm(HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		if (m != null) {
			if (m.getMemberId().equals("admin")) {
				return "admin/productInsertFrm";
			} else {
				return "admin/failNotice";
			}
		} else {
			return "admin/failNotice";
		}
	}

	// 태규_200708_물품 등록
	@RequestMapping("/productInsert.do")
	public String productInsert(HttpServletRequest request, ProductVO product, MultipartFile file) {

		String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/thumbnail/");

		// 업로드할 파일 오리지널 이름
		String originFileName = file.getOriginalFilename();

		// 업로드할 파일 이름과 확장자를 나눠 두 문자열 사이 중복을 제거할 구분자 입력
		String thumbnail = originFileName.substring(0, originFileName.lastIndexOf(".")) + "_"
				+ System.currentTimeMillis() + originFileName.substring(originFileName.lastIndexOf("."));

		// 실제 파일이 저장될 경로와 파일명
		String fullpath = savePath + thumbnail;

		// 파일 저장
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

		return "redirect:/healthner/admin/productMgt.do?reqPage=1";
	}

	// 혜진_200706_mapping데이터 삭제
	@RequestMapping("/mappingDelete.do")
	@ResponseBody
	public int mappingDelete(int mpSeq) {
		int result = service.mappingDelete(mpSeq);
		return result;
	}

	// 혜진_200706_mapping신규 등록_회원 찾기
	@RequestMapping(value = "/mappingDetail.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String mappingFind(String searchWord, int memberType) {
		TotalpageList tl = service.mappingFind(searchWord, memberType);
		return new Gson().toJson(tl);
	}

	// 혜진_200707_mapping신규등록_신규 mapping 등록
	@RequestMapping("/inputNewMapping.do")
	@ResponseBody
	public int inputNewMapping(int PTmax, int PTleft, int memberNo, int trainerNo) {
		int result = service.inputNewMapping(PTmax, PTleft, memberNo, trainerNo);
		return result;
	}

	// 혜진_200713_mapping업데이트
	@RequestMapping("/updateNewMapping.do")
	@ResponseBody
	public int updateNewMapping(int PTmax, int PTleft, int memberNo, int trainerNo, int mappingSeq) {
		int result = service.updateNewMapping(PTmax, PTleft, memberNo, trainerNo, mappingSeq);
		return result;
	}

	// 혜진_200707_mapping 데이터 수정
	@RequestMapping("/mappingCheck.do")
	@ResponseBody
	public PTmapping mappingCheck(int mpSeq) {
		PTmapping ptm = service.mappingCheck(mpSeq);
		return ptm;
	}

	// 혜진_200708_신고글 조회
	@RequestMapping(value = "/reportlist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reportlist(String searchWord, int writeType, int reportCat, int start) {
		TotalpageList tl = service.reportlist(searchWord, writeType, reportCat, start);
		return new Gson().toJson(tl);
	}

	// 태규_200707_제품 상세 정보 보기
	@RequestMapping("/productRead.do")
	public String productRead(Model model, int pno) {

		ProductVO product = service.productRead(pno);
		model.addAttribute("product", product);

		return "admin/productRead";
	}

	// 태규_200707_제품 수정 페이지 이동
	@RequestMapping("/productModifyFrm.do")
	public String productModifyFrm(Model model, int pno) {

		ProductVO product = service.productRead(pno);
		model.addAttribute("product", product);

		return "admin/productModify";
	}

	// 태규_200707_제품 수정
	@RequestMapping("/productModify.do")
	public String productModify(HttpServletRequest request, ProductVO product, MultipartFile file, String type) {

		if (type.equals("change")) {
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upload/thumbnail/");

			// 업로드할 파일 오리지널 이름
			String originFileName = file.getOriginalFilename();

			// 업로드할 파일 이름과 확장자를 나눠 두 문자열 사이 중복을 제거할 구분자 입력
			String thumbnail = originFileName.substring(0, originFileName.lastIndexOf(".")) + "_"
					+ System.currentTimeMillis() + originFileName.substring(originFileName.lastIndexOf("."));

			// 실제 파일이 저장될 경로와 파일명
			String fullpath = savePath + thumbnail;

			// 파일 저장
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
		}

		int result = service.productModify(product);

		if (result > 0) {
			System.out.println("제품 수정 완료");
		} else {
			System.out.println("제품 수정 실패");
		}

		return "redirect:/healthner/admin/productRead.do?pno=" + product.getPno();
	}

	// 물품 삭제
	@RequestMapping("/productDelete.do")
	public String productDelete(int deleteNo[]) {

		int result = service.productDelete(deleteNo);

		if (result > 0) {

		} else {

		}

		return "redirect:/healthner/admin/productMgt.do?reqPage=1";
	}

	// 태규_200709_주문 목록 관련 페이지 제작
	@RequestMapping("/userBuy.do")
	public String userBuy(Model model, int reqPage, int type) {

		PurchasePageData data = service.userBuy(reqPage, type);

		model.addAttribute("type", type);
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
//		System.out.println(data.getPageNavi());
		return "admin/userBuy";
	}

	@RequestMapping("/userBuyRead.do")
	public String userBuyRead(Model model, int buyNo) {

		PurchaseData data = service.userBuyData(buyNo);

		model.addAttribute("purchase", data.getPurchase());
		model.addAttribute("list", data.getList());
		return "admin/userBuyRead";
	}

	@RequestMapping("/modifyInvoiceNumber.do")
	public String modifyInvoiceNumber(PurchaseVO purchase) {

		int result = service.modifyInvoiceNumber(purchase);

		if (result > 0) {

		} else {

		}

		return "redirect:/healthner/admin/userBuyRead.do?buyNo=" + purchase.getBuyNo();
	}

	// 혜진_200709_신고관리 페이지_선택 다중 삭제
	@RequestMapping("/deleteReport.do")
	@ResponseBody
	public int deleteReport(int[] writeType, int[] writeNo) {
		int result = service.deleteReport(writeType, writeNo);
		return result;
	}

	// 혜진_200709_예약 목록 관리 페이지_내용 조회
	@RequestMapping(value = "/meetinglist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String meetinglist(int responseFin, int start, int sorting) {
		TotalpageList tl = service.meetinglist(responseFin, start, sorting);
		return new Gson().toJson(tl);
	}

	// 혜진_200710_예약 목록 관리 페이지_완료 버튼 클릭하여 응답 완료처리
	@RequestMapping("/finResponse.do")
	@ResponseBody
	public int meetinglist(int responseFin, int meetingSeq) {
		int result = service.finResponse(responseFin, meetingSeq);
		return result;
	}

	// 혜진_200710_신고관리 페이지_선택 다중 삭제
	@RequestMapping("/deleteMeeting.do")
	@ResponseBody
	public int deleteMeeting(int[] meetingSeqArr) {
		int result = service.deleteMeeting(meetingSeqArr);
		return result;
	}

	// 혜진_200710_회원 정지 관리 페이지_내용 조회
	@RequestMapping(value = "/penaltylist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String penaltylist(int memberType, int start, int sorting, String searchWord) {
		TotalpageList tl = service.penaltylist(memberType, start, sorting, searchWord);
		return new Gson().toJson(tl);
	}

	// 혜진_200710_회원 정지 관리 페이지_선택 다중 삭제
	@RequestMapping("/deletePenalty.do")
	@ResponseBody
	public int deletePenalty(int[] penaltyArr) {
		int result = service.deletePenalty(penaltyArr);
		return result;
	}

	// 혜진_200710_회원 정지 관리 페이지_글작성 권한 정지
	@RequestMapping("/givePenalty.do")
	@ResponseBody
	public int givePenalty(int[] penaltyArr) {
		int result = service.givePenalty(penaltyArr);
		return result;
	}

	// 혜진_200710_신고글 관리_상세보기 modal_조회
	@RequestMapping(value = "/reportedDetail.do", method = RequestMethod.POST)
	@ResponseBody
	public Report reportedDetail(int writeType, int writeNo) {
		Report r = service.reportedDetail(writeType, writeNo);
		return r;
	}

	// 혜진_200713_신고글 관리_상세보기 modal_reportlist 조회
	@RequestMapping(value = "/reportedDetailList.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reportedDetailList(int writeType, int writeNo, int start) {
		TotalpageList tl = service.reportedDetailList(writeType, writeNo, start);
		return new Gson().toJson(tl);
	}
}
