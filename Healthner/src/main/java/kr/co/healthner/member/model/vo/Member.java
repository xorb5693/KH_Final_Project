package kr.co.healthner.member.model.vo;

import lombok.Data;

@Data
public class Member {
	private int memberNo;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberNick;
	private String zip;
	private String roadAddr;
	private String detAddr;
	private String card;
	private String enrollDate;
	private int memberLevel;
	private char gender;
	private int age;
	private String memberProfile;
	private String email;
	private String expireDate;
	private String phone;
	private int emailVerification;
	private int rnum;
}
