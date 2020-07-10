package kr.co.healthner.shop.model.vo;

import lombok.Data;
@Data
public class BuyProductVO {
	private int buyNo;
	private int pno;
	private int stock;
	private int price;
	private String pname;
	private String thumbnail;
}
