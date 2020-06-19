package kr.co.healthner.vo;

import lombok.Data;

@Data
public class PurchaseVO {

	private int memberNo;
	private int pno;
	private int stock;
	private int buyNo;
	private String buyDate;
	private String buyAddr;
}
