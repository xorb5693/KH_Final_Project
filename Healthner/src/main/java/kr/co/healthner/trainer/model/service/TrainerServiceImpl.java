package kr.co.healthner.trainer.model.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.trainer.model.dao.TrainerDaoImpl;
import kr.co.healthner.trainer.model.vo.BmiData;
import kr.co.healthner.trainer.model.vo.BmiVO;
import kr.co.healthner.trainer.model.vo.CustomerData;
import kr.co.healthner.trainer.model.vo.MemberMappingInfoVO;
import kr.co.healthner.trainer.model.vo.TrainerVO;

@Service("trainerService")
public class TrainerServiceImpl {
	@Autowired
	@Qualifier("trainerDao")
	private TrainerDaoImpl dao;
	
	public List<TrainerVO> selectAllTrainers() {
		return dao.selectAllTrainers();
	}
	
	public TrainerVO oneTrainerInfo(int memberNo) {
		return dao.oneTrainerInfo(memberNo);
	}

	public TrainerVO selectOneTrainer(String id) {
		// TODO Auto-generated method stub
		return dao.selectOneTrainer(id);
	}

	public Member selectMember(HttpSession session) {
		// TODO Auto-generated method stub
		return dao.selectMember(session);
	}

	public int updateTrainerInfo(TrainerVO tUpdate) {
		return dao.updateTrainerInfo(tUpdate);
	}

	public int insertInbody(BmiVO bmi) {
		// TODO Auto-generated method stub
		return dao.insertInbody(bmi);
	}

	public CustomerData selectMapperInfo(int trainerNo, int reqPage) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("trainerNo", trainerNo);
		//한 페이지당 식사 기록 수
		int numPerPage = 10;
				
		//총 식사 기룩
		int totalCount = dao.selectMapperInfoCount(map);
		//총 페이지 수
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
		List<MemberMappingInfoVO> list = dao.selectMapperInfo(map);
		System.out.println(list);
		
		StringBuffer pageNavi = new StringBuffer();
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<li><a href='/healthner/trainer/customerList.do?memberNo=" + trainerNo + "&reqPage=" + (pageNo - 1) + "'><</a></li>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
					
			if (pageNo == reqPage) {
				pageNavi.append("<li class='active'><span>" + pageNo + "</span></li>");
			} else {
				pageNavi.append("<li><a href='/healthner/trainer/customerList.do?memberNo=" + trainerNo + "&reqPage=" + pageNo + "'>" + pageNo + "</a></li>");
			}
				
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<li><a href='/healthner/trainer/customerList.do?memberNo=" + trainerNo + "&reqPage=" + pageNo + "'>></a></li>");
		}
		
		CustomerData data = new CustomerData();
		data.setList(list);
		data.setPageNavi(pageNavi.toString());

		return data;		
	}

	public int customerCntUpdate(int mappingSeq, String check) {
		
		if (check.equals("increase")) {
			return dao.customerUpgrade(mappingSeq);
		} else {
			return dao.customerDowngrade(mappingSeq);
		}
	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(memberNo);
	}

	public BmiData selectOneMemberBmi(int memberNo, int reqPage) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		int numPerPage=10;
		int totalCount = dao.selectOneMemberBmiCount(map);
		int totalPage;
		if(totalCount %numPerPage==0) {
			totalPage = totalCount/numPerPage;
		} else {
			totalPage = totalCount/numPerPage + 1;
		}
		int start = (reqPage-1) * numPerPage + 1;
		int end = reqPage*numPerPage;
		map.put("start", start);
		map.put("end", end);
		List<BmiVO> list = dao.selectOneMemberBmi(map);
		System.out.println(list);
		
		StringBuffer pageNavi = new StringBuffer();
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<li><a href='/healthner/trainer/inbodyList.do?memberNo=" + memberNo + "&reqPage=" + (pageNo - 1) + "'><</a></li>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
					
			if (pageNo == reqPage) {
				pageNavi.append("<li class='active'><span>" + pageNo + "</span></li>");
			} else {
				pageNavi.append("<li><a href='/healthner/trainer/inbodyList.do?memberNo=" + memberNo + "&reqPage=" + pageNo + "'>" + pageNo + "</a></li>");
			}
				
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		if (pageNo <= totalPage) {
			pageNavi.append("<li><a href='/healthner/trainer/inbodyList.do?memberNo=" + memberNo + "&reqPage=" + pageNo + "'>></a></li>");
		}
		BmiData data = new BmiData();
		data.setList(list);
		data.setPageNavi(pageNavi.toString());
		
		
		return data;
	}

	public BmiVO selectBmi(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectBmi(memberNo);
	}

	public BmiVO selectPrevBmi(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectPrevBmi(memberNo);
	}

	public BmiVO selectOneGraph(BmiVO bmi) {
		// TODO Auto-generated method stub
		return dao.selectOneGraph(bmi);
	}

//	public List<Member> selectCustomerList() {
//		// TODO Auto-generated method stub
//		return dao.selectCustomerList();
//	}
}
