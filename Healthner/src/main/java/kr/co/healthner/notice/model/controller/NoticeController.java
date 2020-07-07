package kr.co.healthner.notice.model.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.healthner.notice.model.service.NoticeService;
import kr.co.healthner.notice.model.vo.Notice;
import kr.co.healthner.notice.model.vo.NoticePageDate;


@Controller
@RequestMapping(value="healthner/notice")
public class NoticeController {
	
	@Autowired
	@Qualifier("noticeService")
	NoticeService service;
	
	@RequestMapping(value="/notice.do")
	public String Notice(int reqPage , Model model) { // 공지사항 전체목록
		
		return "notice/notice";
	}
	@RequestMapping(value="/noticeWriteFrm.do")
	public String NoticeWriteFrm() {
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeUp.do") // 공지사항글쓰기
	public String noticeWrite(HttpSession session  , String ck4 , Notice n ) {
//		session.setAttribute("img",ck4 );
//		String fileTag = "noticeFilename";
//		String filePath = "/resources/upload/";
//		MultipartFile file = mtf.getFile(fileTag);
//		String fileName = file.getOriginalFilename();
//		file.transferTo(new File(filePath + fileName));
//		System.out.println("썸네일파일확인 : " + fileName);
		
		Notice m = new Notice();
		m.setNoticeTitle(n.getNoticeTitle());
		m.setNoticeContent(n.getNoticeContent());
		m.setNoticeFilename(n.getNoticeFilename());
		
		System.out.println(n.getNoticeContent());
	
		//게시판 html 코드가 저장된 String을 html Document로 변환 후 img 태그 추출
		Document doc = Jsoup.parseBodyFragment(n.getNoticeContent());
		Elements img = doc.getElementsByTag("img");
		System.out.println(img.size());
		
		//img의 size가 0 이상인 경우 즉, 이미지 태그가 하나라도 존재하는 경우
		if (img.size() > 0) {
			String src = img.get(0).attr("src");
			System.out.println(src);
			m.setNoticeFilename(src);
		}
		System.out.println("썸네일용 검사 "+m.getNoticeFilename());
		int result = service.noticeInsert(m);
		if(result >0) {
			return "redirect:/healthner/notice/noticeList.do?reqPage=1";
		}else {
			return "notice/notice";
		}
//		session.setAttribute("title", m.getNoticeTitle());
//		session.setAttribute("content", m.getNoticeContent());
//		return "notice/su";
	}
	
	@RequestMapping(value="/noticeList.do") // 공지사항 전체목록출력
	public String noticeList(int reqPage,Model model) {
		NoticePageDate nd = service.noticeList(reqPage);
		System.out.println(nd.getPageNavi());
		model.addAttribute("list",nd.getList());
		model.addAttribute("navi",nd.getPageNavi());
		return "notice/noticeList";
	}
	
	@RequestMapping(value="/noticeView.do") // 게시글 상세보기
	public String noticeView(int noticeNo, Notice m, Model model) {
		m.setNoticeNo(noticeNo);
		Notice n = service.noticeView(m);
		model.addAttribute("n",n);
		return "notice/noticeView";
	}
	
	@RequestMapping(value="/noticeModify.do")// 게시판 수정
	public String noticeModify(int noticeNo, Notice m, Model model) {
		m.setNoticeNo(noticeNo);
		Notice n = service.noticeView(m);
		model.addAttribute("n",n);
		return "notice/noticeModify";
	}
	@RequestMapping(value="/noticeUpdate.do")
	public String noticeUpdate(Notice m) {
		int result = service.noticeUpdate(m);
		if(result>0) {
			System.out.println("수정성공");
			
		}else {
			System.out.println("수정실패ㅔ");
			
		}
		return "redirect:/healthner/notice/noticeList.do?reqPage=1";
	}
	
	@RequestMapping(value="/noticeDelete.do")
	public String noticeDelete(int noticeNo , Notice m) {
		
		m.setNoticeNo(noticeNo);
		int result = service.noticeDelete(m);
		if(result>0) {
			
			System.out.println("게시갈삭제성공");
		}else {
			System.out.println("게시글삭제실패");
		}
		return "redirect:/healthner/notice/noticeList.do?reqPage=1";	
	}
	
	
	@RequestMapping(value="/boardWriteFrm") public String boardWriteFrm() {
		return "board/boardWrite"; 
		}
	
	@RequestMapping(value="/noticeSearchTitle.do")
	public String noticeSearchTitle(String searchTitle , Model model , int reqPage) {
		NoticePageDate nd = service.noticeListSearch(reqPage,searchTitle);
		
		model.addAttribute("list",nd.getList());
		model.addAttribute("keyword",searchTitle);
		model.addAttribute("navi",nd.getPageNavi());
		return "notice/noticeList";
	}
	
	
	
	 

}
