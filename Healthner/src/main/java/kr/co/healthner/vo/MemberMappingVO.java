package kr.co.healthner.vo;

import lombok.Data;

@Data
public class MemberMappingVO {

	private int mappingSeq;
	private int memberNo;
	private int trainerNo;
	private int trainingCnt;
	private int trainingMaxcnt;
}
