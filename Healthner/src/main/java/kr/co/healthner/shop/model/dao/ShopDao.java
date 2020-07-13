package kr.co.healthner.shop.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.shop.model.vo.BuyProductVO;
import kr.co.healthner.vo.Basket;
import kr.co.healthner.vo.ProductVO;
import kr.co.healthner.vo.PurchaseVO;

@Repository("shopDao")
public class ShopDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public int totalShop() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.totalShop");
	}

	public List shopList(HashMap<String, Integer> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.shopList",map);
	}

	public int totalSearchShop(HashMap<String, String> map2) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.shopSearchCount");
	}

	public List shopSearchList(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.shopSearchList",map);
	}

	public int totalSearchShop2(HashMap<String, String> map2) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.shopSearchCount2");
	}

	public List shopSearchList2(HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("shop.shopSearchList2",map);
	}

	public ProductVO selectProduct(int pno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("shop.shopSelectOne",pno);
	}

	public int insertBasket(Basket bk) {
		// TODO Auto-generated method stub
		return sqlSession.insert("basket.insertBasket",bk);
	}


	public List selectBasket(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("basket.selectBasket",memberNo);
	}

	public List selectBasketList(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("basketVO.selectBasketList",memberNo);
	}

	public int deleteBasket(Basket bk) {
		// TODO Auto-generated method stub
		return sqlSession.delete("basket.deleteBasket",bk);
	}

	public int insertPurchase(PurchaseVO pv) {
		// TODO Auto-generated method stub
		return sqlSession.insert("purchase.insertPurchase",pv);
	}

	public int selectBuyNom() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("purchase.selectBuyNom");
	}

	public int insertBuyProduct(BuyProductVO buy) {
//		List<buyProductVO> list = (List<buyProductVO>)map.get("list");
//		for(buyProductVO bp : list) {
//			sqlSession.insert("buyProduct.insertBuyProduct",map);
//		}
		return sqlSession.insert("buyProduct.insertBuyProduct",buy);
	}

	public int deleteAllBasket(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("basket.deleteAllBasket",memberNo);
	}

	public int totalPurchaseCount(HashMap<String, Integer> map) {
		
		return sqlSession.selectOne("shop.totalPurchaseCount", map);
	}

	public List<PurchaseVO> selectPurchaseList(HashMap<String, Integer> map) {
		
		return sqlSession.selectList("shop.selectPurchaseList", map);
	}

	public PurchaseVO selectPurchase(int buyNo) {
		
		return sqlSession.selectOne("shop.selectPurchase", buyNo);
	}

	public List<BuyProductVO> selectBuyProductList(int buyNo) {
		
		return sqlSession.selectList("shop.selectBuyProductList", buyNo);
	}

	public int modifyBuyProduct(BuyProductVO buy) {
		return sqlSession.update("admin.modifyBuyProduct",buy);
		
	}

	

	
	
	
	

}
