package kr.co.healthner.shop.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.healthner.shop.model.dao.ShopDao;
import kr.co.healthner.shop.model.vo.BuyProductVO;
import kr.co.healthner.shop.model.vo.PurchaseData;
import kr.co.healthner.shop.model.vo.PurchasePageData;
import kr.co.healthner.shop.model.vo.ShopPageDate;
import kr.co.healthner.vo.Basket;
import kr.co.healthner.vo.ProductVO;
import kr.co.healthner.vo.PurchaseVO;

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
			pageNavi += "<a class='btn' href='/healthner/shop/shop.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/healthner/shop/shop.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/healthner/shop/shop.do?reqPage="+pageNo+"'>다음</a>";
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
			pageNavi += "<a class='btn' href='/healthner/shop/shop?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/healthner/shop/shop?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/healthner/shop/shop?reqPage="+pageNo+"'>다음</a>";
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
			pageNavi += "<a class='btn' href='/healthner/shop/shop.do?reqPage=" + (pageNo - pageNaviSize) + "'>이전</a>";
		}
		for (int i = 0; i<pageNaviSize;i++) {
			if (reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>" + pageNo + "</span>";
			}else {
				pageNavi += "<a class='btn' href='/healthner/shop/shop.do?reqPage=" + pageNo + "'>" + pageNo + "</a>";
			}
			pageNo++;
			if(pageNo>totalPage) {
				break;
			}
		}
		if (pageNo < totalPage) {
			pageNavi += "<a class='btn' href='/healthner/shop/shop?reqPage="+pageNo+"'>다음</a>";
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

	public List selectBasketProduct(int memberNo ) {
		// TODO Auto-generated method stub
		return dao.selectBasketList(memberNo);
	}

	
	public int deleteBasket(Basket bk) {
	 
	return dao.deleteBasket(bk); 
	}

	public int insertPurchase(PurchaseVO pv) {
		// TODO Auto-generated method stub
		return dao.insertPurchase(pv);
	}

	public int selectBuyNo() {
		// TODO Auto-generated method stub
		return dao.selectBuyNom();
	}


	public int insertBuyProduct(ArrayList<BuyProductVO> list) {
		
		try {
			for (BuyProductVO buy: list) {
				dao.insertBuyProduct(buy);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public int deleteAllBasket(int memberNo) {
		// TODO Auto-generated method stub
		return dao.deleteAllBasket(memberNo);
	}

	public PurchasePageData userBuy(int reqPage, int memberNo) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("memberNo", memberNo);
		
		int totalCount = dao.totalPurchaseCount(map);
		int numPerPage = 10;
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
		
		List<PurchaseVO> list = dao.selectPurchaseList(map);
		
		int pageSize = 10;
		StringBuffer pageNavi = new StringBuffer();
		int pageNo = (reqPage - 1) / pageSize * pageSize + 1;
		
		if (pageNo != 1) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/shop/myBuyList.do?reqPage=" + (pageNo - 1) + "'>이전</a>");
		}
		
		for (int i = 0; i < pageSize; i++) {
			
			if (pageNo == reqPage) {
				pageNavi.append("<span class='span span-primary'>" + pageNo + "</span>");
			} else {
				pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/shop/myBuyList.do?reqPage=" + pageNo + "'>" + pageNo + "</a>");
			}
			
			pageNo++;
			
			if (pageNo > totalPage) {
				break;
			}
		}
		
		if (pageNo <= totalPage) {
			pageNavi.append("<a class='btn btn-outline-primary' href='/healthner/shop/myBuyList.do?reqPage=" + pageNo + "'>다음</a>");
		}
		
		PurchasePageData data = new PurchasePageData();
		data.setPageNavi(pageNavi.toString());
		data.setList((ArrayList<PurchaseVO>)list);
		
		return data;
	}

	public PurchaseData myBuyData(int buyNo) {
		
		PurchaseVO purchase = dao.selectPurchase(buyNo);
		List<BuyProductVO> list = dao.selectBuyProductList(buyNo);
		
		PurchaseData data = new PurchaseData();
		data.setList((ArrayList<BuyProductVO>)list);
		data.setPurchase(purchase);
		
		return data;
	}

	public int modifyBuyProduct(ArrayList<BuyProductVO> list) {
		// TODO Auto-generated method stub
		try {
			for (BuyProductVO buy: list) {
				dao.modifyBuyProduct(buy);
			}
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	

	
			
}
