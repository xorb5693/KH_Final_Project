package kr.co.healthner.admin.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.admin.model.vo.MeetingSchedule;
import kr.co.healthner.admin.model.vo.MemberSearch;
import kr.co.healthner.admin.model.vo.PTmapping;
import kr.co.healthner.admin.model.vo.Report;
import kr.co.healthner.mail.model.vo.MailVO;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.shop.model.vo.BuyProductVO;
import kr.co.healthner.vo.ProductVO;
import kr.co.healthner.vo.PurchaseVO;

@Repository("adminDao")
public class AdminDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 혜진_200629_회원관리 페이지_전체 리스트 조회 start 전달, end 계산하여 함께 전달
	public List memberList(MemberSearch ms) {
		return sqlSession.selectList("admin.memberList", ms);
	}

	// 혜진_200629_회원관리 페이지_팝업창_회원 ID를 매개변수로 전달하고 해당 ID의 정보들을 가져옴
	public Member oneMemberSearch(String memberId) {
		return sqlSession.selectOne("admin.oneMemberSearch", memberId);
	}

	// 혜진_200629_회원관리 페이지&트레이너 페이지_전체 회원 리스트의 수를 세어옴
	public int totalCount(MemberSearch ms) {
		return sqlSession.selectOne("admin.totalCount", ms);
	}

	// 혜진_200630_회원관리 페이지_팝업창_카드 정보를 수정함
	public int cardModify(Member m) {
		return sqlSession.update("admin.cardModify", m);
	}

	// 혜진_200630_트레이너 페이지_전체 리스트 조회
	public List trainerList(MemberSearch ms) {
		return sqlSession.selectList("admin.trainerList", ms);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 멤버 타입 변환
	public int approveTrainer(String memberId) {
		return sqlSession.update("admin.trainerApprove", memberId);
	}

	// 혜진_200630_트레이너 페이지_승인 버튼 클릭 시 회원 삭제
	public int rejectTrainer(String memberId) {
		return sqlSession.delete("admin.trainerReject", memberId);
	}

	// 혜진_200702_PT Mapping 페이지_Mapping조회
	public List ptMapping(PTmapping ms) {
		return sqlSession.selectList("admin.ptmapping", ms);
	}

	public int insertMail(MailVO mail) {
		
		return sqlSession.insert("mail.insertMail", mail);
	}
	

	// 혜진_200702_PT Mapping 페이지_Mapping 전체 갯수 조회
	public int ptTotalCount(PTmapping ms) {
		return sqlSession.selectOne("admin.ptTotalCount", ms);
	}
	
	// 태규_200703_메일
	public int deleteMail(int[] deleteNo) {
		
		return sqlSession.delete("mail.deleteMail", deleteNo);
	}

	public int selectTotalReciveCount(HashMap<String, Integer> map) {

		return sqlSession.selectOne("mail.selectTotalReciveCount", map);
	}

	public List<MailVO> selectReceiveMailList(HashMap<String, Integer> map) {


		return sqlSession.selectList("mail.selectReceiveMailList", map);
	}

	public int selectTotalSendCount(HashMap<String, Integer> map) {

		return sqlSession.selectOne("mail.selectTotalSendCount", map);
	}

	public List<MailVO> selectSendMailList(HashMap<String, Integer> map) {

		return sqlSession.selectList("mail.selectSendMailList", map);
	}

	public int productInsert(ProductVO product) {
		
		return sqlSession.insert("admin.productInsert", product);
    }
	
	// 혜진_200706_mapping데이터 삭제
	public int mappingDelete(int mpSeq) {
		return sqlSession.delete("admin.mappingDelete",mpSeq);
	}
	// 혜진_200706_mapping신규 등록_회원 찾기
	public List mappingFind(MemberSearch ms) {
		return sqlSession.selectList("admin.mappingFind",ms);
	}
	// 혜진_200707_mapping신규 등록_등록
	public int inputNewMapping(PTmapping pt) {
		return sqlSession.insert("admin.inputNewMapping",pt);
	}
	// 혜진_200713_mapping업데이트
	public int updateNewMapping(PTmapping pt) {
		return sqlSession.insert("admin.updateNewMapping",pt);
	}
	//혜진_200707_mapping 데이터 수정
	public PTmapping mappingCheck(int mpSeq) {
		return sqlSession.selectOne("admin.mappingCheck", mpSeq);
	}

	//혜진_200708_신고글 조회
	public List reportlist(Report rp) {
		return sqlSession.selectList("admin.reportlist",rp);
	}
	//혜진_200708_신고글 전체 수 조회
	public int reportTotalCount(Report rp) {
		return sqlSession.selectOne("admin.totalReportlist",rp);
	}
	//혜진_200708_누적 신고수 조회
	public List totalReportCnt(Report rp) {
		return sqlSession.selectList("admin.totalReportCnt",rp);
	}
	//태규_200708_상품 관리 페이지
	public int totalProductCount() {
		
		return sqlSession.selectOne("shop.totalShop");
	}

	public List<ProductVO> productList(HashMap<String, String> map) {
		
		return sqlSession.selectList("shop.shopList", map);
	}

	public ProductVO productRead(int pno) {
		
		return sqlSession.selectOne("shop.productRead", pno);
	}

	public int productModify(ProductVO product) {
		
		return sqlSession.update("admin.productModify", product);
	}

	public int productDelete(int[] deleteNo) {
		
		return sqlSession.delete("admin.productDelete", deleteNo);

	}
	//혜진_200709_신고관리 페이지_선택 다중 삭제_본문
	public int deleteReport(HashMap checkArr) {
		return sqlSession.delete("admin.deleteReport",checkArr);
	}
	//혜진_200709_신고관리 페이지_선택 다중 삭제_신고관리 테이블
	public int deleteReportTB(HashMap checkArr) {
		return sqlSession.delete("admin.deleteReportTB",checkArr);
	}
	//혜진_200709_예약 목록 관리 페이지_전체 게시물 갯수
	public int meetingTotalCount(MeetingSchedule ms) {
		return sqlSession.selectOne("admin.meetingTotalCount",ms);
	}
	//혜진_200709_예약 목록 관리 페이지_게시물 조회
	public List meetinglist(MeetingSchedule ms) {
		return sqlSession.selectList("admin.meetinglist",ms);
	}
	//혜진_200710_예약 목록 관리 페이지_완료 버튼 클릭하여 응답 완료처리
	public int finResponse(MeetingSchedule ms) {
		return sqlSession.update("admin.finResponse",ms);
	}
	//혜진_200710_신고관리 페이지_선택 다중 삭제
	public int deleteMeeting(int[] meetingSeqArr) {
		return sqlSession.delete("admin.deleteMeeting",meetingSeqArr);
	}


	public int totalPurchaseCount(HashMap<String, Integer> map) {
		
		return sqlSession.selectOne("admin.totalPurchaseCount", map);
	}

	public List<PurchaseVO> selectPurchaseList(HashMap<String, Integer> map) {
		
		return sqlSession.selectList("admin.selectPurchaseList", map);
	}
	// 혜진_200710_회원 정지 관리 페이지_전체 게시물 갯수
	public int penaltyTotalCount(Report r) {
		return sqlSession.selectOne("admin.penaltyTotalCount", r);
	}
	// 혜진_200710_회원 정지 관리 페이지_내용 조회
	public List penaltylist(Report r) {
		return sqlSession.selectList("admin.penaltylist", r);
	}
	// 혜진_200710_회원 정지 관리 페이지_선택 다중 삭제
	public int deletePenalty(int[] penaltyArr) {
		return sqlSession.delete("admin.deletePenalty",penaltyArr);
	}
	// 태규
	public PurchaseVO selectPurchase(int buyNo) {
		return sqlSession.selectOne("shop.selectPurchase", buyNo);
	}
	// 태규
	public List<BuyProductVO> selectBuyProductList(int buyNo) {
		return sqlSession.selectList("shop.selectBuyProductList", buyNo);
	}
	// 태규
	public int modifyInvoiceNumber(PurchaseVO purchase) {
		return sqlSession.update("admin.modifyInvoiceNumber", purchase);

	}
	// 혜진_200710_회원 정지 관리 페이지_글작성 권한 정지
	public int givePenalty(int penaltyArr) {
		return sqlSession.insert("admin.givePenalty", penaltyArr);
	}
	// 혜진_200710_회원 정지 관리 페이지_권한이 정지된 회원 표시
	public List banListCheck() {
		return sqlSession.selectList("admin.banListCheck");
	}
	// 혜진_200710_신고글 관리_상세보기 modal_조회
	public Report reportedDetail(Report r) {
		return sqlSession.selectOne("admin.reportedDetail", r);
		
	}
	// 혜진_200713_신고글 관리_상세보기 modal_reportlist 조회_totalList
	public int reportedDetailListTotal(Report r) {
		return sqlSession.selectOne("admin.reportedDetailListTotal",r);
	}
	// 혜진_200713_신고글 관리_상세보기 modal_reportlist 조회
	public List reportedDetailList(Report r) {
		return sqlSession.selectList("admin.reportedDetailList",r);
	}
	
}