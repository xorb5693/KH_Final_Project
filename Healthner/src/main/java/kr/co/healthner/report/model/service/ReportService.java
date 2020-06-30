package kr.co.healthner.report.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.report.model.dao.ReportDao;
import kr.co.healthner.vo.ReportVO;

@Service
public class ReportService {

		@Autowired
		@Qualifier("reportDao")
		private ReportDao dao;

		public int insertReport(ReportVO rv) {
			// TODO Auto-generated method stub
			return dao.insertReport(rv);
		}
}
