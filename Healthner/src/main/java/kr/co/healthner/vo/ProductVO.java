package kr.co.healthner.vo;

import lombok.Data;

@Data
public class ProductVO {

	private int pno;
	private String pname;
	private String pcontent;
	private int price;
	private int stock;
	private int category;
	private int category2;
	private int category3;
	private String thumbnail;
}
