package kr.co.healthner.shop.model.vo;

import java.util.ArrayList;

import kr.co.healthner.vo.PurchaseVO;
import lombok.Data;

@Data
public class PurchasePageData {

	private ArrayList<PurchaseVO> list;
	private String pageNavi;
}
