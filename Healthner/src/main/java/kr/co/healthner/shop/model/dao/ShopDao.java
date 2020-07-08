package kr.co.healthner.shop.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.healthner.vo.Basket;
import kr.co.healthner.vo.BasketVO;
import kr.co.healthner.vo.ProductVO;

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
	
	
	

}
