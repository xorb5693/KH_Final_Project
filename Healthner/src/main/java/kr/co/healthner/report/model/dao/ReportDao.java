package kr.co.healthner.report.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.vo.ReportVO;

@Repository("reportDao")
public class ReportDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int insertReport(ReportVO rv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("report.reportInsert",rv);
	}

}
