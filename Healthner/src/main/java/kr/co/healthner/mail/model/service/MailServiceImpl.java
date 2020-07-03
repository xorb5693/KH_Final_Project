package kr.co.healthner.mail.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.mail.model.dao.MailDaoImpl;
import kr.co.healthner.mail.model.vo.MailData;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;

@Service("mailService")
public class MailServiceImpl {

	@Autowired
	@Qualifier("mailDao")
	private MailDaoImpl dao;

	public ArrayList<Member> selectMemberList(Member m) {
		
		ArrayList<Member> memberList = new ArrayList<Member>();
		Member admin = dao.selectAdmin();
		memberList.add(admin);
		
		ArrayList<Integer> memberNoList = (ArrayList<Integer>)dao.selectMappingMemberNoList(m);
		
		for (int memberNo: memberNoList) {
			Member member = dao.selectMemberNick(memberNo);
			memberList.add(member);
		}
		
		return memberList;
	}

	public Member selectMemberId(String memberId) {
		
		Member m = new Member();
		m.setMemberId(memberId);
		return dao.selectMemberId(m);
	}

	public int insertMail(MailVO mail) {
		
		return dao.insertMail(mail);
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
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/mail/receiveList.do?reqPage=" + (pageNo - 1) + "'>이전</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/mail/receiveList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>");
			} else {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			}
			
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/mail/receiveList.do?reqPage=" + pageNo + "'>다음</a>");
		}
		
		///healthner/mail/receiveList.do?reqPage=1
		MailData data = new MailData();
		data.setList((ArrayList<MailVO>)list);
		data.setPageNavi(pageNavi.toString());
		return data;
	}

	public MailVO readMail(int mailNo, int readType) {
		
		if (readType == 0) {
			dao.readMailUpdate(mailNo);
		}
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("mailNo", mailNo);
		map.put("readType", readType);
		
		MailVO mail = dao.readMail(map);
		
		return mail;
	}

	public int deleteMail(int[] deleteNo) {
		
		return dao.deleteMail(deleteNo);
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
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/mail/sendList.do?reqPage=" + (pageNo - 1) + "'>이전</a>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
			if (pageNo != reqPage) {
				pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/mail/sendList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>");
			} else {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			}
			
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/mail/sendList.do?reqPage=" + pageNo + "'>다음</a>");
		}
		
		///healthner/mail/receiveList.do?reqPage=1
		MailData data = new MailData();
		data.setList((ArrayList<MailVO>)list);
		data.setPageNavi(pageNavi.toString());
		return data;
	}
	
	public int mailCheck(int memberNo) {
		
		return dao.mailCheck(memberNo);
	}
}
