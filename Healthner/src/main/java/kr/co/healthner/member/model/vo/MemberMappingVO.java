package kr.co.healthner.member.model.vo;

import lombok.Data;

@Data
public class MemberMappingVO {

	private int mappingSeq;
	private int memberNo;
	private int trainerNo;
	private int trainingCnt;
	private int trainingMaxcnt;
	private String trainingPostscript;
	private String trainerName;
}
