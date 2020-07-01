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
		
		StringBuffer pageNavi = new StringBuffer();
		int pageNaviSize = 10;
		int pageNo = ((reqPage - 1) / pageNaviSize) * pageNaviSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<li><a class='btn btn-outline-primary' href='/healthner/member/myEat.do?memberNo=" + trainerNo + "&reqPage=" + (pageNo - 1) + "'>이전</a></li>");
		}
		
		for (int i = 0; i < pageNaviSize; i++) {
					
			if (pageNo == reqPage) {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			} else {
				pageNavi.append("<li><a class='btn btn-outline-primary' href='/healthner/trainer/customerList.do?memberNo=" + trainerNo + "&reqPage=" + pageNo + "'>" + pageNo + "</a></li>");
			}
				
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<li><a class='btn btn-outline-primary' href='/healthner/member/myEat.do?memberNo=" + trainerNo + "&reqPage=" + pageNo + "'>다음</a></li>");
		}
		
		CustomerData data = new CustomerData();
		data.setList(list);
		data.setPageNavi(pageNavi.toString());

		return data;		
	}

	public int customerCntUpdate(MemberMappingVO mmv) {
		// TODO Auto-generated method stub
		return dao.customerCntUpdate(mmv);
	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMember(memberNo);
	}

	public List<BmiVO> selectOneMemberBmi(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectOneMemberBmi(memberNo);
	}

	public BmiVO selectBmi(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectBmi(memberNo);
	}

//	public List<Member> selectCustomerList() {
//		// TODO Auto-generated method stub
//		return dao.selectCustomerList();
//	}
}
