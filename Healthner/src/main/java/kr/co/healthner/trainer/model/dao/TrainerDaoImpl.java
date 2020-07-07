package kr.co.healthner.trainer.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.member.model.vo.MemberMappingVO;
import kr.co.healthner.trainer.model.vo.BmiVO;
import kr.co.healthner.trainer.model.vo.MemberMappingInfoVO;
import kr.co.healthner.trainer.model.vo.ProfessionalCategoryVO;
import kr.co.healthner.trainer.model.vo.TrainerVO;

@Repository("trainerDao")
public class TrainerDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<TrainerVO> selectAllTrainers() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("trainer.allTrainerList");
	}

	public TrainerVO selectOneTrainer(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectOneTrainer", id);
	}

	public Member selectMember(HttpSession session) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectMember",session);
	}

	public int updateTrainerInfo(TrainerVO tUpdate) {
		// TODO Auto-generated method stub
		return sqlSession.update("trainer.updateTrainerInfo", tUpdate);
	}

	public int insertInbody(BmiVO bmi) {
		// TODO Auto-generated method stub
		return sqlSession.insert("trainer.insertInbody",bmi);
	}

	public List<MemberMappingInfoVO> selectMapperInfo(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("trainer.selectMapperInfo", map);
	}

//	public int customerCntUpdate(MemberMappingVO mmv) {
//		// TODO Auto-generated method stub
//		return sqlSession.update("trainer.customerCntUpdate", mmv);
//	}

	public List<ProfessionalCategoryVO> selectCategoryList() {
		
		return sqlSession.selectList("trainer.selectCategoryList");
	}
//	public List<Member> selectCustomerList() {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("trainer.selectCustomerList");
//	}

	public Member selectOneMember(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectOneMember", memberNo);
	}

	public List<BmiVO> selectOneMemberBmi(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("trainer.selectOneMemberBmi", map);
	}

	public int selectMapperInfoCount(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectMapperInfoCount", map);
	}

	public BmiVO selectBmi(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectBmi", memberNo);
	}

	public BmiVO selectPrevBmi(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectPrevBmi", memberNo);
	}

	public BmiVO selectOneGraph(BmiVO bmi) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.selectOneGraph", bmi);
	}
	
	public int selectOneMemberBmiCount(HashMap<String, Integer> map) {
		return sqlSession.selectOne("trainer.selectOneMemberBmiCount", map);
	}

	public int customerUpgrade(int mappingSeq) {

		return sqlSession.update("trainer.customerUpgrade", mappingSeq);
	}

	public int customerDowngrade(int mappingSeq) {
		
		return sqlSession.update("trainer.customerDowngrade", mappingSeq);
	}

	public TrainerVO oneTrainerInfo(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("trainer.oneTrainerInfo", memberNo);
	}
}
