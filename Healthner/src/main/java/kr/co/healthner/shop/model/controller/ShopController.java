package kr.co.healthner.shop.model.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.annotation.SessionScope;

import kr.co.healthner.shop.model.service.ShopService;
import kr.co.healthner.shop.model.vo.ShopPageDate;
import kr.co.healthner.vo.Basket;
import kr.co.healthner.vo.BasketVO;
import kr.co.healthner.vo.ProductVO;

@Controller
@RequestMapping(value="healthner/shop")
public class ShopController {
	
	@Autowired
	@Qualifier("shopService")
	private ShopService service;
	
	@RequestMapping(value="/shop.do")
	public String shop(int reqPage,Model model) {
		ShopPageDate spb = service.shopList(reqPage);
		model.addAttribute("list",spb.getList());
		model.addAttribute("navi",spb.getPageNavi());		
		return "shop/shop";
	}
	
	@RequestMapping(value="/productSearchList.do")
	public String searchProduct(String category,String category2,String category3,String pname, int reqPage,Model model) {
		System.out.println(category);
		System.out.println(category2);
		System.out.println(category3);
		System.out.println(pname);
		if(pname==null) {
			ShopPageDate spb = service.searchProductList2(reqPage,category,category2,category3);
			model.addAttribute("list",spb.getList());
			model.addAttribute("navi",spb.getPageNavi());
			return "shop/shop";
		}else {
			ShopPageDate spb = service.searchProductList(reqPage,category,category2,category3,pname);
			model.addAttribute("list",spb.getList());
			model.addAttribute("navi",spb.getPageNavi());
			return "shop/shop";
		}
		
	}
	@RequestMapping(value="/shopView.do")
	public String shopView(int pno , Model model) {
		System.out.println(pno);
		ProductVO p = service.selectProduct(pno);
		model.addAttribute("p",p);
		return "shop/shopView";
	}
	@RequestMapping(value="/basket.do")
	public String basket(ProductVO p , int memberNo) {
		System.out.println("장바구니확인" +p);
		System.out.println("멤버넘버확인"+memberNo);
		Basket bk = new Basket();
		bk.setStock(p.getStock());
		bk.setPno(p.getPno());
		bk.setMemberNo(memberNo);
		int result = service.insertBasket(bk);
		if(result>0) {
			System.out.println("장바구니등록성공");
			return "shop/shop";
		}else {
			System.out.println("장부긴실패");
			return "shop/shop";
		}
	}
	@RequestMapping(value="/basketList.do")
	public String basketList(int memberNo , Model model) {
		List bk = service.selectBasket(memberNo);
		List bv = service.selectBasketProduct();
		
		model.addAttribute("list",bk);
		model.addAttribute("pv",bv);
		System.out.println(bk);
		System.out.println(bv);
		return "shop/basket";
	}
	
//	@RequestMapping(value="/deleteBasket.do")
//	public String deleteBasket(int pno,int memberNo){
//		System.out.println("바스켓딜리트실험 "+pno);
//		System.out.println("바스켓딜리트실험 "+memberNo);
//		int result = service.deleteBasket(pno,memberNo);
//		if(result>0) {
//			System.out.println("장바구니비우기성공");
//		}else {
//			System.out.println("장바구니비우기실패");
//		}
//		
//		
//		return null;
//	}

}
