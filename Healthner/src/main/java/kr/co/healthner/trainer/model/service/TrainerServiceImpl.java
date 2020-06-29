package kr.co.healthner.trainer.model.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.trainer.model.dao.TrainerDaoImpl;
import kr.co.healthner.trainer.model.vo.BmiVO;
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

	public List<MemberMappingInfoVO> selectMapperInfo(int trainerNo) {
		// TODO Auto-generated method stub
		return dao.selectMapperInfo(trainerNo);
	}

	public int customerCntUpdate(MemberMappingVO mmv) {
		// TODO Auto-generated method stub
		return dao.customerCntUpdate(mmv);
	}

//	public List<Member> selectCustomerList() {
//		// TODO Auto-generated method stub
//		return dao.selectCustomerList();
//	}
}
