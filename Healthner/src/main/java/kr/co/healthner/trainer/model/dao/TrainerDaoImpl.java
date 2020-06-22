package kr.co.healthner.trainer.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.healthner.member.model.vo.Member;

@Repository("trainerDao")
public class TrainerDaoImpl {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<Member> selectAllTrainers() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("member.selectAllTrainers");
	}

}
