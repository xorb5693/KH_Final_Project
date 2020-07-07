package kr.co.healthner.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.notice.model.vo.Notice;
import kr.co.healthner.notice.model.vo.NoticePageDate;
import kr.co.healthner.shop.model.dao.ShopDao;
import kr.co.healthner.shop.model.vo.ShopPageDate;
import kr.co.healthner.vo.Basket;
import kr.co.healthner.vo.BasketVO;
import kr.co.healthner.vo.ProductVO;

@Service("shopService")
public class ShopService {
	
	@Autowired
	@Qualifier("shopDao")
	private ShopDao dao;

	public ShopPageDate shopList(int reqPage) {
		int numPerPage = 9;
		
		int totalCount = dao.totalShop();
		System.out.println(totalCount);
		//총 페이지수 연산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage +1;
		}
		// 조회해올 게시물 시작번호와 끝번호 연산
		
		int start = (reqPage - 1)* numPerPage+1;
		int end = (reqPage)* numPerPage;
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("start",start);
		map.put("end", end);
		List list = dao.shopList(map);
		/* ArrayList<Notice> li = (ArrayList<Notice>)list; */
		
		String pageNavi = "";
		int pageNaviSize = 9;
		int pageNo = ((reqPage -1) / pageNaviSize) * pageNaviSize +1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='noticeList.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		ShopPageDate spd = new ShopPageDate();
		spd.setList((ArrayList<ProductVO>)list);
		spd.setPageNavi(pageNavi);
		return spd;
		
	}

	public ShopPageDate searchProductList(int reqPage, String category, String category2, String category3, String pname) {
		int numPerPage = 9;
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("category", category);
		map2.put("category2", category2);
		map2.put("category3", category3);
		map2.put("pname", pname);
		
		int totalCount = dao.totalSearchShop(map2);
		System.out.println(totalCount);
		//총 페이지수 연산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage +1;
		}
		// 조회해올 게시물 시작번호와 끝번호 연산
		
		int start = (reqPage - 1)* numPerPage+1;
		int end = (reqPage)* numPerPage;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("category2", category2);
		map.put("category3", category3);
		map.put("pname", pname);
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		List list = dao.shopSearchList(map);
		/* ArrayList<Notice> li = (ArrayList<Notice>)list; */
		
		String pageNavi = "";
		int pageNaviSize = 9;
		int pageNo = ((reqPage -1) / pageNaviSize) * pageNaviSize +1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='noticeList.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		ShopPageDate spd = new ShopPageDate();
		spd.setList((ArrayList<ProductVO>)list);
		spd.setPageNavi(pageNavi);
		return spd;
	}

	public ShopPageDate searchProductList2(int reqPage, String category, String category2, String category3) {
		int numPerPage = 9;
		HashMap<String, String> map2 = new HashMap<String, String>();
		map2.put("category", category);
		map2.put("category2", category2);
		map2.put("category3", category3);
		
		
		int totalCount = dao.totalSearchShop2(map2);
		System.out.println(totalCount);
		//총 페이지수 연산
		int totalPage = 0;
		if(totalCount % numPerPage == 0) {
			totalPage = totalCount / numPerPage;
		}else {
			totalPage = totalCount / numPerPage +1;
		}
		// 조회해올 게시물 시작번호와 끝번호 연산
		
		int start = (reqPage - 1)* numPerPage+1;
		int end = (reqPage)* numPerPage;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("category2", category2);
		map.put("category3", category3);
		
		map.put("start",String.valueOf(start));
		map.put("end", String.valueOf(end));
		List list = dao.shopSearchList2(map);
		/* ArrayList<Notice> li = (ArrayList<Notice>)list; */
		
		String pageNavi = "";
		int pageNaviSize = 9;
		int pageNo = ((reqPage -1) / pageNaviSize) * pageNaviSize +1;
		if (pageNo != 1) {
			pageNavi += "<a class='btn' href='noticeList.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/noticeList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/noticeList.do?reqPage="+pageNo+"'>다음</a>";
		}
		
		ShopPageDate spd = new ShopPageDate();
		spd.setList((ArrayList<ProductVO>)list);
		spd.setPageNavi(pageNavi);
		return spd;
	}

	public ProductVO selectProduct(int pno) {
		
		return dao.selectProduct(pno);
	}

	public int insertBasket(Basket bk) {
		// TODO Auto-generated method stub
		return dao.insertBasket(bk);
	}

	public List selectBasket(int memberNo) {
		// TODO Auto-generated method stub
		return dao.selectBasket(memberNo);
	}

	public List selectBasketProduct( ) {
		// TODO Auto-generated method stub
		return dao.selectBasketList();
	}

	/*
	 * public int deleteBasket(int pno, int memberNo) { // TODO Auto-generated
	 * method stub return dao.deleteBasket(pno,memberNo); }
	 */

	
	
		
}
