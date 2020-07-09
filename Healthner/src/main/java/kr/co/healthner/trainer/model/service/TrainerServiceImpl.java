package kr.co.healthner.trainer.model.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import info.debatty.java.stringsimilarity.JaroWinkler;
import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.trainer.model.dao.TrainerDaoImpl;
import kr.co.healthner.trainer.model.vo.BmiData;
import kr.co.healthner.trainer.model.vo.BmiVO;
import kr.co.healthner.trainer.model.vo.CustomerData;
import kr.co.healthner.trainer.model.vo.MemberMappingInfoVO;
import kr.co.healthner.trainer.model.vo.ProfessionalCategoryVO;
import kr.co.healthner.trainer.model.vo.TrainerCommentData;
import kr.co.healthner.trainer.model.vo.TrainerVO;
import kr.co.healthner.vo.TrainerCommentVO;

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

	public ArrayList<ProfessionalCategoryVO> selectCategoryList() {
		
		return (ArrayList<ProfessionalCategoryVO>)dao.selectCategoryList();
	}
	
	public ArrayList<TrainerVO> recommend(int first, int second, int third) {
		
		ArrayList<TrainerVO> list = (ArrayList<TrainerVO>)dao.selectAllTrainers();
		ArrayList<ProfessionalCategoryVO> categorys = (ArrayList<ProfessionalCategoryVO>)dao.selectCategoryList();
		
		char ch = 'a';
		HashMap<Integer, String> categoryMap = new HashMap<Integer, String>();
		
		/*
		 * 추천을 위해 카테고리의 번호를 각 알파벳으로 맵핑한다. 최대 a~z
		 * */
		for (ProfessionalCategoryVO cat: categorys) {
			categoryMap.put(cat.getCategoryNo(), Character.toString(ch));
			ch++;
		}
		
		/*
		 * 사용자가 입력한 추천 카테고리를 맵핑한 알파벳으로 변환 후 비중에 맞게 변환을 한다.
		 * 만약 사용자가 선택한 항목의 맵핑한 값이 각각 a, b, c라면 aaabbc로 1지망은 3회, 2지망은 2회, 3지망은 1회반복한다.  
		 * */
		String firstValue = categoryMap.get(first);
		String secondValue = categoryMap.get(second);
		String thirdValue = categoryMap.get(third);
		String userStr = firstValue + firstValue + firstValue + secondValue + secondValue + thirdValue;
		
		HashMap<TrainerVO, Double> trainerMap = new HashMap<TrainerVO, Double>();
		//문자열 유사도를 구하기 위한 클래스
		JaroWinkler jaro = new JaroWinkler();
		
		/*
		 * 마찬가지로 트레이너 리스트를 순회하며 각각이 자신있는 분야를 1, 2, 3지망으로 나타낸것을 하나의 문자열로 나열한다.
		 * 사용자가 입력한 문자열과 트레이너의 문자열을 JaroWinkler의 distance 클래스를 이용하여 문자열 사이의 유사도를 구한다.
		 * 두 문자열 사이의 유사도가 높을수록 0에 가깝다.
		 * 유사도를 구하면 해당 트레이너 객체를 key로, 유사도 값을 value로하여 HashMap에 저장한다.
		 * 해당 문자열의 유사도가 1일때 즉, 사용자가 입력한 값과 트레이너가 입력한 값이 동일하지 않으면 HashMap에 저장하지 않는다.
		 * */
		for (TrainerVO trainer: list) {
			String firstTrainerValue = categoryMap.get(trainer.getCatFirst());
			String secondTrainerValue = categoryMap.get(trainer.getCatSecond());
			String thirdTrainerValue = categoryMap.get(trainer.getCatThird());
			String trainerStr = firstTrainerValue + firstTrainerValue + firstTrainerValue + secondTrainerValue + secondTrainerValue + thirdTrainerValue;
//			System.out.println(userStr + " / " + trainerStr);
			double distance = 1 - jaro.distance(userStr, trainerStr);
//			System.out.println(distance);
			
			if (distance != 0) {
				trainerMap.put(trainer, distance);
			}
		}
		
		/*
		 * HashMap을 value 기준으로 정렬하기 위한 알고리즘
		 * */
		List<Entry<TrainerVO, Double>> list_entries = new ArrayList<Entry<TrainerVO,Double>>(trainerMap.entrySet());
		Collections.sort(list_entries, new Comparator<Entry<TrainerVO, Double>>() {
			
			@Override
			public int compare(Entry<TrainerVO, Double> o1, Entry<TrainerVO, Double> o2) {
				
				return o2.getValue().compareTo(o1.getValue());
			}
		});
		
		ArrayList<TrainerVO> sortList = new ArrayList<TrainerVO>();
		
		/*
		 * 정렬된 HasaMap에 대하여 TrainerVO만을 추출해내 ArrayList에 저장한 뒤 리턴한다.
		 * */
		for (Entry<TrainerVO, Double> entry: list_entries) {
			
			sortList.add(entry.getKey());
		}
		
		return sortList;
	}

	public ArrayList<TrainerCommentVO> trainerComment() {
		ArrayList<TrainerCommentVO> list = (ArrayList<TrainerCommentVO>)dao.trainerComment();
		return list;
	}

//	public List<Member> selectCustomerList() {
//		// TODO Auto-generated method stub
//		return dao.selectCustomerList();
//	}
}
