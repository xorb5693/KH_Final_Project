package kr.co.healthner.trainer.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.trainer.model.dao.TrainerDaoImpl;

@Service("trainerService")
public class TrainerServiceImpl {
	@Autowired
	@Qualifier("trainerDao")
	private TrainerDaoImpl dao;

	public List<Member> selectAllTrainers() {
		// TODO Auto-generated method stub
		return dao.selectAllTrainers();
	}
}
