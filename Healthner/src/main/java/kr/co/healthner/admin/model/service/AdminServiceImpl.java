package kr.co.healthner.admin.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.admin.model.dao.AdminDaoImpl;
import kr.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.admin.model.vo.PTmapping;
import kr.co.healthner.admin.model.vo.TotalpageList;
import kr.co.healthner.mail.model.vo.MailData;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.vo.ProductVO;

@Service("adminService")
public class AdminServiceImpl {

	@Autowired
	@Qualifier("adminDao")
	private AdminDaoImpl dao;

	// 혜진_200629_start 전달, end 계산하여 함께 전달
	public TotalpageList memberList(String searchWord, int checkbox1, int checkbox2, int start) {
		// 전체 게시글 갯수 카운트
		MemberSearch ms = new MemberSearch();
		ms.setSearchWord(searchWord);
		ms.setCheckbox1(checkbox1);
		ms.setCheckbox2(checkbox2);
		ms.setMemberType(1);
		int totalCount = dao.totalCount(ms);
		// 넘버링
		int length = 5;
		int end = start + length - 1;
		ms.setStart(start);
		ms.setEnd(end);
		ArrayList<Member> list = (ArrayList<Member>) dao.memberList(ms);

		// 태규_200630_expiredate가 null인 경우 공백처리
		for (Member m : list) {
			if (m.getExpireDate() == null) {
				m.setExpireDate(" ");
			}
		}
		TotalpageList tl = new TotalpageList();
		tl.setList(list);
		tl.setTotalCount(totalCount);
		return tl;
	}

	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	public Member oneMemberSearch(String memberId) {
		return dao.oneMemberSearch(memberId);
	}

	// 혜진_200630_회원관리 페이지_팝업창_카드 정보를 수정함_카드 정보와 member정보를 묶어 보내기
	public int cardModify(String memberId, String card) {
		Member m = new Member();
		m.setMemberId(memberId);
		m.setCard(card);
		return dao.cardModify(m);
	}

	// 혜진_200630_트레이너 페이지_정보 조회
	public TotalpageList trainerList(String searchWord, int memberType, int start) {
		// 전체 게시글 갯수 카운트
		MemberSearch ms = new MemberSearch();
		ms.setSearchWord(searchWord);
		ms.setMemberType(memberType);
		int totalCount = dao.totalCount(ms);
		// 넘버링
		int length = 5;
		int end = start + length - 1;
		ms.setStart(start);
		ms.setEnd(end);
		ArrayList<Member> list = (ArrayList<Member>) dao.trainerList(ms);
		for (Member m : list) {
			if (m.getExpireDate() == null) {
				m.setExpireDate(" ");
			}
		}
		TotalpageList tl = new TotalpageList();
		tl.setList(list);
		tl.setTotalCount(totalCount);
		return tl;
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 멤버 타입 변환
	public int approveTrainer(String memberId) {
		return dao.approveTrainer(memberId);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 회원 삭제
	public int rejectTrainer(String memberId) {
		return dao.rejectTrainer(memberId);
	}

	// 혜진_200702_PT Mapping 페이지_Mapping조회
	public TotalpageList ptMapping(String searchWord, int memberType, int start, int checkbox1) {
		// 전체 게시글 갯수 카운트
		PTmapping ms = new PTmapping();
		ms.setSearchWord(searchWord);
		ms.setMemberType(memberType);
		ms.setCheckbox1(checkbox1);
		int totalCount = dao.ptTotalCount(ms);
		// 넘버링
		int length = 5;
		int end = start + length - 1;
		ms.setStart(start);
		ms.setEnd(end);
		ArrayList<PTmapping> list = (ArrayList<PTmapping>) dao.ptMapping(ms);
		TotalpageList tl = new TotalpageList();
		tl.setListpt(list);
		tl.setTotalCount(totalCount);
		return tl;
	}

	//쪽지 관련 메소드들
	public int insertMail(MailVO mail) {
		
		return dao.insertMail(mail);
	}

	public int deleteMail(int[] deleteNo) {
		
		return dao.deleteMail(deleteNo);
	}

	public MailData receiveMailData(int reqPage, int memberNo) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		
		int totalCount = dao.selectTotalReciveCount(map);
		int numPerPage = 10;
		int totalPage;
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		map.put("start", start);
		map.put("end", end);
		List<MailVO> list = dao.selectReceiveMailList(map);
		
		StringBuffer pageNavi = new StringBuffer();
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/mail.do?reqPage=" + (pageNo - 1) + "'>이전</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi.append("<a class='btn btn-outline-primary' href='/mail.do?reqPage=" + pageNo + "'>" + pageNo + "</a>");
			} else {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			}
			
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/mail.do?reqPage=" + pageNo + "'>다음</a>");
		}
		
		MailData data = new MailData();
		data.setList((ArrayList<MailVO>)list);
		data.setPageNavi(pageNavi.toString());
		return data;
	}

	public MailData sendMailData(int reqPage, int memberNo) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		
		int totalCount = dao.selectTotalSendCount(map);
		int numPerPage = 10;
		int totalPage;
		
		if (totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		} else {
			totalPage = totalCount / numPerPage + 1;
		}
		
		int start = (reqPage - 1) * numPerPage + 1;
		int end = reqPage * numPerPage;
		map.put("start", start);
		map.put("end", end);
		List<MailVO> list = dao.selectSendMailList(map);
		
		StringBuffer pageNavi = new StringBuffer();
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/sendMail.do?reqPage=" + (pageNo - 1) + "'>이전</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi.append("<a class='btn btn-outline-primary' href='/sendMail.do?reqPage=" + pageNo + "'>" + pageNo + "</a>");
			} else {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			}
			
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a class='btn btn-outline-primary' href=/sendMail.do?reqPage=" + pageNo + "'>다음</a>");
		}
		
		///healthner/mail/receiveList.do?reqPage=1
		MailData data = new MailData();
		data.setList((ArrayList<MailVO>)list);
		data.setPageNavi(pageNavi.toString());
		return data;
	}

	public int productInsert(ProductVO product) {
		
		return dao.productInsert(product);
	}
}
