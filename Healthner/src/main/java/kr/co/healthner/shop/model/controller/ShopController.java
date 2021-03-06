package kr.co.healthner.shop.model.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import kr.co.healthner.member.model.vo.Member;
import kr.co.healthner.shop.model.service.ShopService;
import kr.co.healthner.shop.model.vo.BuyProductVO;
import kr.co.healthner.shop.model.vo.PurchaseData;
import kr.co.healthner.shop.model.vo.PurchasePageData;
import kr.co.healthner.shop.model.vo.ShopPageDate;
import kr.co.healthner.vo.Basket;
import kr.co.healthner.vo.ProductVO;
import kr.co.healthner.vo.PurchaseVO;

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
		model.addAttribute("category", category);
		model.addAttribute("category2", category2);
		model.addAttribute("category3", category3);
		if(pname==null) {
			ShopPageDate spb = service.searchProductList2(reqPage,category,category2,category3);
			model.addAttribute("list",spb.getList());
			model.addAttribute("navi",spb.getPageNavi());
			return "shop/shop";
		}else {
			ShopPageDate spb = service.searchProductList(reqPage,category,category2,category3,pname);
			model.addAttribute("pname", pname);
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
			return "redirect:/healthner/shop/basketList.do?memberNo="+memberNo;
		}else {
			System.out.println("장부긴실패");
			return "shop/shop";
		}
	}
	@RequestMapping(value="/basketList.do")
	public String basketList(int memberNo , Model model) {
		List bk = service.selectBasket(memberNo);
		List bv = service.selectBasketProduct(memberNo);
		
		model.addAttribute("list",bk);
		model.addAttribute("pv",bv);
		System.out.println(bk);
		System.out.println(bv);
		return "shop/basket";
	}
	
	@RequestMapping(value="/deleteBasket.do")
	public String deleteBasket(Basket bk){
		System.out.println("바스켓딜리트실험 "+bk.getPno());
		System.out.println("바스켓딜리트실험 "+bk.getMemberNo());
		int result = service.deleteBasket(bk);
		if(result>0) {
			System.out.println("장바구니비우기성공");
		}else {
			System.out.println("장바구니비우기실패");
		}
		return "redirect:/healthner/shop/basketList.do?memberNo="+bk.getMemberNo();
	}
	
	ArrayList<BuyProductVO> list = null;
	
	@RequestMapping(value="/buy.do")
	public String test(String[] array2 , String[] array3 , Member m , int totalPrice , Model model , HttpSession se) {
		list = new ArrayList<BuyProductVO>();
		String[] arrayPno = array2; // 받아온 상품넘버 배열  
		String[] arrayStock = array3;  // 받아온 상품들 숫자 배열  두개로 db값 수정		
		for(int i=0;i<arrayPno.length;i++) {
			BuyProductVO bp = new BuyProductVO();
			System.out.println(arrayPno[i]);
			bp.setPno((Integer.parseInt(arrayPno[i])));
			bp.setStock((Integer.parseInt(arrayStock[i])));
			list.add(bp);
		}
		PurchaseVO pv = new PurchaseVO();
		pv.setMemberNo(m.getMemberNo());
		pv.setTotalPrice(totalPrice);
		pv.setBuyAddr(m.getZip()+m.getRoadAddr()+m.getDetAddr());
		model.addAttribute("p",pv); // 거래진행시 필요한 정보
		
		
		// 결제페이지로 넘어갈것 정보는? totalPrice , zip , road , det , memberNo 5개 전달
		return "shop/pay";
		
		
	}
	@RequestMapping(value="/paySuccess.do")
	public String paySuccess(int memberNo , int totalPrice , String buyAddr) {
		
		System.out.println(memberNo); // 거래성공한 멤버넘버
		System.out.println(totalPrice); // 거래성공한 금액
		System.out.println(buyAddr); // 거래성공한 주소
		System.out.println(list); // 거래성공한 물품목록,수량 buy_product 에 넣을것
		PurchaseVO pv = new PurchaseVO();
		pv.setBuyAddr(buyAddr);
		pv.setMemberNo(memberNo);
		pv.setTotalPrice(totalPrice);
		System.out.println("거래완료 어디까지 되고있나 1");
		int result = service.insertPurchase(pv);
		int buyNo = service.selectBuyNo(); // 해당 거래넘버값 구해옴
		
		System.out.println("거래넘버 : "+buyNo);
		
		for(int i=0;i<list.size();i++) {
			((BuyProductVO)list.get(i)).setBuyNo(buyNo);
		}
		
		System.out.println("거래완료 어디까지 되고있나 2");
		
		
//		HashMap<String,Object> map = new HashMap<String,Object>();
//		map.put("list", list);
		int result2 = service.insertBuyProduct(list);
		System.out.println("거래완료 어디까지 되고있나 3");
		int result4 = service.modifyBuyProduct(list);
		int result3 = service.deleteAllBasket(memberNo);
		
		System.out.println("거래완료 어디까지 되고있나 4");
		list = null;
		return "shop/basket";
	}

	//태규_배송추적 ajax
	@ResponseBody
	@RequestMapping(value = "/parcelTrace.do", produces = "application/json; charset=utf-8")
	public String parcelTrace(String invoiceNumber) {
		
		BufferedReader in = null;
		URL url;
		StringBuffer buffer = new StringBuffer();
		
		try {
			url = new URL("http://info.sweettracker.co.kr/api/v1/trackingInfo?t_key=BcQF777hPp8vOsG4hosRSQ&t_code=01&t_invoice=" + invoiceNumber);
			HttpURLConnection con = (HttpURLConnection) url.openConnection(); 
			con.setConnectTimeout(5000); //서버에 연결되는 Timeout 시간 설정
			con.setReadTimeout(5000); // InputStream 읽어 오는 Timeout 시간 설정

			con.setRequestMethod("GET");
			
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			
			String line;
			while ((line = in.readLine()) != null) {
				buffer.append(line);
			}
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		System.out.println(buffer.toString());

		return buffer.toString();
	}
	
	//개인 구매 리스트 페이지
	@RequestMapping("/myBuyList.do")
	public String myBuyList(HttpSession session, Model model, int reqPage) {
		
		Member m = (Member)session.getAttribute("member");
		
		PurchasePageData data = service.userBuy(reqPage, m.getMemberNo());
		model.addAttribute("list", data.getList());
		model.addAttribute("pageNavi", data.getPageNavi());
		
		return "shop/myBuyList";
	}
	
	//개인 구매 상세정보 페이지
	@RequestMapping("/myBuyRead.do")
	public String myBuyRead(Model model, int buyNo) {

		PurchaseData data = service.myBuyData(buyNo);
		
		model.addAttribute("purchase", data.getPurchase());
		model.addAttribute("list", data.getList());
		return "shop/myBuyRead";
	}
}
