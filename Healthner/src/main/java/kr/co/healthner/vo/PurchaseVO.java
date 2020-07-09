package kr.co.healthner.vo;

import lombok.Data;

@Data
public class PurchaseVO {
	private int buyNo;
	private int memberNo;
	private int totalPrice;
	private String buyDate;
	private String buyAddr;
	private int deliveryBool;
	private String invoicNumber;
}
