package kr.co.healthner.admin.model.vo;

import lombok.Data;

@Data
public class PTmapping {
	private String trainerProfile;
	private String trainerName;
	private String catFirst;
	private String catSecond;
	private String catThird;
	private String memberProfile;
	private String memberName;
	private String expireDate;
	private int trainingLeft;
	private String searchWord;
	private int checkbox1;
	private int start;
	private int end;
	private int memberType;
}