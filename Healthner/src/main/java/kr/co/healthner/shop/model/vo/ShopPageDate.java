package kr.co.healthner.shop.model.vo;

import java.util.ArrayList;

import kr.co.healthner.vo.ProductVO;
import lombok.Data;
@Data
public class ShopPageDate {
	private String pageNavi;
	private ArrayList<ProductVO> list;

}
